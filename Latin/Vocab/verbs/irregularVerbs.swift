//
//  irregularVerbs.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 04/10/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import Foundation
class IrregularVerb : Verb{
    // for irregular verbs we have define it case by case becuase humans are weird
    override func GetImperfect(str: String) -> String {
        /*
         1s = 1st person singular: I
         2s = 2nd person singular: you
         3s = 3rd person singular: he/she/it
         1p = 1st person plural: we
         2p = 2nd person plural: you all
         3p = 3rd persin plural: they
         */
        switch present1S {
        case "sum":
            switch str.lowercased() {
            case "1s":
                return "eram"
            case "2s":
                return "eras"
            case "3s":
                return "erat"
            case "1p":
                return "eramus"
            case "2p":
                return "eratis"
            case "3p":
                return "erant"
            default:
                return "cant find number and person"
            }
        case "absum":
            switch str.lowercased() {
            case "1s":
                return "aberam"
            case "2s":
                return "aberas"
            case "3s":
                return "aberat"
            case "1p":
                return "aberamus"
            case "2p":
                return "aberatis"
            case "3p":
                return "aberant"
            default:
                return "cant find number and person"
            }
        case "adsum":
            switch str.lowercased() {
            case "1s":
                return "aderam"
            case "2s":
                return "aderas"
            case "3s":
                return "aderat"
            case "1p":
                return "aderamus"
            case "2p":
                return "aderatis"
            case "3p":
                return "aderant"
            default:
                return "cant find number and person"
            }
        case "possum":
            switch str.lowercased() {
            case "1s":
                return "poteram"
            case "2s":
                return "poteras"
            case "3s":
                return "poterat"
            case "1p":
                return "poteramus"
            case "2p":
                return "poteratis"
            case "3p":
                return "poterant"
            default:
                return "cant find number and person"
            }
        case "aufero":
            switch str.lowercased() {
            case "1s":
                return "auferebam"
            case "2s":
                return "auferebas"
            case "3s":
                return "auferebat"
            case "1p":
                return "auferebamus"
            case "2p":
                return "auferebatis"
            case "3p":
                return "auferebant"
            default:
                return "cant find number and person"
            }
        case "copei":
            switch str.lowercased() {
            case "1s":
                return present1S
            case "2s":
                return "coepebam"
            case "3s":
                return "coepebas"
            case "1p":
                return "coepebat"
            case "2p":
                return "coepebamus"
            case "3p":
                return "coepebant"
            default:
                return "cant find number and person"
            }
        case "eo":
            switch str.lowercased() {
            case "1s":
                return "ibam"
            case "2s":
                return "ibas"
            case "3s":
                return "ibat"
            case "1p":
                return "ibamus"
            case "2p":
                return "ibatis"
            case "3p":
                return "ibant"
            default:
                return "cant find number and person"
            }
        case "":
            switch str.lowercased() {
            case "1s":
                return present1S
            case "2s":
                return "fers"
            case "3s":
                return "fert"
            case "1p":
                return "ferimus"
            case "2p":
                return "fertis"
            case "3p":
                return "ferunt"
            default:
                return "cant find number and person"
            }
        case "inquit":
            switch str.lowercased() {
            case "1s":
                return "not needed"
            case "2s":
                return "not needed"
            case "3s":
                return "not needed"
            case "1p":
                return "not needed"
            case "2p":
                return "not needed"
            case "3p":
                return "not needed"
            default:
                return "cant find number and person"
            }
        case "malo":
            switch str.lowercased() {
            case "1s":
                return "malebam"
            case "2s":
                return "malebas"
            case "3s":
                return "malebat"
            case "1p":
                return "malebamus"
            case "2p":
                return "malebatis"
            case "3p":
                return "malebant"
            default:
                return "cant find number and person"
            }
        case "nolo":
            switch str.lowercased() {
            case "1s":
                return "nolebam"
            case "2s":
                return "nolebas"
            case "3s":
                return "nolebat"
            case "1p":
                return "nolebamus"
            case "2p":
                return "nolebatis"
            case "3p":
                return "nolebant"
            default:
                return "cant find number and person"
            }
        case "offero":
            switch str.lowercased() {
            case "1s":
                return "offerebam"
            case "2s":
                return "offerebas"
            case "3s":
                return "offerebat"
            case "1p":
                return "offerebamus"
            case "2p":
                return "offerebatis"
            case "3p":
                return "offerebant"
            default:
                return "cant find number and person"
            }
        case "pereo":
            switch str.lowercased() {
            case "1s":
                return "peribam"
            case "2s":
                return "peribas"
            case "3s":
                return "peribat"
            case "1p":
                return "peribamus"
            case "2p":
                return "peribatis"
            case "3p":
                return "peribant"
            default:
                return "cant find number and person"
            }
        case "redeo":
            switch str.lowercased() {
            case "1s":
                return "redibam"
            case "2s":
                return "redibas"
            case "3s":
                return "redibat"
            case "1p":
                return "redibamus"
            case "2p":
                return "redibatis"
            case "3p":
                return "redibant"
            default:
                return "cant find number and person"
            }
        case "volo":
            switch str.lowercased() {
            case "1s":
                return present1S
            case "2s":
                return "vis"
            case "3s":
                return "vult"
            case "1p":
                return "volumus"
            case "2p":
                return "vultis"
            case "3p":
                return "volunt"
            default:
                return "cant find number and person"
            }
        default:
            return "cant find verb"
        }
    }
    override func GetPresent(str: String) -> String {
        switch present1S {
        case "sum":
            switch str.lowercased() {
            case "1s":
                return present1S
            case "2s":
                return "es"
            case "3s":
                return "est"
            case "1p":
                return "summus"
            case "2p":
                return "estis"
            case "3p":
                return "sunt"
            default:
                return "cant find number and person"
            }
        case "absum":
            switch str.lowercased() {
            case "1s":
                return present1S
            case "2s":
                return "abes"
            case "3s":
                return "abest"
            case "1p":
                return "absummus"
            case "2p":
                return "abestis"
            case "3p":
                return "absunt"
            default:
                return "cant find number and person"
            }
        case "adsum":
            switch str.lowercased() {
            case "1s":
                return present1S
            case "2s":
                return "adses"
            case "3s":
                return "adest"
            case "1p":
                return "adsummus"
            case "2p":
                return "adestis"
            case "3p":
                return "adsunt"
            default:
                return "cant find number and person"
            }
        case "possum":
            switch str.lowercased() {
            case "1s":
                return present1S
            case "2s":
                return "potes"
            case "3s":
                return "potest"
            case "1p":
                return "posummus"
            case "2p":
                return "potestis"
            case "3p":
                return "potsunt"
            default:
                return "cant find number and person"
            }
        case "aufero":
            switch str.lowercased() {
            case "1s":
                return present1S
            case "2s":
                return "aufers"
            case "3s":
                return "aufert"
            case "1p":
                return "auferimus"
            case "2p":
                return "aufertis"
            case "3p":
                return "auferunt"
            default:
                return "cant find number and person"
            }
        case "copei":
            switch str.lowercased() {
            case "1s":
                return present1S
            case "2s":
                return "coepis"
            case "3s":
                return "coepit"
            case "1p":
                return "coepimus"
            case "2p":
                return "coepistis"
            case "3p":
                return "coepiunt"
            default:
                return "cant find number and person"
            }
        case "eo":
            switch str.lowercased() {
            case "1s":
                return present1S
            case "2s":
                return "is"
            case "3s":
                return "it"
            case "1p":
                return "imus"
            case "2p":
                return "isti"
            case "3p":
                return "eunt"
            default:
                return "cant find number and person"
            }
        case "":
            switch str.lowercased() {
            case "1s":
                return present1S
            case "2s":
                return "fers"
            case "3s":
                return "fert"
            case "1p":
                return "ferimus"
            case "2p":
                return "fertis"
            case "3p":
                return "ferunt"
            default:
                return "cant find number and person"
            }
        case "inquit":
            switch str.lowercased() {
            case "1s":
                return "not needed"
            case "2s":
                return "not needed"
            case "3s":
                return present1S
            case "1p":
                return "not needed"
            case "2p":
                return "not needed"
            case "3p":
                return "not needed"
            default:
                return "cant find number and person"
            }
        case "malo":
            switch str.lowercased() {
            case "1s":
                return present1S
            case "2s":
                return "mavis"
            case "3s":
                return "mavult"
            case "1p":
                return "malumus"
            case "2p":
                return "mavultis"
            case "3p":
                return "malunt"
            default:
                return "cant find number and person"
            }
        case "nolo":
            switch str.lowercased() {
            case "1s":
                return present1S
            case "2s":
                return "novis"
            case "3s":
                return "novult"
            case "1p":
                return "nolumus"
            case "2p":
                return "nolitis"
            case "3p":
                return "nolunt"
            default:
                return "cant find number and person"
            }
        case "offero":
            switch str.lowercased() {
            case "1s":
                return present1S
            case "2s":
                return "offers"
            case "3s":
                return "offert"
            case "1p":
                return "offerimus"
            case "2p":
                return "offertis"
            case "3p":
                return "offerunt"
            default:
                return "cant find number and person"
            }
        case "pereo":
            switch str.lowercased() {
            case "1s":
                return present1S
            case "2s":
                return "peris"
            case "3s":
                return "perit"
            case "1p":
                return "perimus"
            case "2p":
                return "peritis"
            case "3p":
                return "pereunt"
            default:
                return "cant find number and person"
            }
        case "redeo":
            switch str.lowercased() {
            case "1s":
                return present1S
            case "2s":
                return "redis"
            case "3s":
                return "redit"
            case "1p":
                return "redimus"
            case "2p":
                return "reditis"
            case "3p":
                return "redeunt"
            default:
                return "cant find number and person"
            }
        case "volo":
            switch str.lowercased() {
            case "1s":
                return present1S
            case "2s":
                return "vis"
            case "3s":
                return "vult"
            case "1p":
                return "volumus"
            case "2p":
                return "vultis"
            case "3p":
                return "volunt"
            default:
                return "cant find number and person"
            }
            
        default:
            return "cant find verb"
        }
    }
    override func GetFuture(str: String) -> String {
        switch present1S {
        case "sum":
            switch str.lowercased() {
            case "1s":
                return "ero"
            case "2s":
                return "eris"
            case "3s":
                return "erit"
            case "1p":
                return "erimus"
            case "2p":
                return "eritis"
            case "3p":
                return "erunt"
            default:
                return "cant find number and person"
            }
        case "absum":
            switch str.lowercased() {
            case "1s":
                return "abero"
            case "2s":
                return "aberis"
            case "3s":
                return "aberit"
            case "1p":
                return "aberimus"
            case "2p":
                return "aberitis"
            case "3p":
                return "aberunt"
            default:
                return "cant find number and person"
            }
        case "adsum":
            switch str.lowercased() {
            case "1s":
                return "adero"
            case "2s":
                return "aderis"
            case "3s":
                return "aderit"
            case "1p":
                return "aderimus"
            case "2p":
                return "aderitis"
            case "3p":
                return "aderunt"
            default:
                return "cant find number and person"
            }
        case "possum":
            switch str.lowercased() {
            case "1s":
                return "potero"
            case "2s":
                return "poteris"
            case "3s":
                return "poterit"
            case "1p":
                return "poterimus"
            case "2p":
                return "poteritis"
            case "3p":
                return "poterunt"
            default:
                return "cant find number and person"
            }
        case "aufero":
            switch str.lowercased() {
            case "1s":
                return "auferam"
            case "2s":
                return "auferes"
            case "3s":
                return "auferet"
            case "1p":
                return "auferemus"
            case "2p":
                return "auferetis"
            case "3p":
                return "auferent"
            default:
                return "cant find number and person"
            }
        case "copei":
            return "can not find"
        case "eo":
            switch str.lowercased() {
            case "1s":
                return "ibo"
            case "2s":
                return "ibis"
            case "3s":
                return "ibit"
            case "1p":
                return "ibimus"
            case "2p":
                return "ibisti"
            case "3p":
                return "ibunt"
            default:
                return "cant find number and person"
            }
        case "":
            switch str.lowercased() {
            case "1s":
                return "feram"
            case "2s":
                return "feres"
            case "3s":
                return "feret"
            case "1p":
                return "feremus"
            case "2p":
                return "feretis"
            case "3p":
                return "ferent"
            default:
                return "cant find number and person"
            }
        case "inquit":
            return "not needed"
        case "malo":
            switch str.lowercased() {
            case "1s":
                return "malam"
            case "2s":
                return "males"
            case "3s":
                return "malet"
            case "1p":
                return "malemus"
            case "2p":
                return "maletis"
            case "3p":
                return "malent"
            default:
                return "cant find number and person"
            }
        case "nolo":
            switch str.lowercased() {
            case "1s":
                return present1S
            case "2s":
                return "nolam"
            case "3s":
                return "noles"
            case "1p":
                return "nolet"
            case "2p":
                return "noletis"
            case "3p":
                return "nolent"
            default:
                return "cant find number and person"
            }
        case "offero":
            switch str.lowercased() {
            case "1s":
                return "offeram"
            case "2s":
                return "offeres"
            case "3s":
                return "offeret"
            case "1p":
                return "offeremus"
            case "2p":
                return "offeretis"
            case "3p":
                return "offerent"
            default:
                return "cant find number and person"
            }
        case "pereo":
            switch str.lowercased() {
            case "1s":
                return "peribo"
            case "2s":
                return "peribis"
            case "3s":
                return "peribit"
            case "1p":
                return "peribimus"
            case "2p":
                return "peribitis"
            case "3p":
                return "peribunt"
            default:
                return "cant find number and person"
            }
        case "redeo":
            switch str.lowercased() {
            case "1s":
                return "redibo"
            case "2s":
                return "redibis"
            case "3s":
                return "redibit"
            case "1p":
                return "redibimus"
            case "2p":
                return "redibitis"
            case "3p":
                return "redibunt"
            default:
                return "cant find number and person"
            }
        case "volo":
            switch str.lowercased() {
            case "1s":
                return "volam"
            case "2s":
                return "voles"
            case "3s":
                return "volet"
            case "1p":
                return "volemus"
            case "2p":
                return "vuletis"
            case "3p":
                return "volent"
            default:
                return "cant find number and person"
            }
            
        default:
            return "cant find verb"
        }
    }
    override func GetPerfect(str: String) -> String {
        switch present1S {
        case "sum":
            switch str.lowercased() {
            case "1s":
                return "fui"
            case "2s":
                return "fuisti"
            case "3s":
                return "fuit"
            case "1p":
                return "fuimus"
            case "2p":
                return "fuistis"
            case "3p":
                return "fuerunt"
            default:
                return "cant find number and person"
            }
        case "absum":
            switch str.lowercased() {
            case "1s":
                return "abfui"
            case "2s":
                return "abfuisti"
            case "3s":
                return "abfuit"
            case "1p":
                return "abfuimus"
            case "2p":
                return "abfuitis"
            case "3p":
                return "abferunt"
            default:
                return "cant find number and person"
            }
        case "adsum":
            switch str.lowercased() {
            case "1s":
                return "adfui"
            case "2s":
                return "adfuisti"
            case "3s":
                return "adfuit"
            case "1p":
                return "adfuimus"
            case "2p":
                return "adfuistis"
            case "3p":
                return "adfuerunt"
            default:
                return "cant find number and person"
            }
        case "possum":
            switch str.lowercased() {
            case "1s":
                return "potui"
            case "2s":
                return "potuisti"
            case "3s":
                return "potuit"
            case "1p":
                return "potuimus"
            case "2p":
                return "potuitis"
            case "3p":
                return "potuerunt"
            default:
                return "cant find number and person"
            }
        case "aufero":
            switch str.lowercased() {
            case "1s":
                return "autbsli"
            case "2s":
                return "autbslisti"
            case "3s":
                return "autbsit"
            case "1p":
                return "autbslimus"
            case "2p":
                return "autbslistis"
            case "3p":
                return "autbslerunt"
            default:
                return "cant find number and person"
            }
        case "copei":
            return "can not find"
        case "eo":
            switch str.lowercased() {
            case "1s":
                return "ii"
            case "2s":
                return "iisti"
            case "3s":
                return "iit"
            case "1p":
                return "iimus"
            case "2p":
                return "isitis"
            case "3p":
                return "ierunt"
            default:
                return "cant find number and person"
            }
        case "fero":
            switch str.lowercased() {
            case "1s":
                return "tuli"
            case "2s":
                return "tulisti"
            case "3s":
                return "tulit"
            case "1p":
                return "tulimus"
            case "2p":
                return "tulistis"
            case "3p":
                return "tulerunt"
            default:
                return "cant find number and person"
            }
        case "inquit":
            return "not needed"
        case "malo":
            switch str.lowercased() {
            case "1s":
                return "malui"
            case "2s":
                return "maluisti"
            case "3s":
                return "maluit"
            case "1p":
                return "maluimus"
            case "2p":
                return "maluisitis"
            case "3p":
                return "maluerunt"
            default:
                return "cant find number and person"
            }
        case "nolo":
            switch str.lowercased() {
            case "1s":
                return "nolui"
            case "2s":
                return "noluisti"
            case "3s":
                return "noluit"
            case "1p":
                return "noluimus"
            case "2p":
                return "noluistis"
            case "3p":
                return "noluerunt"
            default:
                return "cant find number and person"
            }
        case "offero":
            /*
             ego    tulī
             tū    tulístī
             is    tulit
             nōs    tulimus
             vōs    tulístis
             iī    tulḗrunt
             */
            switch str.lowercased() {
            case "1s":
                return "oftuli"
            case "2s":
                return "oftulisti"
            case "3s":
                return "oftulit"
            case "1p":
                return "oftulimus"
            case "2p":
                return "oftulistis"
            case "3p":
                return "oftulerunt"
            default:
                return "cant find number and person"
            }
        case "pereo":
            switch str.lowercased() {
            case "1s":
                return "perii"
            case "2s":
                return "peristi"
            case "3s":
                return "periit"
            case "1p":
                return "perimus"
            case "2p":
                return "peristis"
            case "3p":
                return "perierunt"
            default:
                return "cant find number and person"
            }
        case "redeo":
            switch str.lowercased() {
            case "1s":
                return "redii"
            case "2s":
                return "redisti"
            case "3s":
                return "rediit"
            case "1p":
                return "redimus"
            case "2p":
                return "redistis"
            case "3p":
                return "redierunt"
            default:
                return "cant find number and person"
            }
        case "volo":
            switch str.lowercased() {
            case "1s":
                return "volui"
            case "2s":
                return "voluisti"
            case "3s":
                return "voluit"
            case "1p":
                return "voluimus"
            case "2p":
                return "vuluistis"
            case "3p":
                return "voluierunt"
            default:
                return "cant find number and person"
            }
            
        default:
            return "cant find verb"
        }
    }
    override func GetPluperfect(str: String) -> String {
        switch present1S {
        case "sum":
            switch str.lowercased() {
            case "1s":
                return "sim"
            case "2s":
                return "sis"
            case "3s":
                return "sit"
            case "1p":
                return "simus"
            case "2p":
                return "sitis"
            case "3p":
                return "sint"
            default:
                return "cant find number and person"
            }
        case "absum":
            switch str.lowercased() {
            case "1s":
                return "absim"
            case "2s":
                return "absis"
            case "3s":
                return "absit"
            case "1p":
                return "absimus"
            case "2p":
                return "absitis"
            case "3p":
                return "absint"
            default:
                return "cant find number and person"
            }
        case "adsum":
            switch str.lowercased() {
            case "1s":
                return "adsim"
            case "2s":
                return "adsis"
            case "3s":
                return "adsit"
            case "1p":
                return "adsimus"
            case "2p":
                return "adsitis"
            case "3p":
                return "adsint"
            default:
                return "cant find number and person"
            }
        case "possum":
            switch str.lowercased() {
            case "1s":
                return "possim"
            case "2s":
                return "possis"
            case "3s":
                return "possit"
            case "1p":
                return "possimus"
            case "2p":
                return "possitis"
            case "3p":
                return "possint"
            default:
                return "cant find number and person"
            }
        case "aufero":
            switch str.lowercased() {
            case "1s":
                return "autbsleram"
            case "2s":
                return "autbsleras"
            case "3s":
                return "autbslerat"
            case "1p":
                return "autbsleramus"
            case "2p":
                return "autbsleratis"
            case "3p":
                return "autbslerant"
            default:
                return "cant find number and person"
            }
        case "copei":
            return "can not find"
        case "eo":
            switch str.lowercased() {
            case "1s":
                return "eam"
            case "2s":
                return "eas"
            case "3s":
                return "eat"
            case "1p":
                return "eamus"
            case "2p":
                return "eates"
            case "3p":
                return "eant"
            default:
                return "cant find number and person"
            }
        case "fero":
            switch str.lowercased() {
            case "1s":
                return "feram"
            case "2s":
                return "feras"
            case "3s":
                return "ferat"
            case "1p":
                return "feramus"
            case "2p":
                return "feratis"
            case "3p":
                return "ferant"
            default:
                return "cant find number and person"
            }
        case "inquit":
            return "not needed"
        case "malo":
            switch str.lowercased() {
            case "1s":
                return "malim"
            case "2s":
                return "malis"
            case "3s":
                return "malit"
            case "1p":
                return "malimus"
            case "2p":
                return "malitis"
            case "3p":
                return "malint"
            default:
                return "cant find number and person"
            }
        case "nolo":
            switch str.lowercased() {
            case "1s":
                return "nolim"
            case "2s":
                return "nolis"
            case "3s":
                return "nolit"
            case "1p":
                return "nolimus"
            case "2p":
                return "nolitis"
            case "3p":
                return "nolint"
            default:
                return "cant find number and person"
            }
        case "offero":
            switch str.lowercased() {
            case "1s":
                return "offeram"
            case "2s":
                return "offeras"
            case "3s":
                return "offerat"
            case "1p":
                return "offeramus"
            case "2p":
                return "offeratis"
            case "3p":
                return "offerant"
            default:
                return "cant find number and person"
            }
            
        case "pereo":
            switch str.lowercased() {
            case "1s":
                return "peream"
            case "2s":
                return "pereas"
            case "3s":
                return "pereat"
            case "1p":
                return "pereamus"
            case "2p":
                return "perwates"
            case "3p":
                return "pereant"
            default:
                return "cant find number and person"
            }
        case "redeo":
            switch str.lowercased() {
            case "1s":
                return "redeam"
            case "2s":
                return "redeas"
            case "3s":
                return "redeat"
            case "1p":
                return "redeamus"
            case "2p":
                return "redeates"
            case "3p":
                return "redeant"
            default:
                return "cant find number and person"
            }
        case "volo":
            switch str.lowercased() {
            case "1s":
                return "volim"
            case "2s":
                return "volis"
            case "3s":
                return "volit"
            case "1p":
                return "volimus"
            case "2p":
                return "volitis"
            case "3p":
                return "volint"
            default:
                return "cant find number and person"
            }
            
        default:
            return "cant find verb"
        }
    }
    override func GetSubjunctivePresent(str: String) -> String {
        switch present1S {
        case "sum":
            switch str.lowercased() {
            case "1s":
                return "fueram"
            case "2s":
                return "fueras"
            case "3s":
                return "fuerat"
            case "1p":
                return "fueramus"
            case "2p":
                return "fueratis"
            case "3p":
                return "fuerant"
            default:
                return "cant find number and person"
            }
        case "absum":
            switch str.lowercased() {
            case "1s":
                return "abfueram"
            case "2s":
                return "abfueras"
            case "3s":
                return "abfuerat"
            case "1p":
                return "abfueramus"
            case "2p":
                return "abfueratis"
            case "3p":
                return "abfuerant"
            default:
                return "cant find number and person"
            }
        case "adsum":
            switch str.lowercased() {
            case "1s":
                return "adfueram"
            case "2s":
                return "adfueras"
            case "3s":
                return "adfuerat"
            case "1p":
                return "adfueramus"
            case "2p":
                return "adfueratis"
            case "3p":
                return "adfuerant"
            default:
                return "cant find number and person"
            }
        case "possum":
            switch str.lowercased() {
            case "1s":
                return "potueram"
            case "2s":
                return "potueras"
            case "3s":
                return "potuerat"
            case "1p":
                return "potueramus"
            case "2p":
                return "potueratis"
            case "3p":
                return "potuerant"
            default:
                return "cant find number and person"
            }
        case "aufero":
            switch str.lowercased() {
            case "1s":
                return "autuleram"
            case "2s":
                return "autuleras"
            case "3s":
                return "autulerat"
            case "1p":
                return "autuleramus"
            case "2p":
                return "autuleratis"
            case "3p":
                return "autulerant"
            default:
                return "cant find number and person"
            }
        case "copei":
            return "can not find"
        case "eo":
            switch str.lowercased() {
            case "1s":
                return "ieram"
            case "2s":
                return "ieras"
            case "3s":
                return "ierat"
            case "1p":
                return "ieramus"
            case "2p":
                return "ieratis"
            case "3p":
                return "ierant"
            default:
                return "cant find number and person"
            }
        case "fero":
            switch str.lowercased() {
            case "1s":
                return "tuleram"
            case "2s":
                return "tuleras"
            case "3s":
                return "tulerat"
            case "1p":
                return "tuleramus"
            case "2p":
                return "tuleratis"
            case "3p":
                return "tulerant"
            default:
                return "cant find number and person"
            }
        case "inquit":
            return "not needed"
        case "malo":
            switch str.lowercased() {
            case "1s":
                return "malueram"
            case "2s":
                return "malueras"
            case "3s":
                return "maluerat"
            case "1p":
                return "malueramus"
            case "2p":
                return "malueratis"
            case "3p":
                return "maluerant"
            default:
                return "cant find number and person"
            }
        case "nolo":
            switch str.lowercased() {
            case "1s":
                return "nolueram"
            case "2s":
                return "nolueras"
            case "3s":
                return "noluerat"
            case "1p":
                return "nolueramus"
            case "2p":
                return "nolueratis"
            case "3p":
                return "noluerant"
            default:
                return "cant find number and person"
            }
        case "offero":
            switch str.lowercased() {
            case "1s":
                return "obtuleram"
            case "2s":
                return "obtuleras"
            case "3s":
                return "obtulerat"
            case "1p":
                return "obtuleramus"
            case "2p":
                return "obtuleratis"
            case "3p":
                return "obtulerant"
            default:
                return "cant find number and person"
            }
            
        case "pereo":
            switch str.lowercased() {
            case "1s":
                return "perieram"
            case "2s":
                return "perieras"
            case "3s":
                return "perierat"
            case "1p":
                return "perieramus"
            case "2p":
                return "perieratis"
            case "3p":
                return "perierant"
            default:
                return "cant find number and person"
            }
        case "redeo":
            switch str.lowercased() {
            case "1s":
                return "redieram"
            case "2s":
                return "redieras"
            case "3s":
                return "redierat"
            case "1p":
                return "redieramus"
            case "2p":
                return "redieratis"
            case "3p":
                return "redierant"
            default:
                return "cant find number and person"
            }
        case "volo":
            switch str.lowercased() {
            case "1s":
                return "volueram"
            case "2s":
                return "volueras"
            case "3s":
                return "voluerat"
            case "1p":
                return "volueramus"
            case "2p":
                return "vulueratis"
            case "3p":
                return "voluerant"
            default:
                return "cant find number and person"
            }
            
        default:
            return "cant find verb"
        }
    }
    override func GetSubjunctiveImperfect(str: String) -> String {
        switch present1S {
        case "sum":
            switch str.lowercased() {
            case "1s":
                return "essem"
            case "2s":
                return "esses"
            case "3s":
                return "esset"
            case "1p":
                return "essemus"
            case "2p":
                return "essetis"
            case "3p":
                return "essent"
            default:
                return "cant find number and person"
            }
        case "absum":
            switch str.lowercased() {
            case "1s":
                return "abessem"
            case "2s":
                return "abesses"
            case "3s":
                return "abesset"
            case "1p":
                return "abessemus"
            case "2p":
                return "abessetis"
            case "3p":
                return "abessent"
            default:
                return "cant find number and person"
            }
        case "adsum":
            switch str.lowercased() {
            case "1s":
                return "adessem"
            case "2s":
                return "adesses"
            case "3s":
                return "adesset"
            case "1p":
                return "adessemus"
            case "2p":
                return "adessetis"
            case "3p":
                return "adessent"
            default:
                return "cant find number and person"
            }
        case "possum":
            switch str.lowercased() {
            case "1s":
                return "possem"
            case "2s":
                return "posses"
            case "3s":
                return "posset"
            case "1p":
                return "possemus"
            case "2p":
                return "possetis"
            case "3p":
                return "possent"
            default:
                return "cant find number and person"
            }
        case "aufero":
            switch str.lowercased() {
            case "1s":
                return "auferem"
            case "2s":
                return "auferes"
            case "3s":
                return "auferet"
            case "1p":
                return "auferemus"
            case "2p":
                return "auferetis"
            case "3p":
                return "auferent"
            default:
                return "cant find number and person"
            }
        case "copei":
            return "can not find"
        case "eo":
            switch str.lowercased() {
            case "1s":
                return "irem"
            case "2s":
                return "ires"
            case "3s":
                return "iret"
            case "1p":
                return "iremus"
            case "2p":
                return "iretis"
            case "3p":
                return "irent"
            default:
                return "cant find number and person"
            }
        case "fero":
            switch str.lowercased() {
            case "1s":
                return "ferem"
            case "2s":
                return "feres"
            case "3s":
                return "feret"
            case "1p":
                return "feremus"
            case "2p":
                return "feretis"
            case "3p":
                return "ferent"
            default:
                return "cant find number and person"
            }
        case "inquit":
            return "not needed"
        case "malo":
            switch str.lowercased() {
            case "1s":
                return "mallem"
            case "2s":
                return "malles"
            case "3s":
                return "mallet"
            case "1p":
                return "mallemus"
            case "2p":
                return "malletis"
            case "3p":
                return "mallent"
            default:
                return "cant find number and person"
            }
        case "nolo":
            switch str.lowercased() {
            case "1s":
                return "nollem"
            case "2s":
                return "nolles"
            case "3s":
                return "nollet"
            case "1p":
                return "nollemus"
            case "2p":
                return "nolletis"
            case "3p":
                return "nollent"
            default:
                return "cant find number and person"
            }
        case "offero":
            switch str.lowercased() {
            case "1s":
                return "offerem"
            case "2s":
                return "offeres"
            case "3s":
                return "offeret"
            case "1p":
                return "offeremus"
            case "2p":
                return "offeretis"
            case "3p":
                return "offerent"
            default:
                return "cant find number and person"
            }
            
        case "pereo":
            switch str.lowercased() {
            case "1s":
                return "perirem"
            case "2s":
                return "perires"
            case "3s":
                return "periret"
            case "1p":
                return "periremus"
            case "2p":
                return "periretis"
            case "3p":
                return "perirent"
            default:
                return "cant find number and person"
            }
        case "redeo":
            switch str.lowercased() {
            case "1s":
                return "redirem"
            case "2s":
                return "redires"
            case "3s":
                return "rediremus"
            case "1p":
                return "rediremus"
            case "2p":
                return "rediretis"
            case "3p":
                return "redirent"
            default:
                return "cant find number and person"
            }
        case "volo":
            switch str.lowercased() {
            case "1s":
                return "vellem"
            case "2s":
                return "velles"
            case "3s":
                return "vellet"
            case "1p":
                return "vellemus"
            case "2p":
                return "velletis"
            case "3p":
                return "vellent"
            default:
                return "cant find number and person"
            }
            
        default:
            return "cant find verb"
        }
        
    }
    override func GetSubjunctivePerfect(str: String) -> String {
        switch present1S {
        case "sum":
            switch str.lowercased() {
            case "1s":
                return "fuerim"
            case "2s":
                return "fueris"
            case "3s":
                return "fuerit"
            case "1p":
                return "fuerimus"
            case "2p":
                return "fueritis"
            case "3p":
                return "fuerint"
            default:
                return "cant find number and person"
            }
        case "absum":
            switch str.lowercased() {
            case "1s":
                return "abfuerim"
            case "2s":
                return "abfueris"
            case "3s":
                return "abfuerit"
            case "1p":
                return "abfuerimus"
            case "2p":
                return "abfueritis"
            case "3p":
                return "abfuerint"
            default:
                return "cant find number and person"
            }
        case "adsum":
            switch str.lowercased() {
            case "1s":
                return "adfuerim"
            case "2s":
                return "adfueris"
            case "3s":
                return "adfuerit"
            case "1p":
                return "adfuerimus"
            case "2p":
                return "adfueritis"
            case "3p":
                return "adfuerint"
            default:
                return "cant find number and person"
            }
        case "possum":
            switch str.lowercased() {
            case "1s":
                return "potuerim"
            case "2s":
                return "potueris"
            case "3s":
                return "potuerit"
            case "1p":
                return "potuerimus"
            case "2p":
                return "potueritis"
            case "3p":
                return "potuerint"
            default:
                return "cant find number and person"
            }
        case "aufero":
            switch str.lowercased() {
            case "1s":
                return "autbslerim"
            case "2s":
                return "autbsleris"
            case "3s":
                return "autbslerimus"
            case "1p":
                return "autbsleritis"
            case "2p":
                return "autbsleritis"
            case "3p":
                return "autbslerint"
            default:
                return "cant find number and person"
            }
        case "copei":
            return "can not find"
        case "eo":
            switch str.lowercased() {
            case "1s":
                return "ierim"
            case "2s":
                return "ieris"
            case "3s":
                return "ierit"
            case "1p":
                return "ierimus"
            case "2p":
                return "ieritis"
            case "3p":
                return "ierint"
            default:
                return "cant find number and person"
            }
            
        case "fero":
            switch str.lowercased() {
            case "1s":
                return "tulerim"
            case "2s":
                return "tuleris"
            case "3s":
                return "tulerit"
            case "1p":
                return "tulerimus"
            case "2p":
                return "tuleritis"
            case "3p":
                return "tulerint"
            default:
                return "cant find number and person"
            }
        case "inquit":
            return "not needed"
        case "malo":
            switch str.lowercased() {
            case "1s":
                return "maluerim"
            case "2s":
                return "malueris"
            case "3s":
                return "maluerit"
            case "1p":
                return "maluerimus"
            case "2p":
                return "malueritis"
            case "3p":
                return "maluerint"
            default:
                return "cant find number and person"
            }
        case "nolo":
            switch str.lowercased() {
            case "1s":
                return "noluerim"
            case "2s":
                return "nolueris"
            case "3s":
                return "noluerit"
            case "1p":
                return "noluerimus"
            case "2p":
                return "nolueritis"
            case "3p":
                return "noluerint"
            default:
                return "cant find number and person"
            }
        case "offero":
            switch str.lowercased() {
            case "1s":
                return "obtulerim"
            case "2s":
                return "obtuleris"
            case "3s":
                return "obtulerit"
            case "1p":
                return "obtulerimus"
            case "2p":
                return "obtuleritis"
            case "3p":
                return "obtulerint"
            default:
                return "cant find number and person"
            }
            
        case "pereo":
            switch str.lowercased() {
            case "1s":
                return "perierim"
            case "2s":
                return "perieris"
            case "3s":
                return "perierit"
            case "1p":
                return "perierimus"
            case "2p":
                return "perieritis"
            case "3p":
                return "perierint"
            default:
                return "cant find number and person"
            }
        case "redeo":
            switch str.lowercased() {
            case "1s":
                return "redierim"
            case "2s":
                return "redieris"
            case "3s":
                return "redierit"
            case "1p":
                return "redierimus"
            case "2p":
                return "redieritis"
            case "3p":
                return "redierint"
            default:
                return "cant find number and person"
            }
        case "volo":
            switch str.lowercased() {
            case "1s":
                return "voluerim"
            case "2s":
                return "volueris"
            case "3s":
                return "voluerit"
            case "1p":
                return "voluerimus"
            case "2p":
                return "volueritis"
            case "3p":
                return "voluerint"
            default:
                return "cant find number and person"
            }
            
        default:
            return "cant find verb"
        }
    }
    override func GetSubjunctivePluperfect(str:String) -> String {
        switch present1S {
        case "sum":
            switch str.lowercased() {
            case "1s":
                return "fuissem"
            case "2s":
                return "fuisses"
            case "3s":
                return "fuisset"
            case "1p":
                return "fuissemus"
            case "2p":
                return "fuissetis"
            case "3p":
                return "fuissent"
            default:
                return "cant find number and person"
            }
        case "absum":
            switch str.lowercased() {
            case "1s":
                return "sbfuissem"
            case "2s":
                return "abfuisses"
            case "3s":
                return "abuisset"
            case "1p":
                return "abfuissemus"
            case "2p":
                return "abfuissetis"
            case "3p":
                return "abfuissent"
            default:
                return "cant find number and person"
            }
        case "adsum":
            switch str.lowercased() {
            case "1s":
                return "adfuissem"
            case "2s":
                return "adfuisses"
            case "3s":
                return "adfuisset"
            case "1p":
                return "adfuissemus"
            case "2p":
                return "adfuissetis"
            case "3p":
                return "adfuissent"
            default:
                return "cant find number and person"
            }
        case "possum":
            switch str.lowercased() {
            case "1s":
                return "potuissem"
            case "2s":
                return "potuisses"
            case "3s":
                return "potuisset"
            case "1p":
                return "potuissemus"
            case "2p":
                return "potuissetis"
            case "3p":
                return "potuissent"
            default:
                return "cant find number and person"
            }
        case "aufero":
            switch str.lowercased() {
            case "1s":
                return "autbslissem"
            case "2s":
                return "autbslisses"
            case "3s":
                return "autbslissemus"
            case "1p":
                return "autbslissetis"
            case "2p":
                return "autbslissetis"
            case "3p":
                return "autbslissent"
            default:
                return "cant find number and person"
            }
        case "copei":
            return "can not find"
        case "eo":
            switch str.lowercased() {
            case "1s":
                return "issem"
            case "2s":
                return "isses"
            case "3s":
                return "isset"
            case "1p":
                return "issemus"
            case "2p":
                return "issetis"
            case "3p":
                return "issent"
            default:
                return "cant find number and person"
            }
        case "fero":
            switch str.lowercased() {
            case "1s":
                return "tulissem"
            case "2s":
                return "tulisses"
            case "3s":
                return "tulisset"
            case "1p":
                return "tulissemus"
            case "2p":
                return "tulissetis"
            case "3p":
                return "tulissent"
            default:
                return "cant find number and person"
            }
        case "inquit":
            return "not needed"
        case "malo":
            switch str.lowercased() {
            case "1s":
                return "maluissem"
            case "2s":
                return "maluisses"
            case "3s":
                return "maluisset"
            case "1p":
                return "maluissemus"
            case "2p":
                return "maluissetis"
            case "3p":
                return "maluissent"
            default:
                return "cant find number and person"
            }
        case "nolo":
            switch str.lowercased() {
            case "1s":
                return "noluissem"
            case "2s":
                return "noluisses"
            case "3s":
                return "noluisset"
            case "1p":
                return "noluissemus"
            case "2p":
                return "noluissetis"
            case "3p":
                return "noluissent"
            default:
                return "cant find number and person"
            }
        case "offero":
            switch str.lowercased() {
            case "1s":
                return "obtulissem"
            case "2s":
                return "obtulisses"
            case "3s":
                return "obtulisset"
            case "1p":
                return "obtulissemus"
            case "2p":
                return "obtulissetis"
            case "3p":
                return "obtulissent"
            default:
                return "cant find number and person"
            }
            
        case "pereo":
            switch str.lowercased() {
            case "1s":
                return "perissem"
            case "2s":
                return "perisses"
            case "3s":
                return "perisset"
            case "1p":
                return "perissemus"
            case "2p":
                return "perissetis"
            case "3p":
                return "perissent"
            default:
                return "cant find number and person"
            }
        case "redeo":
            switch str.lowercased() {
            case "1s":
                return "redissem"
            case "2s":
                return "redisses"
            case "3s":
                return "redisset"
            case "1p":
                return "redissemus"
            case "2p":
                return "redissetis"
            case "3p":
                return "redissent"
            default:
                return "cant find number and person"
            }
        case "volo":
            switch str.lowercased() {
            case "1s":
                return "voluissem"
            case "2s":
                return "voluisses"
            case "3s":
                return "volisset"
            case "1p":
                return "voluissemus"
            case "2p":
                return "voluissetis"
            case "3p":
                return "voluissent"
            default:
                return "cant find number and person"
            }
            
        default:
            return "cant find verb"
        }
    }
    override func GetPassiveIndicitivePresent(str: String) -> String {
        switch present1S {
        case "sum":
            return "none"
        case "absum":
            return "none"
        case "adsum":
            return "none"
        case "possum":
            return "none"
        case "aufero":
            switch str.lowercased() {
            case "1s":
                return present1S
            case "2s":
                return "auferor"
            case "3s":
                return "auferis"
            case "1p":
                return "aufermur"
            case "2p":
                return "aufermini"
            case "3p":
                return "auferuntur"
            default:
                return "cant find number and person"
            }
        case "copei":
            return "none"
        case "eo":
            switch str.lowercased() {
            case "1s":
                return "eor"
            case "2s":
                return "iris"
            case "3s":
                return "itur"
            case "1p":
                return "imur"
            case "2p":
                return "imini"
            case "3p":
                return "euntur"
            default:
                return "cant find number and person"
            }
        case "":
            switch str.lowercased() {
            case "1s":
                return "feror"
            case "2s":
                return "feris"
            case "3s":
                return "fertur"
            case "1p":
                return "fermur"
            case "2p":
                return "fermini"
            case "3p":
                return "feruntur"
            default:
                return "cant find number and person"
            }
        case "inquit":
            return "none"
        case "malo":
            return"none"
        case "nolo":
            return "none"
        case "offero":
            switch str.lowercased() {
            case "1s":
                return "offeror"
            case "2s":
                return "offerris"
            case "3s":
                return "offertur"
            case "1p":
                return "offermur"
            case "2p":
                return "offerimini"
            case "3p":
                return "offeruntur"
            default:
                return "cant find number and person"
            }
        case "pereo":
            switch str.lowercased() {
            case "1s":
                return "pereor"
            case "2s":
                return "periris"
            case "3s":
                return "peritur"
            case "1p":
                return "perimur"
            case "2p":
                return "perimini"
            case "3p":
                return "pereuntur"
            default:
                return "cant find number and person"
            }
        case "redeo":
            switch str.lowercased() {
            case "1s":
                return "redeor"
            case "2s":
                return "rediris"
            case "3s":
                return "reditur"
            case "1p":
                return "redimur"
            case "2p":
                return "redimini"
            case "3p":
                return "redeuntur"
            default:
                return "cant find number and person"
            }
        case "volo":
            switch str.lowercased() {
            case "1s":
                return "volor"
            case "2s":
                return "volaris"
            case "3s":
                return "volatur"
            case "1p":
                return "volamur"
            case "2p":
                return "volamini"
            case "3p":
                return "volamini"
            default:
                return "cant find number and person"
            }
            
        default:
            return "cant find verb"
        }
    }
    override func GetPassiveIndicitiveImperfect(str: String) -> String {
        switch present1S {
        case "sum":
            return "none"
        case "absum":
            return "none"
        case "adsum":
            return "none"
        case "possum":
            return "none"
        case "aufero":
            switch str.lowercased() {
            case "1s":
                return "auferebar"
            case "2s":
                return "auferebaris"
            case "3s":
                return "auferebatur"
            case "1p":
                return "auferebamur"
            case "2p":
                return "auferebamini"
            case "3p":
                return "auferuntur"
            default:
                return "cant find number and person"
            }
        case "copei":
            return "none"
        case "eo":
            switch str.lowercased() {
            case "1s":
                return "ibar"
            case "2s":
                return "ibaris"
            case "3s":
                return "ibatur"
            case "1p":
                return "ibamur"
            case "2p":
                return "ibamini"
            case "3p":
                return "ibantur"
            default:
                return "cant find number and person"
            }
        case "fero":
            switch str.lowercased() {
            case "1s":
                return "ferebar"
            case "2s":
                return "ferebaris"
            case "3s":
                return "ferebatur"
            case "1p":
                return "ferebamur"
            case "2p":
                return "ferebamini"
            case "3p":
                return "ferebantur"
            default:
                return "cant find number and person"
            }
        case "inquit":
            return "none"
        case "malo":
            return"none"
        case "nolo":
            return "none"
        case "offero":
            switch str.lowercased() {
            case "1s":
                return "offerebar"
            case "2s":
                return "offerebaris"
            case "3s":
                return "offerebatur"
            case "1p":
                return "offerebamur"
            case "2p":
                return "offerebamini"
            case "3p":
                return "offerebantur"
            default:
                return "cant find number and person"
            }
        case "pereo":
            switch str.lowercased() {
            case "1s":
                return "peribar"
            case "2s":
                return "peribaris"
            case "3s":
                return "peribatur"
            case "1p":
                return "peribamur"
            case "2p":
                return "peribamini"
            case "3p":
                return "peribantur"
            default:
                return "cant find number and person"
            }
        case "redeo":
            switch str.lowercased() {
            case "1s":
                return "redibar"
            case "2s":
                return "redibaris"
            case "3s":
                return "redibatur"
            case "1p":
                return "redibamur"
            case "2p":
                return "redibamini"
            case "3p":
                return "redibantur"
            default:
                return "cant find number and person"
            }
        case "volo":
            switch str.lowercased() {
            case "1s":
                return "volabar"
            case "2s":
                return "volaris"
            case "3s":
                return "volabatur"
            case "1p":
                return "volabamur"
            case "2p":
                return "volabamini"
            case "3p":
                return "volabantur"
            default:
                return "cant find number and person"
            }
            
        default:
            return "cant find verb"
        }
    }
    // no need to as all of the verbs follow the pattern override func GetPassiveIndicitiveFuture(str: String)
    // same for passive indicitive pluperfect and passive subjective perfect and pluperfect
    override func GetPassiveSubjunctivePresent(str: String) -> String {
        switch present1S {
        case "sum":
            return "none"
        case "absum":
            return "none"
        case "adsum":
            return "none"
        case "possum":
            return "none"
        case "aufero":
            switch str.lowercased() {
            case "1s":
                return "auferar"
            case "2s":
                return "auferaris"
            case "3s":
                return "auferatur"
            case "1p":
                return "auferamur"
            case "2p":
                return "auferamini"
            case "3p":
                return "auferantur"
            default:
                return "cant find number and person"
            }
        case "copei":
            return "none"
        case "eo":
            switch str.lowercased() {
            case "1s":
                return "ear"
            case "2s":
                return "eares"
            case "3s":
                return "eatur"
            case "1p":
                return "eamur"
            case "2p":
                return "eameni"
            case "3p":
                return "eantur"
            default:
                return "cant find number and person"
            }
        case "fero":
            switch str.lowercased() {
            case "1s":
                return "ferar"
            case "2s":
                return "feraris"
            case "3s":
                return "feratur"
            case "1p":
                return "feramur"
            case "2p":
                return "feramini"
            case "3p":
                return "ferantur"
            default:
                return "cant find number and person"
            }
        case "inquit":
            return "none"
        case "malo":
            return"none"
        case "nolo":
            return "none"
        case "offero":
            switch str.lowercased() {
            case "1s":
                return "offerar"
            case "2s":
                return "offeraris"
            case "3s":
                return "offeratur"
            case "1p":
                return "offeramur"
            case "2p":
                return "offeramini"
            case "3p":
                return "offerantur"
            default:
                return "cant find number and person"
            }
        case "pereo":
            switch str.lowercased() {
            case "1s":
                return "perear"
            case "2s":
                return "pereares"
            case "3s":
                return "pereatur"
            case "1p":
                return "pereamur"
            case "2p":
                return "pereameni"
            case "3p":
                return "pereantur"
            default:
                return "cant find number and person"
            }
        case "redeo":
            switch str.lowercased() {
            case "1s":
                return "redear"
            case "2s":
                return "redeares"
            case "3s":
                return "redeatur"
            case "1p":
                return "redeamur"
            case "2p":
                return "redeameni"
            case "3p":
                return "redeantur"
            default:
                return "cant find number and person"
            }
        case "volo":
            switch str.lowercased() {
            case "1s":
                return "voler"
            case "2s":
                return "voleris"
            case "3s":
                return "voletur"
            case "1p":
                return "volemur"
            case "2p":
                return "volemini"
            case "3p":
                return "volentur"
            default:
                return "cant find number and person"
            }
            
        default:
            return "cant find verb"
        }
    }
    override func GetPassiveSubjunctiveImperfect(str: String) -> String {
        switch present1S {
        case "sum":
            return "none"
        case "absum":
            return "none"
        case "adsum":
            return "none"
        case "possum":
            return "none"
        case "aufero":
            switch str.lowercased() {
            case "1s":
                return "aufererer"
            case "2s":
                return "auferereris"
            case "3s":
                return "aufereretur"
            case "1p":
                return "aufereremur"
            case "2p":
                return "aufereremini"
            case "3p":
                return "aufererentur"
            default:
                return "cant find number and person"
            }
        case "copei":
            return "none"
        case "eo":
            switch str.lowercased() {
            case "1s":
                return "irer"
            case "2s":
                return "ireris"
            case "3s":
                return "iretur"
            case "1p":
                return "iremur"
            case "2p":
                return "iremini"
            case "3p":
                return "irentur"
            default:
                return "cant find number and person"
            }
        case "fero":
            switch str.lowercased() {
            case "1s":
                return "fererer"
            case "2s":
                return "ferereris"
            case "3s":
                return "fereretur"
            case "1p":
                return "fereremur"
            case "2p":
                return "fereremini"
            case "3p":
                return "fererentur"
            default:
                return "cant find number and person"
            }
        case "inquit":
            return "none"
        case "malo":
            return"none"
        case "nolo":
            return "none"
        case "offero":
            switch str.lowercased() {
            case "1s":
                return "offererer"
            case "2s":
                return "offerereris"
            case "3s":
                return "offereretur"
            case "1p":
                return "offereremur"
            case "2p":
                return "offereremini"
            case "3p":
                return "offererentur"
            default:
                return "cant find number and person"
            }
        case "pereo":
            switch str.lowercased() {
            case "1s":
                return "perirer"
            case "2s":
                return "perireris"
            case "3s":
                return "periretur"
            case "1p":
                return "periremur"
            case "2p":
                return "periremini"
            case "3p":
                return "pereirentur"
            default:
                return "cant find number and person"
            }
        case "redeo":
            switch str.lowercased() {
            case "1s":
                return "redirer"
            case "2s":
                return "redireris"
            case "3s":
                return "rediretur"
            case "1p":
                return "rediremur"
            case "2p":
                return "rediremini"
            case "3p":
                return "redeirentur"
            default:
                return "cant find number and person"
            }
        case "volo":
            switch str.lowercased() {
            case "1s":
                return "volarer"
            case "2s":
                return "volareris"
            case "3s":
                return "volaretur"
            case "1p":
                return "volaremur"
            case "2p":
                return "volaremini"
            case "3p":
                return "volarentur"
            default:
                return "cant find number and person"
            }
            
        default:
            return "cant find verb"
        }
        
    }
}
