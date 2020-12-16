//
//  Question.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import Foundation
class Question{
    public var latin: String
    public var form: String
    public var vocabTranslations: [String]
    public var formTranslation: String
    public var correct:Bool = false
    init(word:Word, form:String){
        //vocabTranslations = word.get_all_translations()
        //let wordType = String(describing: type(of: word))
        self.latin = word.fileLine
        self.form = "testForm"
        self.vocabTranslations = ["testTranslation1","testTranslation2"]
        self.formTranslation = "testFormTranslation"
    }
}
