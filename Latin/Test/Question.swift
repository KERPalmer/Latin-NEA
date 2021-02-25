//
//  Question.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import Foundation
import SwiftUI
//THE QUESTION DATABASE HOLD THE INFOMATION ABOUT ONE QUESTION. IT WILL BE CREATED BY THE QUIZ, DISPLAYED TO THE USER AND THEN PASSED TO THE SQLDATABASE TO STORE THE RESULTS

// A QUESTION WHERE IT IS WRITTEN IN 
class Question: Identifiable{
    public let latin: Word //the word that will be tested, used to get ID and other forms
    public let latinString: String //the string that will be shown
    public let translations: [String] //the english version of the latin word
    public var formID: Int32
    public var formAnswer:String //the form answer given by the user
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
        // this is so we get the form answer correct when the user is tested on only vocab
        var formList:[String] = formString.split(separator: ",",omittingEmptySubsequences: false).map { String($0) }
        formList = formList.dropLast()
        var reducedFormList: String = ""
        for part in formList{
            reducedFormList.append(",\(part)")
        }
        formAnswer = String(reducedFormList.dropFirst()) //remove first comma
        let NSFormList = form as [NSString]
        formID = db.GetFromID(formList: NSFormList) ?? -1
        print(formID)
    }
    func checkAnswer()->Bool{
        vocabAnswer = format(str: vocabAnswer)
        if translations.contains(vocabAnswer.lowercased()){
             isVocabCorrect=true
        }
        // remove the type part of the form string
        var formList:[String] = formString.split(separator: ",",omittingEmptySubsequences: false).map { String($0) }
        formList = formList.dropLast()
        var reducedFormList: String = ""
        for part in formList{
            reducedFormList.append(",\(part)")
        }
        reducedFormList = String(reducedFormList.dropFirst())
        if formAnswer == reducedFormList{
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

