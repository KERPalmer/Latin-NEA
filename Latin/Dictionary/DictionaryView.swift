//
//  Dictionary.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 04/10/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import SwiftUI

struct DictionaryView: View {
    var body: some View{
        NavigationView{
                List{
                    NavigationLink(destination: VerbDictionaryView()){
                        Text("Verbs")
                            .bold()
                            .font(.system(size: 20))
                        
                    }
                    NavigationLink(destination: NounDictionaryView()){
                        Text("Nouns")
                            .bold()
                            .font(.system(size: 20))
                    }
                    NavigationLink(destination: PrepositionDictionaryView()){
                        Text("Prepostions")
                            .bold()
                            .font(.system(size: 20))
                    }
                    NavigationLink(destination: AdjectiveDictionaryView()){
                        Text("Adjectives")
                            .bold()
                            .font(.system(size: 20))
                    }
                    NavigationLink(destination: Text("Adverbs")){
                        Text("Adverbs")
                            .bold()
                            .font(.system(size: 20))
                    }
                    NavigationLink(destination: ConjunctionDictionaryView()){
                        Text("Conjunctions")
                            .bold()
                            .font(.system(size: 20))
                    }
                    NavigationLink(destination: Text("All")){
                        Text("All")
                            .bold()
                            .font(.system(size: 20))
                }
                }.navigationTitle("word types:")
        }
    }
}

struct Dictionary_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryView()
    }
}
