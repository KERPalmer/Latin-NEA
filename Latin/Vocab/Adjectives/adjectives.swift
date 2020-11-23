//
//  adjectives.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 15/07/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import Foundation
//altus ,"alta, altum",adjective 1/2,"high, deep"
class Adjective:Codable, Identifiable{
    let id:Int
    //let masc:String
    //let fem:String
    //let neu:String
    let fileLine:String
    init(line:String,id_:Int) {
        id=id_
        fileLine=line
        var genders:[String]
        let trimmed:String=fileLine.replacingOccurrences(of: "\r", with: "")
        let seperated=(trimmed.split(separator: "\"", omittingEmptySubsequences: true)).map { String($0) }
        // set the genders
        genders=seperated[0].split(separator: ",",omittingEmptySubsequences: true).map{ String($0)}
       // masc=String(genders[0])
        //fem=String(genders[1])
        //neu=String(genders[2])
    }
}
//no first adjective
class SecondAdjective:Adjective{
}
class ThridAdjective:Adjective{
    
}
