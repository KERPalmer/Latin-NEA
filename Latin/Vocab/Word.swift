//
//  word.swift
//  Latin
//
//  Created by Kenan Palmer on 09/10/2020.
//

import Foundation
//THE TOP OF THE WORD CLASS HEIRACHY ALL WORDTYPES STEM OF THIS
class Word:Identifiable{
    public var id:Int //unique identifier for each word
    public var translations:[String]=[]
    public let fileLine:String
    public let firstPrincipalPart: String //needed for storing in the table
    @Published public var inQuiz: Bool = true
    @Published private var translationIndex=0 //determins which translation is shown
    init(line:String,id_:Int){
        self.id=id_
        self.fileLine = line
        let trimmed:String=line.replacingOccurrences(of: "\r", with: "")
        //set first principal part
        let commaSplit = trimmed.split(separator: ",", omittingEmptySubsequences: true)
        firstPrincipalPart = format(str: String(commaSplit[0]))
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
            let size = commaSplit.count
            let translation=commaSplit[size-1]
            translations.append(format(str: String(translation)))
        }
    }
    func get_translation() -> String{
        return translations[translationIndex]
    }
    func next_translation(){ // changes the translationIndex so we get the next translation
        translationIndex+=1
        translationIndex %= translations.count
    }
    func get_all_translations()->String{// returns a string with all translations seperated with a slash
    var all = ""
        for translation in translations{
            all = all + "/ " + translation
        }
        return String(all.dropFirst(2))
    }
    func GetForm(formString:[String]) -> String{ //some word types only have one form. so well just return the frist principal part
            return firstPrincipalPart
    }
    func GetFeedback(formAnswer:String,incorrectForm:String)->[String]{
        preconditionFailure("This method must be overridden") 
    }
    
}
