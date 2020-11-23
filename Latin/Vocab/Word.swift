//
//  word.swift
//  Latin
//
//  Created by Kenan Palmer on 09/10/2020.
//

import Foundation
class Word{
    public var id:Int
    public var translations:[String]
    private var principalParts:[String]
    private var translationIndex:Int
    init(){
        id=0
        principalParts=[""]
        translations=[""]
        translationIndex=0
    }
    func get_translation() -> String{
        return translations[translationIndex]
    }
    func next_translation(){
        translationIndex+=1
        translationIndex %= translations.count
    }
}
