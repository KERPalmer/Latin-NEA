//
//  preposition.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 14/07/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import Foundation
class Preposition:Identifiable,Codable{
    let fileLine:String
    let word:String
    let followedBy:String
    var isAccusative:Bool = false
    var isPrefix:Bool = false
    let translation:[String]
    init(string:String){
        fileLine=string
        //from 1: word, +ablative?/accusative?(prefix)?, preposition, translation
        //form 2: word, +ablative?/accusative?(prefix)?, preposition, "translation,translation..."
        //form 3: "word,word", +ablative?/accusative?(prefix)?, preposition, "translation,translation..."
        if fileLine.contains("prefix"){
            isPrefix=true
        }
        if fileLine.contains("accusative"){
            isAccusative = true
        }
        if fileLine.contains("\""){
            //from 2/3
            let seperated=fileLine.split(separator:"\"",omittingEmptySubsequences: true).map{String($0)}
            if seperated.count==4{
                word=format(str: seperated[0])
                translation=seperated[2].split(separator: ",").map{String($0)}
                let theRest=seperated[1].split(separator: ",",omittingEmptySubsequences: true).map{String($0)}
                followedBy=format(str: theRest[0])
            }else{
                translation=seperated[1].split(separator: ",").map{String($0)}
                let theRest=seperated[0].split(separator: ",",omittingEmptySubsequences: true).map{String($0)}
                word=format(str: theRest[0])
                followedBy=format(str: theRest[1])
            }
        }else{
            //from 1
            let seperated=fileLine.split(separator:",").map{String($0)}
            word=format(str: seperated[0])
            followedBy=format(str: seperated[1])
            translation=[format(str: seperated[3])]
        }
    }
}
