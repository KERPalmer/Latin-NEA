//
//  SwiftUIView.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 06/08/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import SwiftUI
class Practise:ObservableObject{
    @Published public var testedNum:Int=0
    @Published public var correctNum:Int=0
    @Published public var AvaliableTypes:[String]=[]
    @Published public var testingVerbs:Bool = true
    @Published public var testingNouns:Bool = false
    @Published public var testingPrepositions:Bool = false
    @Published public var isMultipleChoice:Bool = false
    @Published public var isVocabPractise:Bool = true
    @Published public var VerbList:[Verb]=PROGRAMDATABASE.verbClassList
    @Published public var NounList:[Noun]=PROGRAMDATABASE.nounClassList
    @Published public var preposition:[Preposition]=PROGRAMDATABASE.prepositionClassList
    @Published public var wordType:String = "none picked"
    @Published public var question:Question=Question(latin: "none picked",English: ["none picked"])
    @Published public var previousQuestions:[Question]=[]
    init(){
    }
    func checkAnswer(answer:String)->Bool{
        var correct = false
        for english in question.englishTranslations{
            if english.lowercased().trimmingCharacters(in: .whitespaces) == answer.lowercased().trimmingCharacters(in: .whitespaces){
                correct = true
            }
        }
        return correct
    }
    func setWordType(type:String){
        wordType=type
    }
    func setRandomWordType(){
        let randomInt=Int.random(in: 0..<AvaliableTypes.count)
        wordType=AvaliableTypes[randomInt]
    }
    func setVocabQuestion(){
        var randomInt:Int
        if (wordType=="verbs"){
            randomInt = Int.random(in: 0...PROGRAMDATABASE.verbClassList.count-1)
        question = Question(latin: PROGRAMDATABASE.verbClassList[randomInt].present1S, English: PROGRAMDATABASE.verbClassList[randomInt].translation)
        }else{
            question.latinWord = "not implimented"
        }
    }
}
class Question: Identifiable{
    @Published public var latinWord:String
    @Published public var englishTranslations:[String]
    @Published public var correct:Bool = false
    init(latin:String,English:[String]){
        latinWord=latin
        englishTranslations=English
    }
    func GetBackgroundColor()->Color{
        if correct{
            return .green
        }else{
            return .red
        }
    }
}
