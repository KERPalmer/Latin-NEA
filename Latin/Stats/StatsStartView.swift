//
//  StatsStartView.swift
//  Latin
//
//  Created by Kenan Palmer on 04/03/2021.
//

import SwiftUI

struct StatsStartView: View {
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                NavigationLink(destination: StatsWordView()){
                    VStack{
                        Text("Statistics")
                        Text("by word")
                    }
                }
                Spacer()
                NavigationLink(destination: StatsTypeView()){
                    VStack{
                        Text("Statistics")
                        Text("by word type")
                    }
                }
                Spacer()
            }
        }
    }
}
struct StatsWordView: View{
    var body: some View {
        List{
            NavigationLink(destination: VerbStatsWordView()){
                Text("Verbs")
                    .bold()
                    .font(.system(size: 20))
                
            }
            NavigationLink(destination: NounStatsWordView()){
                Text("Nouns")
                    .bold()
                    .font(.system(size: 20))
            }
            NavigationLink(destination: PrepositionStatsWordView()){
                Text("Prepostions")
                    .bold()
                    .font(.system(size: 20))
            }
            NavigationLink(destination: AdjectiveStatsWordView()){
                Text("Adjectives")
                    .bold()
                    .font(.system(size: 20))
            }
            NavigationLink(destination: AdverbStatsWordView()){
                Text("Adverbs")
                    .bold()
                    .font(.system(size: 20))
            }
            NavigationLink(destination: ConjunctionStatsWordView()){
                Text("Conjunctions")
                    .bold()
                    .font(.system(size: 20))
            }
        }.navigationTitle("by word")
    }
}
struct StatsTypeView: View{
    var body: some View {
        NavigationView{
            List{
                NavigationLink(destination: VerbStatsTypeView()){
                    Text("Verbs")
                        .bold()
                        .font(.system(size: 20))
                    
                }
                NavigationLink(destination: NounStatsTypeView()){
                    Text("Nouns")
                        .bold()
                        .font(.system(size: 20))
                }
                NavigationLink(destination: PrepositionStatsTypeView()){
                    Text("Prepostions")
                        .bold()
                        .font(.system(size: 20))
                }
                NavigationLink(destination: AdjectiveStatsTypeView()){
                    Text("Adjectives")
                        .bold()
                        .font(.system(size: 20))
                }
                NavigationLink(destination: AdverbStatsTypeView()){
                    Text("Adverbs")
                        .bold()
                        .font(.system(size: 20))
                }
                NavigationLink(destination: ConjunctionStatsTypeView()){
                    Text("Conjunctions")
                        .bold()
                        .font(.system(size: 20))
                }
            }.navigationTitle("by word types")
        }
    }
}
struct StatsDiagramView_Previews: PreviewProvider {
    static var previews: some View {
        StatsDiagramView(stats: StatsDiagram(correct: 5, total: 8, lastAttempts: [true, true, true, false, true,true,false,false]))
    }
}
struct StatsDiagramView: View{
    let stats: StatsDiagram
    var body: some View{
        VStack(){
            Text("\(stats.correctAnswers) / \(stats.totalAnswers)")
            /*List(stats.last10Attempts){ attempt in
                AnswerSquareView(answer: attempt)
            }*/
        }
    }
}
struct AnswerSquareView:View{
    let answer: Bool
    var body: some View{
        if answer{
            Rectangle().fill(Color.green)
        }
        else{
            Rectangle().fill(Color.red)
        }
    }
}

class StatsDiagram{
    public let correctAnswers:Int
    public let totalAnswers:Int
    public let last10Attempts:[Bool]
    init(correct:Int, total:Int, lastAttempts: [Bool]) {
        correctAnswers = correct
        totalAnswers = total
        last10Attempts=lastAttempts
    }
}
