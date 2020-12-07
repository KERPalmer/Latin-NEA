//
//  conjunctions.swift
//  Latin
//
//  Created by Kenan Palmer on 03/12/2020.
//

import Foundation
class Conjunction: Word {
    public var followedBy: String
    public var word: String
    override init(line:String, id_:Int){
        if line.contains("subjunctive"){
            followedBy = "subjunctive"
        }else if line.contains("indicative"){
            followedBy = "indicative"
        }else{
            followedBy = "none"
        }
        let commaSplit = line.split(separator: ",",omittingEmptySubsequences: true).map{ String($0) }
        word = format(str: commaSplit[0])
        super.init(line: line,id_: id_)
        
        
    }
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
