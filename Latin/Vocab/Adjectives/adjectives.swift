//
//  adjectives.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 15/07/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import Foundation
class Adjective:Word{
    override init(line: String, id_: Int){
        super.init(line: line, id_: id_)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
//altus ,"alta, altum",adjective 1/2,"high, deep"
class FirstSecondAdjective:Adjective{
    public let mascNom:String
    public let femNom:String
    public let neuNom:String
    override init(line:String,id_:Int){
        let trimmed:String=line.replacingOccurrences(of: "\r", with: "") // remove line break
        let seperated=(trimmed.split(separator: "\"", omittingEmptySubsequences: true)).map { String($0) }// seperate parts
        // set the genders
        var genders:[String]
        genders=seperated[1].split(separator: ",",omittingEmptySubsequences: true).map{ String($0)}
        self.mascNom=String(format(str: seperated[0]))
        self.femNom=String(genders[0])
        self.neuNom=String(genders[1])
        super.init(line: line, id_: id_)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
//brevis ,breve,adjective 3,"short, brief"
//tristis ,triste,adjective 3,sad
class ThirdAdjective:Adjective{
    private let masNom:String
    private let masGen:String
    override init(line:String,id_:Int){
        let trimmed:String=line.replacingOccurrences(of: "\r", with: "") // remove line break
        let commaSplit = trimmed.split(separator: ",", omittingEmptySubsequences: true)
        self.masNom = format(str: String(commaSplit[0]))
        self.masGen = format(str: String(commaSplit[1]))
        super.init(line: line, id_: id_)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
//quot? ,indeclinable,adjective,how many?
class IndeclinableAdjective :Adjective{
    private let latin:String
    override init(line:String,id_:Int) {
        let trimmed:String=line.replacingOccurrences(of: "\r", with: "") // remove line break
        let commaSplit = trimmed.split(separator: ",",omittingEmptySubsequences: true)
        self.latin = format(str: String(commaSplit[0]))
        super.init(line:line,id_:id_)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
