//
//  VerbViews.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 27/07/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import SwiftUI
struct VerbInfoView: View {
    var verb:Verb
    @State var translationIndex:Int = 0
    var body: some View{
        VStack{
            // top main info- infinitive,conjugation,translation
            VStack{
                Text(verb.infinitive)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                Text(verb.conjugation)
                    .font(.headline)
                    .bold()
                    .multilineTextAlignment(.center)
                Text("to \(verb.GetTranslationIndex(index: translationIndex))")
            }
            
            VStack{
                List{
                    VStack{
                        HStack{
                            Spacer()
                            Text("ACTIVE INDICTIVE")
                                .font(.title)
                            Spacer()
                        }
                        //present active indicitive
                        HStack{
                            Spacer()
                            Text("Active indicitive present ")
                                .bold()
                            Spacer()
                        }
                        //imperfect active indicitive
                        List{
                            VerbRowView(word: verb.GetPresent(str: "1s"), translation: "ego  \(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPresent(str: "2s"), translation: "tu  \(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPresent(str: "3s"), translation: "is  \(verb.GetTranslationIndex(index: translationIndex))s")
                            VerbRowView(word: verb.GetPresent(str: "1p"), translation: "nos  \(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPresent(str: "2p"), translation: "vos  \(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPresent(str: "3p"), translation: "ii \(verb.GetTranslationIndex(index: translationIndex))")
                        }.frame(height: 270)
                        HStack{
                            Spacer()
                            Text("Active indicitive imperfect ")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetImperfect(str: "1s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetImperfect(str: "2s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetImperfect(str: "3s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetImperfect(str: "1p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetImperfect(str: "2p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetImperfect(str: "3p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                        }.frame(height: 270)
                        //future active indicitive
                        HStack{
                            Spacer()
                            Text("Active indicitive future ")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetFuture(str: "1s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetFuture(str: "2s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetFuture(str: "3s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetFuture(str: "1p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetFuture(str: "2p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetFuture(str: "3p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                        }.frame(height: 270)
                        //perfect active indicitive
                        HStack{
                            Spacer()
                            Text("Active indicitive perfect ")
                                .bold()
                            Spacer()
                        }
                    }
                    VStack{
                        List{
                            VerbRowView(word: verb.GetPerfect(str: "1s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPerfect(str: "2s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPerfect(str: "3s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPerfect(str: "1p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPerfect(str: "2p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPerfect(str: "3p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                        }.frame(height: 270)
                        // pluperfect active indicitive
                        HStack{
                            Spacer()
                            Text("Active indicitive pluperfect ")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetPluperfect(str: "1s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPluperfect(str: "2s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPluperfect(str: "3s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPluperfect(str: "1p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPluperfect(str: "2p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPluperfect(str: "3p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                        }.frame(height: 270)
                        HStack{
                            Spacer()
                            Text("ACTIVE SUBJUNCTIVE")
                                .font(.title)
                            Spacer()
                        }
                        // present active subjunctive
                        HStack{
                            Spacer()
                            Text("Active subjunctive present")
                                .bold()
                            Spacer()
                        }
                        // imperfect active subjunctive
                        List{
                            VerbRowView(word: verb.GetSubjunctivePresent(str: "1s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetSubjunctivePresent(str: "2s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetSubjunctivePresent(str: "3s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetSubjunctivePresent(str: "1p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetSubjunctivePresent(str: "2p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetSubjunctivePresent(str: "3p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                        }.frame(height: 270)
                        HStack{
                            Spacer()
                            Text("Active subjunctive Imperfect")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetSubjunctiveImperfect(str: "1s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetSubjunctiveImperfect(str: "2s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetSubjunctiveImperfect(str: "3s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetSubjunctiveImperfect(str: "1p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetSubjunctiveImperfect(str: "2p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetSubjunctiveImperfect(str: "3p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                        }.frame(height: 270)
                        // perfect active Subjunctive
                        HStack{
                            Spacer()
                            Text("Active subjunctive Perfect")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetSubjunctivePerfect(str: "1s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetSubjunctivePerfect(str: "2s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetSubjunctivePerfect(str: "3s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetSubjunctivePerfect(str: "1p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetSubjunctivePerfect(str: "2p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetSubjunctivePerfect(str: "3p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                        }.frame(height: 270)
                    }
                    VStack{
                        VStack{
                        // pluperfect active Subjunctive
                        HStack{
                            Spacer()
                            Text("Active subjunctive Pluperfect")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetSubjunctivePluperfect(str: "1s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetSubjunctivePluperfect(str: "2s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetSubjunctivePluperfect(str: "3s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetSubjunctivePluperfect(str: "1p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetSubjunctivePluperfect(str: "2p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetSubjunctivePluperfect(str: "3p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                        }.frame(height: 270)
                            // pluperfect active Subjunctive
                            HStack{
                                Spacer()
                                Text("PASSIVE INDICITIVE")
                                    .font(.title)
                                Spacer()
                            }
                            HStack{
                                Spacer()
                                Text("passive indicitive present")
                                    .bold()
                                Spacer()
                            }
                            List{
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(str: "1s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(str: "2s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(str: "3s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(str: "1p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(str: "2p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(str: "3p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            }.frame(height: 270)
                        }
                        HStack{
                            Spacer()
                            Text("passive indicitive imperfect")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(str: "1s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(str: "2s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(str: "3s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(str: "1p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(str: "2p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(str: "3p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                        }.frame(height: 270)
                        HStack{
                            Spacer()
                            Text("passive Indicitive future")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(str: "1s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(str: "2s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(str: "3s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(str: "1p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(str: "2p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(str: "3p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                        }.frame(height: 270)
                        HStack{
                            Spacer()
                            Text("passive Indicitive perfect")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(str: "1s",gender:"m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(str: "2s",gender:"m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(str: "3s",gender:"m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(str: "1p",gender:"m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(str: "2p",gender:"m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(str: "3p",gender:"m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                        }.frame(height: 270)
                        HStack{
                            Spacer()
                            Text("passive Indicitive pluperfect")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(str: "1s",gender:"m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(str: "2s",gender:"m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(str: "3s",gender:"m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(str: "1p",gender:"m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(str: "2p",gender:"m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(str: "3p",gender:"m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                        }.frame(height: 270)
                        
                    }
                    VStack{
                        VStack{
                            HStack{
                                Spacer()
                                Text("PASSIVE SUBJUNCTIVE")
                                    .font(.title)
                                Spacer()
                            }
                            HStack{
                                Spacer()
                                Text("passive Subjunctive present")
                                    .bold()
                                Spacer()
                            }
                            List{
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(str: "1s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(str: "2s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(str: "3s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(str: "1p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(str: "2p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(str: "3p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            }.frame(height: 270)
                            HStack{
                                Spacer()
                                Text("passive Subjunctive imperfect")
                                    .bold()
                                Spacer()
                            }
                            List{
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(str: "1s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(str: "2s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(str: "3s"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(str: "1p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(str: "2p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(str: "3p"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            }.frame(height: 270)
                            HStack{
                                Spacer()
                                Text("passive Subjunctive perfect")
                                    .bold()
                                Spacer()
                            }
                            List{
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(str: "1s", gender: "m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(str: "2s", gender: "m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(str: "3s", gender: "m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(str: "1p", gender: "m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(str: "2p", gender: "m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(str: "3p", gender: "m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            }.frame(height: 270)
                            HStack{
                                Spacer()
                                Text("passive Subjunctive pluperfect")
                                    .bold()
                                Spacer()
                            }
                            List{
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(str: "1s", gender: "m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(str: "2s", gender: "m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(str: "3s", gender: "m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(str: "1p", gender: "m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(str: "2p", gender: "m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(str: "3p", gender: "m"), translation: "\(verb.GetTranslationIndex(index: translationIndex))")
                            }.frame(height: 270)
                        }
                    }
                }.onAppear(){
                    UITableView.appearance().separatorStyle = .none
                }
                .onDisappear(){
                    UITableView.appearance().separatorStyle = .singleLine
                }
                //button to change the translation if there are multiple translations
                Button(action: {self.translationIndex=(self.translationIndex+1)%self.verb.translation.count}){
                    HStack{
                        Spacer()
                        Text("next translation")
                            .padding(10)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .opacity(0.8)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                }
                Spacer().frame( height: 10)
            }
        }
    }
}

