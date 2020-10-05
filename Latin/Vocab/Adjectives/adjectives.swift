//
//  adjectives.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 15/07/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import Foundation
class Adjective:Codable, Identifiable{
    let id:Int
    let fileLine:String
    init(line:String,id_:Int) {
        id=id_
        fileLine=line
        // 2 main froms
        // 212 (masc: 2-us , fem: 1-a, neu: 2-um
    }
}
class ThridAdjective:Adjective{
    
}
