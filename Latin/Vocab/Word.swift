//
//  word.swift
//  Latin
//
//  Created by Kenan Palmer on 09/10/2020.
//

import Foundation
class Word:Codable,Identifiable{
    

    public var id:Int
    public var translations:[String]=[]
    public let fileLine:String
    private var translationIndex=0
    init(line:String,id_:Int){
        self.id=0
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
            let translationSub=commaSplit[size-1]
            for translation in translationSub{
                translations.append(format(str: String(translation)))
            }
        }
    }
    func get_translation() -> String{
        return translations[translationIndex]
    }
    func next_translation(){
        translationIndex+=1
        translationIndex %= translations.count
    }
}
