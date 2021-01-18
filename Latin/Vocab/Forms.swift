//
//  Forms.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import Foundation
enum WordTypes: String, CaseIterable{
    case Verb = "verb"
    case Noun = "noun"
    case Adjective = "adjective"
    case Adverb = "adverb"
    case Conjunction = "conjunction"
    case Preposition = "preposition"
    case unknown = "error unknown word type"
}
enum NounDeclension: CaseIterable{
    case First
    case Second
    case Third
    case Fourth
    case Fifth
    case unknown
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
    case unknown = "error unknown conjugation"
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
