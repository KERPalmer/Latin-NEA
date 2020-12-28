//
//  Question.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import Foundation
class Question{
    public var latin: String = ""
    public var form: String = ""
    public var vocabTranslations: [String]
    public var formTranslation: String
    public var correct:Bool = false
    init(){
        //vocabTranslations = word.get_all_translations()
        //let wordType = String(describing: type(of: word))
        self.latin = "test word"
        self.form = "test Form"
        self.vocabTranslations = ["testTranslation1","testTranslation2"]
        self.formTranslation = "testFormTranslation"
    }
}
