//
//  Question.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import Foundation
import SwiftUI //for colours
class Question: Identifiable{
    public let latin: Word //the word that will be tested, used to get ID and other forms
    public let latinString: String //the string that will be shown
    public let translations: [String] //the english version of the latin word
    public var formID: Int32
    public var formAnswer:String = "" //the form answer given by the user
    public var formString: String = "" //the correct form answer
    public var vocabAnswer: String = "" // the vocab answer given by the user
    private var isVocabCorrect: Bool = false
    private var isFormCorrect: Bool = false
    
    //isCorrect would be protected but no such protection level
    
    public var isCorrect: Bool = false
    private let correctColor = Color.green
    private let wrongColor = Color.red
    
    init(latinWord: Word,form: [String],db:SQLiteDatabase){
        latin = latinWord
        translations = latin.translations
        latinString = latinWord.GetForm(formString: form)
        for part in form{
            formString.append(part)
            formString.append(",")
        }
        formString = String(formString.dropLast()) //remove the last comma
        let NSFormList = form as [NSString]
        formID = db.GetFromID(formList: NSFormList) ?? -1
    }
    func checkAnswer()->Bool{
        vocabAnswer = format(str: vocabAnswer)
        if translations.contains(vocabAnswer.lowercased()){
             isVocabCorrect=true
        }
        if formAnswer == formString{
            isFormCorrect = true
        }
        if isVocabCorrect && isFormCorrect{
            isCorrect = true
            return true
        }
        return false
    }
    func GetColor()->Color{
        if isCorrect{
            return correctColor
        }
        return wrongColor
    }
}

// 3-4 different answers will be shown, only one is correct
class MultiplechoiceQuestion:Question{
    
}
//the user will have to type in the answer
class VocabQuestion:Question{
}
