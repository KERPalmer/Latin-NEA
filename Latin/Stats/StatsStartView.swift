//
//  StatsStartView.swift
//  Latin
//
//  Created by Kenan Palmer on 04/03/2021.
//

import SwiftUI

struct StatsWordView: View{
    var body: some View {
            List{
                NavigationLink(destination: VerbWordSelectionView()){
                Text("Verbs")
                    .bold()
                    .font(.system(size: 20))
                
            }
            NavigationLink(destination: NounWordSelectionView()){
                Text("Nouns")
                    .bold()
                    .font(.system(size: 20))
            }
            NavigationLink(destination: PrepWordSelectionView()){
                Text("Prepostions")
                    .bold()
                    .font(.system(size: 20))
            }
            NavigationLink(destination: AdjectiveWordSelectionView()){
                Text("Adjectives")
                    .bold()
                    .font(.system(size: 20))
            }
            NavigationLink(destination: AdverbWordSelectionView()){
                Text("Adverbs")
                    .bold()
                    .font(.system(size: 20))
            }
            NavigationLink(destination: ConjunctionWordSelectionView()){
                Text("Conjunctions")
                    .bold()
                    .font(.system(size: 20))
            }
        }.navigationTitle("by word")
        }
    }

struct StatsDiagramView: View{
    let stats: [StatsDiagram]
    var body: some View{
        ZStack{
            if (stats.count == 0){
                Text("no results")
            }
            else{
                List(stats){stat in
                    VStack{
                Text("\(stat.correctAnswers) / \(stat.totalAnswers)")
                        Text(stat.latin)
                        Text(stat.form)
                    HStack{
                        ForEach(stat.last10Attempts, id: \.self){ attempt in
                            AnswerSquareView(answer: attempt)
                        }
                    }
                    }
                }
            }
        }
    }
}
struct AnswerSquareView:View{
    let answer: Int
    var body: some View{
        if answer == 1{
            Rectangle().fill(Color.green)
        }
        else if answer == 0{
            Rectangle().fill(Color.red)
        }
        else{
            Rectangle().fill(Color.gray)
        }
    }
}

struct StatsWordDisplayView: View{
    let statsDiagrams: [StatsDiagram]
    var body: some View{
        Text("Hello")
    }
}


class StatsDiagram:Codable, Identifiable{
    public let correctAnswers:Int
    public let totalAnswers:Int
    public var last10Attempts:[Int]
    public var latin: String
    public var form:String
    init(correct: Int32, Total: Int32, last10: [Int32], latin:String, form:String) {
        correctAnswers = Int(correct)
        totalAnswers = Int(Total)
        last10Attempts = []
        self.latin = latin
        self.form = form
        
        for answer in last10{
            last10Attempts.append(Int(answer))
        }
    }
}
