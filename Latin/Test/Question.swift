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
    private let db:SQLiteDatabase
    private let formEnding: String
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
        self.db = db
        for part in form{
            formString.append(part)
            formString.append(",")
        }
        formString = String(formString.dropLast()) //remove the last comma
        // this is so we get the form answer correct when the user is tested on only vocab
        var formList:[String] = formString.split(separator: ",",omittingEmptySubsequences: false).map { String($0) }
        formEnding = formList.last! // if we need to get the form id later
        formList = formList.dropLast() // remove the conjunction number makes things more complicated
        var reducedFormList: String = ""
        for part in formList{
            reducedFormList.append(",\(part)")
        }
        formString = String(reducedFormList.dropFirst()) //remove first comma
        let NSFormList = form as [NSString]
        formID = db.GetFromID(formList: NSFormList) ?? -1
        print("\(latinWord.firstPrincipalPart) \(formID)")
    }
    func checkAnswer()->Bool{
        vocabAnswer = format(str: vocabAnswer)
        if translations.contains(vocabAnswer.lowercased()){
             isVocabCorrect=true
        }
        if formAnswer == formString{
            isFormCorrect = true
        }else{
            //If the user puts in a form answer which leads to the same word. For example most nouns in the nomitive form are the same in the vocative form
            let alternateFormAnswer = latin.GetForm(formString: formAnswer.split(separator: ",",omittingEmptySubsequences: false).map{String($0)})
            if alternateFormAnswer == latinString{
                isFormCorrect = true
                formString = formAnswer
                var formList:[String] = formString.split(separator: ",",omittingEmptySubsequences: false).map { String($0) }
                formList.append(formEnding)
                let NSFormList = formList as [NSString]
                formID = db.GetFromID(formList: NSFormList) ?? -1
            }
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
    func GetFeedBack()-> String{
        
        let feedback =  latin.GetFeedback(formAnswer: formString, incorrectForm: formAnswer).joined(separator: "/r")
        return feedback
    }
}

// 3-4 different answers will be shown, only one is correct
class MultiplechoiceQuestion:Question{
    private var correctIndex:Int = -1 //the index of the correct answer
    public var answerSelection:[String] = []
    init(latinWord: Word,form: [String],db:SQLiteDatabase,quiz:Quiz){
        for _ in 1...3{
            let wordtypeSplit = form[5].split(separator: " ",omittingEmptySubsequences: false)
            
            let type = WordTypes.init(rawValue: String(wordtypeSplit[0])) ?? WordTypes.Verb
            let randomWord: Word = quiz.GetRandomWord(wordType: type)!
            answerSelection.append(randomWord.translations[0])
            }
        super.init(latinWord: latinWord, form: form, db: db)
        correctIndex = Int.random(in: 0...3)
        answerSelection.insert(translations[0], at: correctIndex)
    }
}

