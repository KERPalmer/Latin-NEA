//
//  Forms.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import Foundation
enum WordTypes: String, CaseIterable{
    case Verb = "verb" //action words
    case Noun = "noun" //names of places people or things
    case Adjective = "adjective" //describtions of nouns
    case Adverb = "adverb" // describtions of verbs
    case Conjunction = "conjunction" //conections between clauses
    case Preposition = "preposition" //location from another 
    case Participal = "participal"
    case unknown = "error unknown word type"
}
enum AdjectiveDegree: String, CaseIterable{
    case positive = "positive"
    case comparative = "comparative"
    case superlatative = "superlatative"
}
enum AdjectiveDeclension: String, CaseIterable{
    case TwoOneTwo = "212"
    case third = "3"
    case adverb = "adverb"
}
enum NounDeclension:String, CaseIterable{
    case First = "1"
    case Second = "2"
    case Third = "3"
    case Fourth = "4"
    case Fifth = "5"
}
enum caseNum: String, CaseIterable {
    case NomSingular = "nom_s"
    case VocSingular = "voc_s"
    case AccSingular = "acc_s"
    case GenSingular = "gen_s"
    case DatSingular = "dat_s"
    case AblSingular = "abl_s"
    case NomPlural = "nom_p"
    case VocPlural = "voc_p"
    case AccPlural = "acc_p"
    case GenPlural = "gen_p"
    case DatPlural = "dat_p"
    case AblPlural = "abl_p"
}
enum VerbConjugation:String, CaseIterable, Encodable{
    case First = "verb 1"
    case Second = "verb 2"
    case Third = "verb 3"
    case Fourth = "verb 4"
    case Irregular = "verb irregular"
}
enum Tense: String, CaseIterable{
    case Present = "pre"
    case imperfect = "imp"
    case perfect = "per"
    case pluperfect = "plu"
    case future = "fut"
    case infinitive = "inf"
}
enum PersonNum: String, CaseIterable {
    case FirstSingular = "1s"
    case SecondSingular = "2s"
    case ThirdSingular = "3s"
    case FirstPlural = "1p"
    case SecondPlural = "2p"
    case ThirdPlural = "3p"
}
enum Mood: String, CaseIterable{
    case indicative = "ind"
    case subjunctive = "sub"
}
enum Voice: String, CaseIterable{
    case passive = "Pas"
    case active = "act"
}
enum Gender: String, CaseIterable{
    case male = "m"
    case female = "f"
    case neuter = "n"
}
