//
//  word.swift
//  Latin
//
//  Created by Kenan Palmer on 09/10/2020.
//

import Foundation
class Word:Identifiable{
    public var id:Int
    public var translations:[String]=[]
    public let fileLine:String
    @Published private var translationIndex=0
    init(line:String,id_:Int){
        self.id=id_
        self.fileLine = line
        let trimmed:String=line.replacingOccurrences(of: "\r", with: "")
        //setting the translations
        if trimmed.hasSuffix("\""){
            //multiple translations
            let speechSplit = trimmed.split(separator: "\"",omittingEmptySubsequences: true)
            let size = speechSplit.count
            let translationSub=speechSplit[size-1].split(separator:",",omittingEmptySubsequences: true)
            for translation in translationSub{
                translations.append(format(str: String(translation)))
            }
        }
        else{
            // 1 translation
            let commaSplit = trimmed.split(separator: ",", omittingEmptySubsequences: true)
            let size = commaSplit.count
            let translation=commaSplit[size-1]
            translations.append(format(str: String(translation)))
        }
    }
    func get_translation() -> String{
        return translations[translationIndex]
    }
    func next_translation(){
        translationIndex+=1
        translationIndex %= translations.count
    }
    func get_all_translations()->String{
    var all = ""
        for translation in translations{
            all = all + "/ " + translation
        }
        return String(all.dropFirst(2))
    }
    
}
