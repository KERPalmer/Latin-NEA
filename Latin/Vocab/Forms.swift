//
//  Forms.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import Foundation
//FORMS - THIS HOLDS ALL THE DIFFERENT ENUMERATIONS OF THE PARTS EACH WORD CAN HAVE
enum WordTypes: String, CaseIterable, Encodable{
    case Verb = "verb" //action words
    case Noun = "noun" //names of places people or things
    case Adjective = "adjective" //describtions of nouns
    case Adverb = "adverb" // describtions of verbs
    case Conjunction = "conjunction" //conections between clauses
    case Preposition = "preposition" //location from another
    case unknown = "error unknown word type"
}
enum AdjectiveDegree: String, CaseIterable, Encodable{
    case positive = "positive"
    case comparative = "comparative"
    case superlatative = "superlatative"
    case adverb = "adverb"
    case indeclinable = "indeclinable"

}
enum AdjectiveDeclension: String, CaseIterable, Encodable{
    case TwoOneTwo = "adjective 212"
    case third = "adjective 3"
    case indeclinable = "adjective indeclinable"
}
enum NounDeclension:String, CaseIterable, Encodable{
    case First = "noun 1"
    case Second = "noun 2"
    case Third = "noun 3"
    case Fourth = "noun 4"
    case Fifth = "noun 5"
    case irregular = "noun irregular"

}
//IT IS ARGUABLE THAT CASE AND NUMBER SHOULD BE SEPERATE BUT NUMBER IS SO SMALL I THOUHGT IT WOULD BE EASIER TO USE IT LIKE THIS.
//IT ALSO MAKES SWITCHING THE DIFFERENT FORMS EASIER
enum caseNum: String, CaseIterable, Encodable{
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
enum Tense: String, CaseIterable, Encodable{
    case Present = "pre"
    case imperfect = "imp"
    case perfect = "per"
    case pluperfect = "plu"
    case future = "fut"
    case infinitive = "inf"
}
enum PersonNum: String, CaseIterable, Encodable {
    case FirstSingular = "1s"
    case SecondSingular = "2s"
    case ThirdSingular = "3s"
    case FirstPlural = "1p"
    case SecondPlural = "2p"
    case ThirdPlural = "3p"
}
enum Mood: String, CaseIterable, Encodable{
    case indicative = "ind"
    case subjunctive = "sub"
}
enum Voice: String, CaseIterable, Encodable{
    case passive = "Pas"
    case active = "act"
}
enum Gender: String, CaseIterable, Encodable{
    case male = "m"
    case female = "f"
    case neuter = "n"
}
enum prepositionFollowedBy:String, CaseIterable, Encodable{
    case abl = "ablative"
    case acc = "accusative"
}
