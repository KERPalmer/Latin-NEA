//
//  adverb.swift
//  Latin
//
//  Created by Kenan Palmer on 07/12/2020.
//

import Foundation
class Adverb: Word{
    public let word:String
    override init(line:String, id_ : Int) {
        let commaSplit = line.split(separator: "," , omittingEmptySubsequences: true)
        word = format(str: String(commaSplit[0]))
        super.init(line: line, id_: id_)
    }
}
