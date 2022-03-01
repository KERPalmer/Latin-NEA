//
//  irregularNouns.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 04/10/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//
//NOUN IRREGULAR - THIS SMALL SUB CLASS WILL DEAL WITH IRREGULAR NOUNS 
import Foundation
class IrregularNoun:Noun{
    override func GetDeclension(choice: caseNum) -> String {
        switch nominativeS{
        case "nemo":
            switch choice{
            case .NomSingular:
                return "nemo"
            case .VocSingular:
                return "nemo"
            case .AccSingular:
                return "neminem"
            case .GenSingular:
                return "neminis"
            case .DatSingular:
                return "nemini"
            case .AblSingular:
                return "nemine"
            case .NomPlural:
                return "nemines"
            case .VocPlural:
                return "nemines"
            case .AccPlural:
                return "nemines"
            case .GenPlural:
                return "neminum"
            case .DatPlural:
                return "nemibus"
            case.AblPlural:
                return "neminibus"
            }
        case "nihil":
            return "nihil"
        default:
        return "COULD NOT FIND IRREGULAR NOUN"
        }
    }
}
