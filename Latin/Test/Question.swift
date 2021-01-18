//
//  Question.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import Foundation
class Question{
    public let latin: Word
    public let latinString: String
    public let translations: [String]
    public var answer: String = ""
    //isCorrect would be protected but no such protection level
    public var isCorrect: Bool = false
    init(latinWord: Word ,wordString: String){
        latin = latinWord
        translations = latin.translations
        latinString = wordString
        
    }
    func checkAnswer()->Bool{
        if translations.contains(answer.lowercased()){
            isCorrect = true
            return true
        }
        return false
    }
}
//the user will type in the vocab and the different forms will be shown, they will select one
class FormQuestion:Question{
    public var form: [String] = []
    public var formString: String = ""
    public var formAnswer:String = ""
    public var vocabAnswer:String = ""
    private var isVocabCorrect:Bool = false
    private var isFormCorrect:Bool = false
    init(latinWord:Word,wordString:String, formList:[String]){
        form = formList
        for part in form{
            formString.append(part)
            formString.append(", ")
        }
        super.init(latinWord: latinWord, wordString: wordString)
    }
    override func checkAnswer()->Bool{
        if translations.contains(answer){
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
}
// 3-4 different answers will be shown, only one is correct
class MultiplechoiceQuestion:Question{
    
}
//the user will have to type in the answer
class VocabQuestion:Question{
}
