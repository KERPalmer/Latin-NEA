//
//  preposition.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 14/07/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import Foundation
class Preposition: Word{
    let word:String
    let followedBy:String
    var isAccusative:Bool = false
    var isPrefix:Bool = false
    override init(line: String, id_: Int){
        //from 1: word, +ablative?/accusative?(prefix)?, preposition, translation
        //form 2: word, +ablative?/accusative?(prefix)?, preposition, "translation,translation..."
        //form 3: "word,word", +ablative?/accusative?(prefix)?, preposition, "translation,translation..."
        if line.contains("prefix"){
            isPrefix=true
        }
        if line.contains("accusative"){
            isAccusative = true
        }
        if line.contains("\""){
            //from 2/3
            let seperated=line.split(separator:"\"",omittingEmptySubsequences: true).map{String($0)}
            if seperated.count==4{
                word=format(str: seperated[0])
                let theRest=seperated[1].split(separator: ",",omittingEmptySubsequences: true).map{String($0)}
                followedBy=format(str: theRest[0])
            }else{
                let theRest=seperated[0].split(separator: ",",omittingEmptySubsequences: true).map{String($0)}
                word=format(str: theRest[0])
                followedBy=format(str: theRest[1])
            }
        }else{
            //from 1
            let seperated=line.split(separator:",").map{String($0)}
            word=format(str: seperated[0])
            followedBy=format(str: seperated[1])
        }
        super.init(line: line, id_: id_)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
