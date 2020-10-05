//
//  Format.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 04/10/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import Foundation
//remove unwanted commas and whitespaces
func format(str:String)->String{
    var trim = str
    trim=trim.replacingOccurrences(of: ",", with: "")
    trim=trim.trimmingCharacters(in: .whitespacesAndNewlines)
    return trim
}
