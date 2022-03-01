//
//  irregularVerbs.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 04/10/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import Foundation
//IRREGULAR VERBS - VERBS THAT DONT CONFORM TO THE OTHER CONJUGATIONS SO WE HAVE TO HANDLE THEM INDEPENDENTLY
//AFTER STARTING THIS I NOTICED MOST OF THEM FOLLOW THE 'SUM' IRREGULAR VERB WITH PREPOSITIONS STUCK ONTO THE FORNT
//I COULD HAVE WRITTEN A LITTLE SUBROUTINE TO MAKE THIS A LOT EASIER BUT IT WAS ALREADY TOO LATE AND HAVE OTHER THINGS TO FOUCS ON
class IrregularVerb : Verb{
    // for irregular verbs we have define it case by case becuase humans are weird
    override func GetImperfect(personNum:PersonNum) -> String {
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
            switch  personNum{
            case .FirstSingular:
                return "eram"
            case .SecondSingular:
                return "eras"
            case .ThirdSingular:
                return "erat"
            case .FirstPlural:
                return "eramus"
            case .SecondPlural:
                return "eratis"
            case .ThirdPlural:
                return "erant"
            }
        case "absum":
            switch personNum {
            case .FirstSingular:
                return "aberam"
            case .SecondSingular:
                return "aberas"
            case .ThirdSingular:
                return "aberat"
            case .FirstPlural:
                return "aberamus"
            case .SecondPlural:
                return "aberatis"
            case .ThirdPlural:
                return "aberant"
            }
        case "adsum":
            switch personNum {
            case .FirstSingular:
                return "aderam"
            case .SecondSingular:
                return "aderas"
            case .ThirdSingular:
                return "aderat"
            case .FirstPlural:
                return "aderamus"
            case .SecondPlural:
                return "aderatis"
            case .ThirdPlural:
                return "aderant"
            }
        case "possum":
            switch personNum {
            case .FirstSingular:
                return "poteram"
            case .SecondSingular:
                return "poteras"
            case .ThirdSingular:
                return "poterat"
            case .FirstPlural:
                return "poteramus"
            case .SecondPlural:
                return "poteratis"
            case .ThirdPlural:
                return "poterant"
            }
        case "aufero":
            switch personNum {
            case .FirstSingular:
                return "auferebam"
            case .SecondSingular:
                return "auferebas"
            case .ThirdSingular:
                return "auferebat"
            case .FirstPlural:
                return "auferebamus"
            case .SecondPlural:
                return "auferebatis"
            case .ThirdPlural:
                return "auferebant"
            }
        case "copei":
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return "coepebam"
            case .ThirdSingular:
                return "coepebas"
            case .FirstPlural:
                return "coepebat"
            case .SecondPlural:
                return "coepebamus"
            case .ThirdPlural:
                return "coepebant"
            }
        case "eo":
            switch personNum {
            case .FirstSingular:
                return "ibam"
            case .SecondSingular:
                return "ibas"
            case .ThirdSingular:
                return "ibat"
            case .FirstPlural:
                return "ibamus"
            case .SecondPlural:
                return "ibatis"
            case .ThirdPlural:
                return "ibant"
            }
        case "":
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return "fers"
            case .ThirdSingular:
                return "fert"
            case .FirstPlural:
                return "ferimus"
            case .SecondPlural:
                return "fertis"
            case .ThirdPlural:
                return "ferunt"
            }
        case "inquit":
            switch personNum {
            case .FirstSingular:
                return "not needed"
            case .SecondSingular:
                return "not needed"
            case .ThirdSingular:
                return "not needed"
            case .FirstPlural:
                return "not needed"
            case .SecondPlural:
                return "not needed"
            case .ThirdPlural:
                return "not needed"
            }
        case "malo":
            switch personNum {
            case .FirstSingular:
                return "malebam"
            case .SecondSingular:
                return "malebas"
            case .ThirdSingular:
                return "malebat"
            case .FirstPlural:
                return "malebamus"
            case .SecondPlural:
                return "malebatis"
            case .ThirdPlural:
                return "malebant"
            }
        case "nolo":
            switch personNum {
            case .FirstSingular:
                return "nolebam"
            case .SecondSingular:
                return "nolebas"
            case .ThirdSingular:
                return "nolebat"
            case .FirstPlural:
                return "nolebamus"
            case .SecondPlural:
                return "nolebatis"
            case .ThirdPlural:
                return "nolebant"
            }
        case "offero":
            switch personNum {
            case .FirstSingular:
                return "offerebam"
            case .SecondSingular:
                return "offerebas"
            case .ThirdSingular:
                return "offerebat"
            case .FirstPlural:
                return "offerebamus"
            case .SecondPlural:
                return "offerebatis"
            case .ThirdPlural:
                return "offerebant"
            }
        case "pereo":
            switch personNum {
            case .FirstSingular:
                return "peribam"
            case .SecondSingular:
                return "peribas"
            case .ThirdSingular:
                return "peribat"
            case .FirstPlural:
                return "peribamus"
            case .SecondPlural:
                return "peribatis"
            case .ThirdPlural:
                return "peribant"
            }
        case "redeo":
            switch personNum {
            case .FirstSingular:
                return "redibam"
            case .SecondSingular:
                return "redibas"
            case .ThirdSingular:
                return "redibat"
            case .FirstPlural:
                return "redibamus"
            case .SecondPlural:
                return "redibatis"
            case .ThirdPlural:
                return "redibant"
            }
        case "volo":
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return "vis"
            case .ThirdSingular:
                return "vult"
            case .FirstPlural:
                return "volumus"
            case .SecondPlural:
                return "vultis"
            case .ThirdPlural:
                return "volunt"
            }
        default:
            return "cant find verb"
        }
    }
    override func GetPresent(personNum: PersonNum) -> String {
        switch present1S {
        case "sum":
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return "es"
            case .ThirdSingular:
                return "est"
            case .FirstPlural:
                return "summus"
            case .SecondPlural:
                return "estis"
            case .ThirdPlural:
                return "sunt"
            }
        case "absum":
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return "abes"
            case .ThirdSingular:
                return "abest"
            case .FirstPlural:
                return "absummus"
            case .SecondPlural:
                return "abestis"
            case .ThirdPlural:
                return "absunt"
            }
        case "adsum":
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return "adses"
            case .ThirdSingular:
                return "adest"
            case .FirstPlural:
                return "adsummus"
            case .SecondPlural:
                return "adestis"
            case .ThirdPlural:
                return "adsunt"
            }
        case "possum":
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return "potes"
            case .ThirdSingular:
                return "potest"
            case .FirstPlural:
                return "posummus"
            case .SecondPlural:
                return "potestis"
            case .ThirdPlural:
                return "potsunt"
            }
        case "aufero":
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return "aufers"
            case .ThirdSingular:
                return "aufert"
            case .FirstPlural:
                return "auferimus"
            case .SecondPlural:
                return "aufertis"
            case .ThirdPlural:
                return "auferunt"
            }
        case "copei":
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return "coepis"
            case .ThirdSingular:
                return "coepit"
            case .FirstPlural:
                return "coepimus"
            case .SecondPlural:
                return "coepistis"
            case .ThirdPlural:
                return "coepiunt"
            }
        case "eo":
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return "is"
            case .ThirdSingular:
                return "it"
            case .FirstPlural:
                return "imus"
            case .SecondPlural:
                return "isti"
            case .ThirdPlural:
                return "eunt"
            }
        case "":
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return "fers"
            case .ThirdSingular:
                return "fert"
            case .FirstPlural:
                return "ferimus"
            case .SecondPlural:
                return "fertis"
            case .ThirdPlural:
                return "ferunt"
            }
        case "inquit":
            switch personNum {
            case .FirstSingular:
                return "not needed"
            case .SecondSingular:
                return "not needed"
            case .ThirdSingular:
                return present1S
            case .FirstPlural:
                return "not needed"
            case .SecondPlural:
                return "not needed"
            case .ThirdPlural:
                return "not needed"
            }
        case "malo":
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return "mavis"
            case .ThirdSingular:
                return "mavult"
            case .FirstPlural:
                return "malumus"
            case .SecondPlural:
                return "mavultis"
            case .ThirdPlural:
                return "malunt"
            }
        case "nolo":
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return "novis"
            case .ThirdSingular:
                return "novult"
            case .FirstPlural:
                return "nolumus"
            case .SecondPlural:
                return "nolitis"
            case .ThirdPlural:
                return "nolunt"
            }
        case "offero":
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return "offers"
            case .ThirdSingular:
                return "offert"
            case .FirstPlural:
                return "offerimus"
            case .SecondPlural:
                return "offertis"
            case .ThirdPlural:
                return "offerunt"
            }
        case "pereo":
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return "peris"
            case .ThirdSingular:
                return "perit"
            case .FirstPlural:
                return "perimus"
            case .SecondPlural:
                return "peritis"
            case .ThirdPlural:
                return "pereunt"
            }
        case "redeo":
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return "redis"
            case .ThirdSingular:
                return "redit"
            case .FirstPlural:
                return "redimus"
            case .SecondPlural:
                return "reditis"
            case .ThirdPlural:
                return "redeunt"
            }
        case "volo":
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return "vis"
            case .ThirdSingular:
                return "vult"
            case .FirstPlural:
                return "volumus"
            case .SecondPlural:
                return "vultis"
            case .ThirdPlural:
                return "volunt"
            }
            
        default:
            return "cant find verb"
        }
    }
    override func GetFuture(personNum: PersonNum) -> String {
        switch present1S {
        case "sum":
            switch personNum {
            case .FirstSingular:
                return "ero"
            case .SecondSingular:
                return "eris"
            case .ThirdSingular:
                return "erit"
            case .FirstPlural:
                return "erimus"
            case .SecondPlural:
                return "eritis"
            case .ThirdPlural:
                return "erunt"
            }
        case "absum":
            switch personNum {
            case .FirstSingular:
                return "abero"
            case .SecondSingular:
                return "aberis"
            case .ThirdSingular:
                return "aberit"
            case .FirstPlural:
                return "aberimus"
            case .SecondPlural:
                return "aberitis"
            case .ThirdPlural:
                return "aberunt"
            }
        case "adsum":
            switch personNum {
            case .FirstSingular:
                return "adero"
            case .SecondSingular:
                return "aderis"
            case .ThirdSingular:
                return "aderit"
            case .FirstPlural:
                return "aderimus"
            case .SecondPlural:
                return "aderitis"
            case .ThirdPlural:
                return "aderunt"
            }
        case "possum":
            switch personNum {
            case .FirstSingular:
                return "potero"
            case .SecondSingular:
                return "poteris"
            case .ThirdSingular:
                return "poterit"
            case .FirstPlural:
                return "poterimus"
            case .SecondPlural:
                return "poteritis"
            case .ThirdPlural:
                return "poterunt"
            }
        case "aufero":
            switch personNum {
            case .FirstSingular:
                return "auferam"
            case .SecondSingular:
                return "auferes"
            case .ThirdSingular:
                return "auferet"
            case .FirstPlural:
                return "auferemus"
            case .SecondPlural:
                return "auferetis"
            case .ThirdPlural:
                return "auferent"
            }
        case "copei":
            return "can not find"
        case "eo":
            switch personNum {
            case .FirstSingular:
                return "ibo"
            case .SecondSingular:
                return "ibis"
            case .ThirdSingular:
                return "ibit"
            case .FirstPlural:
                return "ibimus"
            case .SecondPlural:
                return "ibisti"
            case .ThirdPlural:
                return "ibunt"
                
            }
        case "":
            switch personNum {
            case .FirstSingular:
                return "feram"
            case .SecondSingular:
                return "feres"
            case .ThirdSingular:
                return "feret"
            case .FirstPlural:
                return "feremus"
            case .SecondPlural:
                return "feretis"
            case .ThirdPlural:
                return "ferent"
                
            }
        case "inquit":
            return "not needed"
        case "malo":
            switch personNum {
            case .FirstSingular:
                return "malam"
            case .SecondSingular:
                return "males"
            case .ThirdSingular:
                return "malet"
            case .FirstPlural:
                return "malemus"
            case .SecondPlural:
                return "maletis"
            case .ThirdPlural:
                return "malent"
                
            }
        case "nolo":
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return "nolam"
            case .ThirdSingular:
                return "noles"
            case .FirstPlural:
                return "nolet"
            case .SecondPlural:
                return "noletis"
            case .ThirdPlural:
                return "nolent"
                
            }
        case "offero":
            switch personNum {
            case .FirstSingular:
                return "offeram"
            case .SecondSingular:
                return "offeres"
            case .ThirdSingular:
                return "offeret"
            case .FirstPlural:
                return "offeremus"
            case .SecondPlural:
                return "offeretis"
            case .ThirdPlural:
                return "offerent"
                
            }
        case "pereo":
            switch personNum {
            case .FirstSingular:
                return "peribo"
            case .SecondSingular:
                return "peribis"
            case .ThirdSingular:
                return "peribit"
            case .FirstPlural:
                return "peribimus"
            case .SecondPlural:
                return "peribitis"
            case .ThirdPlural:
                return "peribunt"
                
            }
        case "redeo":
            switch personNum {
            case .FirstSingular:
                return "redibo"
            case .SecondSingular:
                return "redibis"
            case .ThirdSingular:
                return "redibit"
            case .FirstPlural:
                return "redibimus"
            case .SecondPlural:
                return "redibitis"
            case .ThirdPlural:
                return "redibunt"
                
            }
        case "volo":
            switch personNum {
            case .FirstSingular:
                return "volam"
            case .SecondSingular:
                return "voles"
            case .ThirdSingular:
                return "volet"
            case .FirstPlural:
                return "volemus"
            case .SecondPlural:
                return "vuletis"
            case .ThirdPlural:
                return "volent"
                
            }
            
        default:
            return "cant find verb"
        }
    }
    override func GetPerfect(personNum: PersonNum) -> String {
        switch present1S {
        case "sum":
            switch personNum {
            case .FirstSingular:
                return "fui"
            case .SecondSingular:
                return "fuisti"
            case .ThirdSingular:
                return "fuit"
            case .FirstPlural:
                return "fuimus"
            case .SecondPlural:
                return "fuistis"
            case .ThirdPlural:
                return "fuerunt"
                
            }
        case "absum":
            switch personNum {
            case .FirstSingular:
                return "abfui"
            case .SecondSingular:
                return "abfuisti"
            case .ThirdSingular:
                return "abfuit"
            case .FirstPlural:
                return "abfuimus"
            case .SecondPlural:
                return "abfuitis"
            case .ThirdPlural:
                return "abferunt"
                
            }
        case "adsum":
            switch personNum {
            case .FirstSingular:
                return "adfui"
            case .SecondSingular:
                return "adfuisti"
            case .ThirdSingular:
                return "adfuit"
            case .FirstPlural:
                return "adfuimus"
            case .SecondPlural:
                return "adfuistis"
            case .ThirdPlural:
                return "adfuerunt"
                
            }
        case "possum":
            switch personNum {
            case .FirstSingular:
                return "potui"
            case .SecondSingular:
                return "potuisti"
            case .ThirdSingular:
                return "potuit"
            case .FirstPlural:
                return "potuimus"
            case .SecondPlural:
                return "potuitis"
            case .ThirdPlural:
                return "potuerunt"
            }
        case "aufero":
            switch personNum {
            case .FirstSingular:
                return "autbsli"
            case .SecondSingular:
                return "autbslisti"
            case .ThirdSingular:
                return "autbsit"
            case .FirstPlural:
                return "autbslimus"
            case .SecondPlural:
                return "autbslistis"
            case .ThirdPlural:
                return "autbslerunt"
                
            }
        case "copei":
            return "can not find"
        case "eo":
            switch personNum {
            case .FirstSingular:
                return "ii"
            case .SecondSingular:
                return "iisti"
            case .ThirdSingular:
                return "iit"
            case .FirstPlural:
                return "iimus"
            case .SecondPlural:
                return "isitis"
            case .ThirdPlural:
                return "ierunt"
                
            }
        case "fero":
            switch personNum {
            case .FirstSingular:
                return "tuli"
            case .SecondSingular:
                return "tulisti"
            case .ThirdSingular:
                return "tulit"
            case .FirstPlural:
                return "tulimus"
            case .SecondPlural:
                return "tulistis"
            case .ThirdPlural:
                return "tulerunt"
                
            }
        case "inquit":
            return "not needed"
        case "malo":
            switch personNum {
            case .FirstSingular:
                return "malui"
            case .SecondSingular:
                return "maluisti"
            case .ThirdSingular:
                return "maluit"
            case .FirstPlural:
                return "maluimus"
            case .SecondPlural:
                return "maluisitis"
            case .ThirdPlural:
                return "maluerunt"
                
            }
        case "nolo":
            switch personNum {
            case .FirstSingular:
                return "nolui"
            case .SecondSingular:
                return "noluisti"
            case .ThirdSingular:
                return "noluit"
            case .FirstPlural:
                return "noluimus"
            case .SecondPlural:
                return "noluistis"
            case .ThirdPlural:
                return "noluerunt"
                
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
            switch personNum {
            case .FirstSingular:
                return "oftuli"
            case .SecondSingular:
                return "oftulisti"
            case .ThirdSingular:
                return "oftulit"
            case .FirstPlural:
                return "oftulimus"
            case .SecondPlural:
                return "oftulistis"
            case .ThirdPlural:
                return "oftulerunt"
                
            }
        case "pereo":
            switch personNum {
            case .FirstSingular:
                return "perii"
            case .SecondSingular:
                return "peristi"
            case .ThirdSingular:
                return "periit"
            case .FirstPlural:
                return "perimus"
            case .SecondPlural:
                return "peristis"
            case .ThirdPlural:
                return "perierunt"
                
            }
        case "redeo":
            switch personNum {
            case .FirstSingular:
                return "redii"
            case .SecondSingular:
                return "redisti"
            case .ThirdSingular:
                return "rediit"
            case .FirstPlural:
                return "redimus"
            case .SecondPlural:
                return "redistis"
            case .ThirdPlural:
                return "redierunt"
                
            }
        case "volo":
            switch personNum {
            case .FirstSingular:
                return "volui"
            case .SecondSingular:
                return "voluisti"
            case .ThirdSingular:
                return "voluit"
            case .FirstPlural:
                return "voluimus"
            case .SecondPlural:
                return "vuluistis"
            case .ThirdPlural:
                return "voluierunt"
                
            }
            
        default:
            return "cant find verb"
        }
    }
    override func GetPluperfect(personNum: PersonNum) -> String{
        switch present1S {
        case "sum":
            switch personNum {
            case .FirstSingular:
                return "sim"
            case .SecondSingular:
                return "sis"
            case .ThirdSingular:
                return "sit"
            case .FirstPlural:
                return "simus"
            case .SecondPlural:
                return "sitis"
            case .ThirdPlural:
                return "sint"
                
            }
        case "absum":
            switch personNum {
            case .FirstSingular:
                return "absim"
            case .SecondSingular:
                return "absis"
            case .ThirdSingular:
                return "absit"
            case .FirstPlural:
                return "absimus"
            case .SecondPlural:
                return "absitis"
            case .ThirdPlural:
                return "absint"
                
            }
        case "adsum":
            switch personNum {
            case .FirstSingular:
                return "adsim"
            case .SecondSingular:
                return "adsis"
            case .ThirdSingular:
                return "adsit"
            case .FirstPlural:
                return "adsimus"
            case .SecondPlural:
                return "adsitis"
            case .ThirdPlural:
                return "adsint"
            }
        case "possum":
            switch personNum {
            case .FirstSingular:
                return "possim"
            case .SecondSingular:
                return "possis"
            case .ThirdSingular:
                return "possit"
            case .FirstPlural:
                return "possimus"
            case .SecondPlural:
                return "possitis"
            case .ThirdPlural:
                return "possint"
            }
        case "aufero":
            switch personNum {
            case .FirstSingular:
                return "autbsleram"
            case .SecondSingular:
                return "autbsleras"
            case .ThirdSingular:
                return "autbslerat"
            case .FirstPlural:
                return "autbsleramus"
            case .SecondPlural:
                return "autbsleratis"
            case .ThirdPlural:
                return "autbslerant"
                
            }
        case "copei":
            return "can not find"
        case "eo":
            switch personNum {
            case .FirstSingular:
                return "eam"
            case .SecondSingular:
                return "eas"
            case .ThirdSingular:
                return "eat"
            case .FirstPlural:
                return "eamus"
            case .SecondPlural:
                return "eates"
            case .ThirdPlural:
                return "eant"
                
            }
        case "fero":
            switch personNum {
            case .FirstSingular:
                return "feram"
            case .SecondSingular:
                return "feras"
            case .ThirdSingular:
                return "ferat"
            case .FirstPlural:
                return "feramus"
            case .SecondPlural:
                return "feratis"
            case .ThirdPlural:
                return "ferant"
                
            }
        case "inquit":
            return "not needed"
        case "malo":
            switch personNum {
            case .FirstSingular:
                return "malim"
            case .SecondSingular:
                return "malis"
            case .ThirdSingular:
                return "malit"
            case .FirstPlural:
                return "malimus"
            case .SecondPlural:
                return "malitis"
            case .ThirdPlural:
                return "malint"
                
            }
        case "nolo":
            switch personNum {
            case .FirstSingular:
                return "nolim"
            case .SecondSingular:
                return "nolis"
            case .ThirdSingular:
                return "nolit"
            case .FirstPlural:
                return "nolimus"
            case .SecondPlural:
                return "nolitis"
            case .ThirdPlural:
                return "nolint"
                
            }
        case "offero":
            switch personNum {
            case .FirstSingular:
                return "offeram"
            case .SecondSingular:
                return "offeras"
            case .ThirdSingular:
                return "offerat"
            case .FirstPlural:
                return "offeramus"
            case .SecondPlural:
                return "offeratis"
            case .ThirdPlural:
                return "offerant"
                
            }
            
        case "pereo":
            switch personNum {
            case .FirstSingular:
                return "peream"
            case .SecondSingular:
                return "pereas"
            case .ThirdSingular:
                return "pereat"
            case .FirstPlural:
                return "pereamus"
            case .SecondPlural:
                return "perwates"
            case .ThirdPlural:
                return "pereant"
                
            }
        case "redeo":
            switch personNum {
            case .FirstSingular:
                return "redeam"
            case .SecondSingular:
                return "redeas"
            case .ThirdSingular:
                return "redeat"
            case .FirstPlural:
                return "redeamus"
            case .SecondPlural:
                return "redeates"
            case .ThirdPlural:
                return "redeant"
                
            }
        case "volo":
            switch personNum {
            case .FirstSingular:
                return "volim"
            case .SecondSingular:
                return "volis"
            case .ThirdSingular:
                return "volit"
            case .FirstPlural:
                return "volimus"
            case .SecondPlural:
                return "volitis"
            case .ThirdPlural:
                return "volint"
                
            }
            
        default:
            return "cant find verb"
        }
    }
    override func GetSubjunctivePresent(personNum: PersonNum) -> String{
        switch present1S {
        case "sum":
            switch personNum {
            case .FirstSingular:
                return "fueram"
            case .SecondSingular:
                return "fueras"
            case .ThirdSingular:
                return "fuerat"
            case .FirstPlural:
                return "fueramus"
            case .SecondPlural:
                return "fueratis"
            case .ThirdPlural:
                return "fuerant"
                
            }
        case "absum":
            switch personNum {
            case .FirstSingular:
                return "abfueram"
            case .SecondSingular:
                return "abfueras"
            case .ThirdSingular:
                return "abfuerat"
            case .FirstPlural:
                return "abfueramus"
            case .SecondPlural:
                return "abfueratis"
            case .ThirdPlural:
                return "abfuerant"
                
            }
        case "adsum":
            switch personNum {
            case .FirstSingular:
                return "adfueram"
            case .SecondSingular:
                return "adfueras"
            case .ThirdSingular:
                return "adfuerat"
            case .FirstPlural:
                return "adfueramus"
            case .SecondPlural:
                return "adfueratis"
            case .ThirdPlural:
                return "adfuerant"
                
            }
        case "possum":
            switch personNum {
            case .FirstSingular:
                return "potueram"
            case .SecondSingular:
                return "potueras"
            case .ThirdSingular:
                return "potuerat"
            case .FirstPlural:
                return "potueramus"
            case .SecondPlural:
                return "potueratis"
            case .ThirdPlural:
                return "potuerant"
            }
        case "aufero":
            switch personNum {
            case .FirstSingular:
                return "autuleram"
            case .SecondSingular:
                return "autuleras"
            case .ThirdSingular:
                return "autulerat"
            case .FirstPlural:
                return "autuleramus"
            case .SecondPlural:
                return "autuleratis"
            case .ThirdPlural:
                return "autulerant"
                
            }
        case "copei":
            return "can not find"
        case "eo":
            switch personNum {
            case .FirstSingular:
                return "ieram"
            case .SecondSingular:
                return "ieras"
            case .ThirdSingular:
                return "ierat"
            case .FirstPlural:
                return "ieramus"
            case .SecondPlural:
                return "ieratis"
            case .ThirdPlural:
                return "ierant"
                
            }
        case "fero":
            switch personNum {
            case .FirstSingular:
                return "tuleram"
            case .SecondSingular:
                return "tuleras"
            case .ThirdSingular:
                return "tulerat"
            case .FirstPlural:
                return "tuleramus"
            case .SecondPlural:
                return "tuleratis"
            case .ThirdPlural:
                return "tulerant"
                
            }
        case "inquit":
            return "not needed"
        case "malo":
            switch personNum {
            case .FirstSingular:
                return "malueram"
            case .SecondSingular:
                return "malueras"
            case .ThirdSingular:
                return "maluerat"
            case .FirstPlural:
                return "malueramus"
            case .SecondPlural:
                return "malueratis"
            case .ThirdPlural:
                return "maluerant"
                
            }
        case "nolo":
            switch personNum {
            case .FirstSingular:
                return "nolueram"
            case .SecondSingular:
                return "nolueras"
            case .ThirdSingular:
                return "noluerat"
            case .FirstPlural:
                return "nolueramus"
            case .SecondPlural:
                return "nolueratis"
            case .ThirdPlural:
                return "noluerant"
                
            }
        case "offero":
            switch personNum {
            case .FirstSingular:
                return "obtuleram"
            case .SecondSingular:
                return "obtuleras"
            case .ThirdSingular:
                return "obtulerat"
            case .FirstPlural:
                return "obtuleramus"
            case .SecondPlural:
                return "obtuleratis"
            case .ThirdPlural:
                return "obtulerant"
                
            }
            
        case "pereo":
            switch personNum {
            case .FirstSingular:
                return "perieram"
            case .SecondSingular:
                return "perieras"
            case .ThirdSingular:
                return "perierat"
            case .FirstPlural:
                return "perieramus"
            case .SecondPlural:
                return "perieratis"
            case .ThirdPlural:
                return "perierant"
                
            }
        case "redeo":
            switch personNum {
            case .FirstSingular:
                return "redieram"
            case .SecondSingular:
                return "redieras"
            case .ThirdSingular:
                return "redierat"
            case .FirstPlural:
                return "redieramus"
            case .SecondPlural:
                return "redieratis"
            case .ThirdPlural:
                return "redierant"
                
            }
        case "volo":
            switch personNum {
            case .FirstSingular:
                return "volueram"
            case .SecondSingular:
                return "volueras"
            case .ThirdSingular:
                return "voluerat"
            case .FirstPlural:
                return "volueramus"
            case .SecondPlural:
                return "vulueratis"
            case .ThirdPlural:
                return "voluerant"
                
            }
            
        default:
            return "cant find verb"
        }
    }
    override func GetSubjunctiveImperfect(personNum: PersonNum) -> String {
        switch present1S {
        case "sum":
            switch personNum {
            case .FirstSingular:
                return "essem"
            case .SecondSingular:
                return "esses"
            case .ThirdSingular:
                return "esset"
            case .FirstPlural:
                return "essemus"
            case .SecondPlural:
                return "essetis"
            case .ThirdPlural:
                return "essent"
                
            }
        case "absum":
            switch personNum {
            case .FirstSingular:
                return "abessem"
            case .SecondSingular:
                return "abesses"
            case .ThirdSingular:
                return "abesset"
            case .FirstPlural:
                return "abessemus"
            case .SecondPlural:
                return "abessetis"
            case .ThirdPlural:
                return "abessent"
                
            }
        case "adsum":
            switch personNum {
            case .FirstSingular:
                return "adessem"
            case .SecondSingular:
                return "adesses"
            case .ThirdSingular:
                return "adesset"
            case .FirstPlural:
                return "adessemus"
            case .SecondPlural:
                return "adessetis"
            case .ThirdPlural:
                return "adessent"
                
            }
        case "possum":
            switch personNum {
            case .FirstSingular:
                return "possem"
            case .SecondSingular:
                return "posses"
            case .ThirdSingular:
                return "posset"
            case .FirstPlural:
                return "possemus"
            case .SecondPlural:
                return "possetis"
            case .ThirdPlural:
                return "possent"
                
            }
        case "aufero":
            switch personNum {
            case .FirstSingular:
                return "auferem"
            case .SecondSingular:
                return "auferes"
            case .ThirdSingular:
                return "auferet"
            case .FirstPlural:
                return "auferemus"
            case .SecondPlural:
                return "auferetis"
            case .ThirdPlural:
                return "auferent"
                
            }
        case "copei":
            return "can not find"
        case "eo":
            switch personNum {
            case .FirstSingular:
                return "irem"
            case .SecondSingular:
                return "ires"
            case .ThirdSingular:
                return "iret"
            case .FirstPlural:
                return "iremus"
            case .SecondPlural:
                return "iretis"
            case .ThirdPlural:
                return "irent"
                
            }
        case "fero":
            switch personNum {
            case .FirstSingular:
                return "ferem"
            case .SecondSingular:
                return "feres"
            case .ThirdSingular:
                return "feret"
            case .FirstPlural:
                return "feremus"
            case .SecondPlural:
                return "feretis"
            case .ThirdPlural:
                return "ferent"
                
            }
        case "inquit":
            return "not needed"
        case "malo":
            switch personNum {
            case .FirstSingular:
                return "mallem"
            case .SecondSingular:
                return "malles"
            case .ThirdSingular:
                return "mallet"
            case .FirstPlural:
                return "mallemus"
            case .SecondPlural:
                return "malletis"
            case .ThirdPlural:
                return "mallent"
                
            }
        case "nolo":
            switch personNum {
            case .FirstSingular:
                return "nollem"
            case .SecondSingular:
                return "nolles"
            case .ThirdSingular:
                return "nollet"
            case .FirstPlural:
                return "nollemus"
            case .SecondPlural:
                return "nolletis"
            case .ThirdPlural:
                return "nollent"
                
            }
        case "offero":
            switch personNum {
            case .FirstSingular:
                return "offerem"
            case .SecondSingular:
                return "offeres"
            case .ThirdSingular:
                return "offeret"
            case .FirstPlural:
                return "offeremus"
            case .SecondPlural:
                return "offeretis"
            case .ThirdPlural:
                return "offerent"
                
            }
            
        case "pereo":
            switch personNum {
            case .FirstSingular:
                return "perirem"
            case .SecondSingular:
                return "perires"
            case .ThirdSingular:
                return "periret"
            case .FirstPlural:
                return "periremus"
            case .SecondPlural:
                return "periretis"
            case .ThirdPlural:
                return "perirent"
                
            }
        case "redeo":
            switch personNum {
            case .FirstSingular:
                return "redirem"
            case .SecondSingular:
                return "redires"
            case .ThirdSingular:
                return "rediremus"
            case .FirstPlural:
                return "rediremus"
            case .SecondPlural:
                return "rediretis"
            case .ThirdPlural:
                return "redirent"
                
            }
        case "volo":
            switch personNum {
            case .FirstSingular:
                return "vellem"
            case .SecondSingular:
                return "velles"
            case .ThirdSingular:
                return "vellet"
            case .FirstPlural:
                return "vellemus"
            case .SecondPlural:
                return "velletis"
            case .ThirdPlural:
                return "vellent"
                
            }
            
        default:
            return "cant find verb"
        }
        
    }
    override func GetSubjunctivePerfect(personNum: PersonNum) -> String {
        switch present1S {
        case "sum":
            switch personNum {
            case .FirstSingular:
                return "fuerim"
            case .SecondSingular:
                return "fueris"
            case .ThirdSingular:
                return "fuerit"
            case .FirstPlural:
                return "fuerimus"
            case .SecondPlural:
                return "fueritis"
            case .ThirdPlural:
                return "fuerint"
                
            }
        case "absum":
            switch personNum {
            case .FirstSingular:
                return "abfuerim"
            case .SecondSingular:
                return "abfueris"
            case .ThirdSingular:
                return "abfuerit"
            case .FirstPlural:
                return "abfuerimus"
            case .SecondPlural:
                return "abfueritis"
            case .ThirdPlural:
                return "abfuerint"
                
            }
        case "adsum":
            switch personNum {
            case .FirstSingular:
                return "adfuerim"
            case .SecondSingular:
                return "adfueris"
            case .ThirdSingular:
                return "adfuerit"
            case .FirstPlural:
                return "adfuerimus"
            case .SecondPlural:
                return "adfueritis"
            case .ThirdPlural:
                return "adfuerint"
                
            }
        case "possum":
            switch personNum {
            case .FirstSingular:
                return "potuerim"
            case .SecondSingular:
                return "potueris"
            case .ThirdSingular:
                return "potuerit"
            case .FirstPlural:
                return "potuerimus"
            case .SecondPlural:
                return "potueritis"
            case .ThirdPlural:
                return "potuerint"
                
            }
        case "aufero":
            switch personNum {
            case .FirstSingular:
                return "autbslerim"
            case .SecondSingular:
                return "autbsleris"
            case .ThirdSingular:
                return "autbslerimus"
            case .FirstPlural:
                return "autbsleritis"
            case .SecondPlural:
                return "autbsleritis"
            case .ThirdPlural:
                return "autbslerint"
                
            }
        case "copei":
            return "can not find"
        case "eo":
            switch personNum {
            case .FirstSingular:
                return "ierim"
            case .SecondSingular:
                return "ieris"
            case .ThirdSingular:
                return "ierit"
            case .FirstPlural:
                return "ierimus"
            case .SecondPlural:
                return "ieritis"
            case .ThirdPlural:
                return "ierint"
                
            }
            
        case "fero":
            switch personNum {
            case .FirstSingular:
                return "tulerim"
            case .SecondSingular:
                return "tuleris"
            case .ThirdSingular:
                return "tulerit"
            case .FirstPlural:
                return "tulerimus"
            case .SecondPlural:
                return "tuleritis"
            case .ThirdPlural:
                return "tulerint"
                
            }
        case "inquit":
            return "not needed"
        case "malo":
            switch personNum {
            case .FirstSingular:
                return "maluerim"
            case .SecondSingular:
                return "malueris"
            case .ThirdSingular:
                return "maluerit"
            case .FirstPlural:
                return "maluerimus"
            case .SecondPlural:
                return "malueritis"
            case .ThirdPlural:
                return "maluerint"
                
            }
        case "nolo":
            switch personNum {
            case .FirstSingular:
                return "noluerim"
            case .SecondSingular:
                return "nolueris"
            case .ThirdSingular:
                return "noluerit"
            case .FirstPlural:
                return "noluerimus"
            case .SecondPlural:
                return "nolueritis"
            case .ThirdPlural:
                return "noluerint"
                
            }
        case "offero":
            switch personNum {
            case .FirstSingular:
                return "obtulerim"
            case .SecondSingular:
                return "obtuleris"
            case .ThirdSingular:
                return "obtulerit"
            case .FirstPlural:
                return "obtulerimus"
            case .SecondPlural:
                return "obtuleritis"
            case .ThirdPlural:
                return "obtulerint"
                
            }
            
        case "pereo":
            switch personNum {
            case .FirstSingular:
                return "perierim"
            case .SecondSingular:
                return "perieris"
            case .ThirdSingular:
                return "perierit"
            case .FirstPlural:
                return "perierimus"
            case .SecondPlural:
                return "perieritis"
            case .ThirdPlural:
                return "perierint"
                
            }
        case "redeo":
            switch personNum {
            case .FirstSingular:
                return "redierim"
            case .SecondSingular:
                return "redieris"
            case .ThirdSingular:
                return "redierit"
            case .FirstPlural:
                return "redierimus"
            case .SecondPlural:
                return "redieritis"
            case .ThirdPlural:
                return "redierint"
                
            }
        case "volo":
            switch personNum {
            case .FirstSingular:
                return "voluerim"
            case .SecondSingular:
                return "volueris"
            case .ThirdSingular:
                return "voluerit"
            case .FirstPlural:
                return "voluerimus"
            case .SecondPlural:
                return "volueritis"
            case .ThirdPlural:
                return "voluerint"
                
            }
            
        default:
            return "cant find verb"
        }
    }
    override func GetSubjunctivePluperfect(personNum: PersonNum) -> String {
        switch present1S {
        case "sum":
            switch personNum {
            case .FirstSingular:
                return "fuissem"
            case .SecondSingular:
                return "fuisses"
            case .ThirdSingular:
                return "fuisset"
            case .FirstPlural:
                return "fuissemus"
            case .SecondPlural:
                return "fuissetis"
            case .ThirdPlural:
                return "fuissent"

                
            }
        case "absum":
            switch personNum {
            case .FirstSingular:
                return "sbfuissem"
            case .SecondSingular:
                return "abfuisses"
            case .ThirdSingular:
                return "abuisset"
            case .FirstPlural:
                return "abfuissemus"
            case .SecondPlural:
                return "abfuissetis"
            case .ThirdPlural:
                return "abfuissent"
                
            }
        case "adsum":
            switch personNum {
            case .FirstSingular:
                return "adfuissem"
            case .SecondSingular:
                return "adfuisses"
            case .ThirdSingular:
                return "adfuisset"
            case .FirstPlural:
                return "adfuissemus"
            case .SecondPlural:
                return "adfuissetis"
            case .ThirdPlural:
                return "adfuissent"
                
            }
        case "possum":
            switch personNum {
            case .FirstSingular:
                return "potuissem"
            case .SecondSingular:
                return "potuisses"
            case .ThirdSingular:
                return "potuisset"
            case .FirstPlural:
                return "potuissemus"
            case .SecondPlural:
                return "potuissetis"
            case .ThirdPlural:
                return "potuissent"
                
            }
        case "aufero":
            switch personNum {
            case .FirstSingular:
                return "autbslissem"
            case .SecondSingular:
                return "autbslisses"
            case .ThirdSingular:
                return "autbslissemus"
            case .FirstPlural:
                return "autbslissetis"
            case .SecondPlural:
                return "autbslissetis"
            case .ThirdPlural:
                return "autbslissent"
                
            }
        case "copei":
            return "can not find"
        case "eo":
            switch personNum {
            case .FirstSingular:
                return "issem"
            case .SecondSingular:
                return "isses"
            case .ThirdSingular:
                return "isset"
            case .FirstPlural:
                return "issemus"
            case .SecondPlural:
                return "issetis"
            case .ThirdPlural:
                return "issent"
                
            }
        case "fero":
            switch personNum {
            case .FirstSingular:
                return "tulissem"
            case .SecondSingular:
                return "tulisses"
            case .ThirdSingular:
                return "tulisset"
            case .FirstPlural:
                return "tulissemus"
            case .SecondPlural:
                return "tulissetis"
            case .ThirdPlural:
                return "tulissent"
                
            }
        case "inquit":
            return "not needed"
        case "malo":
            switch personNum {
            case .FirstSingular:
                return "maluissem"
            case .SecondSingular:
                return "maluisses"
            case .ThirdSingular:
                return "maluisset"
            case .FirstPlural:
                return "maluissemus"
            case .SecondPlural:
                return "maluissetis"
            case .ThirdPlural:
                return "maluissent"
                
            }
        case "nolo":
            switch personNum {
            case .FirstSingular:
                return "noluissem"
            case .SecondSingular:
                return "noluisses"
            case .ThirdSingular:
                return "noluisset"
            case .FirstPlural:
                return "noluissemus"
            case .SecondPlural:
                return "noluissetis"
            case .ThirdPlural:
                return "noluissent"
                
            }
        case "offero":
            switch personNum {
            case .FirstSingular:
                return "obtulissem"
            case .SecondSingular:
                return "obtulisses"
            case .ThirdSingular:
                return "obtulisset"
            case .FirstPlural:
                return "obtulissemus"
            case .SecondPlural:
                return "obtulissetis"
            case .ThirdPlural:
                return "obtulissent"
                
            }
            
        case "pereo":
            switch personNum {
            case .FirstSingular:
                return "perissem"
            case .SecondSingular:
                return "perisses"
            case .ThirdSingular:
                return "perisset"
            case .FirstPlural:
                return "perissemus"
            case .SecondPlural:
                return "perissetis"
            case .ThirdPlural:
                return "perissent"
            }
        case "redeo":
            switch personNum {
            case .FirstSingular:
                return "redissem"
            case .SecondSingular:
                return "redisses"
            case .ThirdSingular:
                return "redisset"
            case .FirstPlural:
                return "redissemus"
            case .SecondPlural:
                return "redissetis"
            case .ThirdPlural:
                return "redissent"
                
            }
        case "volo":
            switch personNum {
            case .FirstSingular:
                return "voluissem"
            case .SecondSingular:
                return "voluisses"
            case .ThirdSingular:
                return "volisset"
            case .FirstPlural:
                return "voluissemus"
            case .SecondPlural:
                return "voluissetis"
            case .ThirdPlural:
                return "voluissent"
                
            }
            
        default:
            return "cant find verb"
        }
    }
    override func GetPassiveIndicitivePresent(personNum: PersonNum) -> String {
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
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return "auferor"
            case .ThirdSingular:
                return "auferis"
            case .FirstPlural:
                return "aufermur"
            case .SecondPlural:
                return "aufermini"
            case .ThirdPlural:
                return "auferuntur"
                
            }
        case "copei":
            return "none"
        case "eo":
            switch personNum {
            case .FirstSingular:
                return "eor"
            case .SecondSingular:
                return "iris"
            case .ThirdSingular:
                return "itur"
            case .FirstPlural:
                return "imur"
            case .SecondPlural:
                return "imini"
            case .ThirdPlural:
                return "euntur"
                
            }
        case "":
            switch personNum {
            case .FirstSingular:
                return "feror"
            case .SecondSingular:
                return "feris"
            case .ThirdSingular:
                return "fertur"
            case .FirstPlural:
                return "fermur"
            case .SecondPlural:
                return "fermini"
            case .ThirdPlural:
                return "feruntur"
                
            }
        case "inquit":
            return "none"
        case "malo":
            return"none"
        case "nolo":
            return "none"
        case "offero":
            switch personNum {
            case .FirstSingular:
                return "offeror"
            case .SecondSingular:
                return "offerris"
            case .ThirdSingular:
                return "offertur"
            case .FirstPlural:
                return "offermur"
            case .SecondPlural:
                return "offerimini"
            case .ThirdPlural:
                return "offeruntur"
            }
        case "pereo":
            switch personNum {
            case .FirstSingular:
                return "pereor"
            case .SecondSingular:
                return "periris"
            case .ThirdSingular:
                return "peritur"
            case .FirstPlural:
                return "perimur"
            case .SecondPlural:
                return "perimini"
            case .ThirdPlural:
                return "pereuntur"
                
            }
        case "redeo":
            switch personNum {
            case .FirstSingular:
                return "redeor"
            case .SecondSingular:
                return "rediris"
            case .ThirdSingular:
                return "reditur"
            case .FirstPlural:
                return "redimur"
            case .SecondPlural:
                return "redimini"
            case .ThirdPlural:
                return "redeuntur"
                
            }
        case "volo":
            switch personNum {
            case .FirstSingular:
                return "volor"
            case .SecondSingular:
                return "volaris"
            case .ThirdSingular:
                return "volatur"
            case .FirstPlural:
                return "volamur"
            case .SecondPlural:
                return "volamini"
            case .ThirdPlural:
                return "volamini"
                
            }
            
        default:
            return "cant find verb"
        }
    }
    override func GetPassiveIndicitiveImperfect(personNum: PersonNum) -> String {
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
            switch personNum {
            case .FirstSingular:
                return "auferebar"
            case .SecondSingular:
                return "auferebaris"
            case .ThirdSingular:
                return "auferebatur"
            case .FirstPlural:
                return "auferebamur"
            case .SecondPlural:
                return "auferebamini"
            case .ThirdPlural:
                return "auferuntur"
                
            }
        case "copei":
            return "none"
        case "eo":
            switch personNum {
            case .FirstSingular:
                return "ibar"
            case .SecondSingular:
                return "ibaris"
            case .ThirdSingular:
                return "ibatur"
            case .FirstPlural:
                return "ibamur"
            case .SecondPlural:
                return "ibamini"
            case .ThirdPlural:
                return "ibantur"
                
            }
        case "fero":
            switch personNum {
            case .FirstSingular:
                return "ferebar"
            case .SecondSingular:
                return "ferebaris"
            case .ThirdSingular:
                return "ferebatur"
            case .FirstPlural:
                return "ferebamur"
            case .SecondPlural:
                return "ferebamini"
            case .ThirdPlural:
                return "ferebantur"
                
            }
        case "inquit":
            return "none"
        case "malo":
            return"none"
        case "nolo":
            return "none"
        case "offero":
            switch personNum {
            case .FirstSingular:
                return "offerebar"
            case .SecondSingular:
                return "offerebaris"
            case .ThirdSingular:
                return "offerebatur"
            case .FirstPlural:
                return "offerebamur"
            case .SecondPlural:
                return "offerebamini"
            case .ThirdPlural:
                return "offerebantur"
                
            }
        case "pereo":
            switch personNum {
            case .FirstSingular:
                return "peribar"
            case .SecondSingular:
                return "peribaris"
            case .ThirdSingular:
                return "peribatur"
            case .FirstPlural:
                return "peribamur"
            case .SecondPlural:
                return "peribamini"
            case .ThirdPlural:
                return "peribantur"
                
            }
        case "redeo":
            switch personNum {
            case .FirstSingular:
                return "redibar"
            case .SecondSingular:
                return "redibaris"
            case .ThirdSingular:
                return "redibatur"
            case .FirstPlural:
                return "redibamur"
            case .SecondPlural:
                return "redibamini"
            case .ThirdPlural:
                return "redibantur"
                
            }
        case "volo":
            switch personNum {
            case .FirstSingular:
                return "volabar"
            case .SecondSingular:
                return "volaris"
            case .ThirdSingular:
                return "volabatur"
            case .FirstPlural:
                return "volabamur"
            case .SecondPlural:
                return "volabamini"
            case .ThirdPlural:
                return "volabantur"
            }
            
        default:
            return "cant find verb"
        }
    }
    // no need to as all of the verbs follow the pattern override func GetPassiveIndicitiveFuture(personNum: personNum)
    // same for passive indicitive pluperfect and passive subjective perfect and pluperfect
    override func GetPassiveSubjunctivePresent(personNum: PersonNum) -> String {
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
            switch personNum {
            case .FirstSingular:
                return "auferar"
            case .SecondSingular:
                return "auferaris"
            case .ThirdSingular:
                return "auferatur"
            case .FirstPlural:
                return "auferamur"
            case .SecondPlural:
                return "auferamini"
            case .ThirdPlural:
                return "auferantur"
                
            }
        case "copei":
            return "none"
        case "eo":
            switch personNum {
            case .FirstSingular:
                return "ear"
            case .SecondSingular:
                return "eares"
            case .ThirdSingular:
                return "eatur"
            case .FirstPlural:
                return "eamur"
            case .SecondPlural:
                return "eameni"
            case .ThirdPlural:
                return "eantur"
                
            }
        case "fero":
            switch personNum {
            case .FirstSingular:
                return "ferar"
            case .SecondSingular:
                return "feraris"
            case .ThirdSingular:
                return "feratur"
            case .FirstPlural:
                return "feramur"
            case .SecondPlural:
                return "feramini"
            case .ThirdPlural:
                return "ferantur"
                
            }
        case "inquit":
            return "none"
        case "malo":
            return"none"
        case "nolo":
            return "none"
        case "offero":
            switch personNum {
            case .FirstSingular:
                return "offerar"
            case .SecondSingular:
                return "offeraris"
            case .ThirdSingular:
                return "offeratur"
            case .FirstPlural:
                return "offeramur"
            case .SecondPlural:
                return "offeramini"
            case .ThirdPlural:
                return "offerantur"
                
            }
        case "pereo":
            switch personNum {
            case .FirstSingular:
                return "perear"
            case .SecondSingular:
                return "pereares"
            case .ThirdSingular:
                return "pereatur"
            case .FirstPlural:
                return "pereamur"
            case .SecondPlural:
                return "pereameni"
            case .ThirdPlural:
                return "pereantur"
                
            }
        case "redeo":
            switch personNum {
            case .FirstSingular:
                return "redear"
            case .SecondSingular:
                return "redeares"
            case .ThirdSingular:
                return "redeatur"
            case .FirstPlural:
                return "redeamur"
            case .SecondPlural:
                return "redeameni"
            case .ThirdPlural:
                return "redeantur"
                
            }
        case "volo":
            switch personNum {
            case .FirstSingular:
                return "voler"
            case .SecondSingular:
                return "voleris"
            case .ThirdSingular:
                return "voletur"
            case .FirstPlural:
                return "volemur"
            case .SecondPlural:
                return "volemini"
            case .ThirdPlural:
                return "volentur"
                
            }
            
        default:
            return "cant find verb"
        }
    }
    override func GetPassiveSubjunctiveImperfect(personNum: PersonNum) -> String {
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
            switch personNum {
            case .FirstSingular:
                return "aufererer"
            case .SecondSingular:
                return "auferereris"
            case .ThirdSingular:
                return "aufereretur"
            case .FirstPlural:
                return "aufereremur"
            case .SecondPlural:
                return "aufereremini"
            case .ThirdPlural:
                return "aufererentur"
                
            }
        case "copei":
            return "none"
        case "eo":
            switch personNum {
            case .FirstSingular:
                return "irer"
            case .SecondSingular:
                return "ireris"
            case .ThirdSingular:
                return "iretur"
            case .FirstPlural:
                return "iremur"
            case .SecondPlural:
                return "iremini"
            case .ThirdPlural:
                return "irentur"
                
            }
        case "fero":
            switch personNum {
            case .FirstSingular:
                return "fererer"
            case .SecondSingular:
                return "ferereris"
            case .ThirdSingular:
                return "fereretur"
            case .FirstPlural:
                return "fereremur"
            case .SecondPlural:
                return "fereremini"
            case .ThirdPlural:
                return "fererentur"
                
            }
        case "inquit":
            return "none"
        case "malo":
            return"none"
        case "nolo":
            return "none"
        case "offero":
            switch personNum {
            case .FirstSingular:
                return "offererer"
            case .SecondSingular:
                return "offerereris"
            case .ThirdSingular:
                return "offereretur"
            case .FirstPlural:
                return "offereremur"
            case .SecondPlural:
                return "offereremini"
            case .ThirdPlural:
                return "offererentur"
                
            }
        case "pereo":
            switch personNum {
            case .FirstSingular:
                return "perirer"
            case .SecondSingular:
                return "perireris"
            case .ThirdSingular:
                return "periretur"
            case .FirstPlural:
                return "periremur"
            case .SecondPlural:
                return "periremini"
            case .ThirdPlural:
                return "pereirentur"
                
            }
        case "redeo":
            switch personNum {
            case .FirstSingular:
                return "redirer"
            case .SecondSingular:
                return "redireris"
            case .ThirdSingular:
                return "rediretur"
            case .FirstPlural:
                return "rediremur"
            case .SecondPlural:
                return "rediremini"
            case .ThirdPlural:
                return "redeirentur"
                
            }
        case "volo":
            switch personNum {
            case .FirstSingular:
                return "volarer"
            case .SecondSingular:
                return "volareris"
            case .ThirdSingular:
                return "volaretur"
            case .FirstPlural:
                return "volaremur"
            case .SecondPlural:
                return "volaremini"
            case .ThirdPlural:
                return "volarentur"
                
            }
            
        default:
            return "cant find verb"
        }
        
    }
}
