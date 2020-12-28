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
                Text("to \(verb.get_all_translations())")
                    .font(.subheadline)
                    .bold()
                    .multilineTextAlignment(.center)
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
                            VerbRowView(word: verb.GetPresent(str: "1s"), grammar: "i am")
                            VerbRowView(word: verb.GetPresent(str: "2s"), grammar: "you (singualr) are")
                            VerbRowView(word: verb.GetPresent(str: "3s"), grammar: "he/she/it is")
                            VerbRowView(word: verb.GetPresent(str: "1p"), grammar: "we are")
                            VerbRowView(word: verb.GetPresent(str: "2p"), grammar: "you (plural) are")
                            VerbRowView(word: verb.GetPresent(str: "3p"), grammar:"they are")
                        }.frame(height: 270)
                        HStack{
                            Spacer()
                            Text("Active indicitive imperfect ")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetImperfect(str: "1s"), grammar:"i was")
                            VerbRowView(word: verb.GetImperfect(str: "2s"), grammar:"you (singular) were")
                            VerbRowView(word: verb.GetImperfect(str: "3s"), grammar:"he/she/it was")
                            VerbRowView(word: verb.GetImperfect(str: "1p"), grammar:"we were")
                            VerbRowView(word: verb.GetImperfect(str: "2p"), grammar:"you (plural) are")
                            VerbRowView(word: verb.GetImperfect(str: "3p"), grammar: "\(verb.get_translation())")
                        }.frame(height: 270)
                        //future active indicitive
                        HStack{
                            Spacer()
                            Text("Active indicitive future ")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetFuture(str: "1s"), grammar:"i will ")
                            VerbRowView(word: verb.GetFuture(str: "2s"), grammar:"you (singular) will")
                            VerbRowView(word: verb.GetFuture(str: "3s"), grammar:"he/she/it will")
                            VerbRowView(word: verb.GetFuture(str: "1p"), grammar:"we will")
                            VerbRowView(word: verb.GetFuture(str: "2p"), grammar:"you (plural) will")
                            VerbRowView(word: verb.GetFuture(str: "3p"), grammar:"they will")
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
                            VerbRowView(word: verb.GetPerfect(str: "1s"), grammar:"I have/ used to")
                            VerbRowView(word: verb.GetPerfect(str: "2s"), grammar:"you (singular) had/ used to")
                            VerbRowView(word: verb.GetPerfect(str: "3s"), grammar:"he/she/it had/ used to")
                            VerbRowView(word: verb.GetPerfect(str: "1p"), grammar:"we had/ used to")
                            VerbRowView(word: verb.GetPerfect(str: "2p"), grammar:"you (plural) had/ used to")
                            VerbRowView(word: verb.GetPerfect(str: "3p"), grammar:"they had/ used to")
                        }.frame(height: 270)
                        // pluperfect active indicitive
                        HStack{
                            Spacer()
                            Text("Active indicitive pluperfect ")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetPluperfect(str: "1s"), grammar:"i had")
                            VerbRowView(word: verb.GetPluperfect(str: "2s"), grammar:"you (singular) had")
                            VerbRowView(word: verb.GetPluperfect(str: "3s"), grammar:"he/she/it had")
                            VerbRowView(word: verb.GetPluperfect(str: "1p"), grammar:"we had")
                            VerbRowView(word: verb.GetPluperfect(str: "2p"), grammar: "you (plural) had")
                            VerbRowView(word: verb.GetPluperfect(str: "3p"), grammar: "they had")
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
                            VerbRowView(word: verb.GetSubjunctivePresent(str: "1s"), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctivePresent(str: "2s"), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctivePresent(str: "3s"), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctivePresent(str: "1p"), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctivePresent(str: "2p"), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctivePresent(str: "3p"), grammar: "\(verb.get_translation())")
                        }.frame(height: 270)
                        HStack{
                            Spacer()
                            Text("Active subjunctive Imperfect")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetSubjunctiveImperfect(str: "1s"), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctiveImperfect(str: "2s"), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctiveImperfect(str: "3s"), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctiveImperfect(str: "1p"), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctiveImperfect(str: "2p"), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctiveImperfect(str: "3p"), grammar: "\(verb.get_translation())")
                        }.frame(height: 270)
                        // perfect active Subjunctive
                        HStack{
                            Spacer()
                            Text("Active subjunctive Perfect")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetSubjunctivePerfect(str: "1s"), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctivePerfect(str: "2s"), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctivePerfect(str: "3s"), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctivePerfect(str: "1p"), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctivePerfect(str: "2p"), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctivePerfect(str: "3p"), grammar: "\(verb.get_translation())")
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
                                VerbRowView(word: verb.GetSubjunctivePluperfect(str: "1s"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetSubjunctivePluperfect(str: "2s"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetSubjunctivePluperfect(str: "3s"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetSubjunctivePluperfect(str: "1p"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetSubjunctivePluperfect(str: "2p"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetSubjunctivePluperfect(str: "3p"), grammar: "\(verb.get_translation())")
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
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(str: "1s"), grammar: "i am being")
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(str: "2s"), grammar: "you (singular) are being")
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(str: "3s"), grammar: "he/she/it is being")
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(str: "1p"), grammar: "we are being")
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(str: "2p"), grammar: "you (pural) are being")
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(str: "3p"), grammar: "they are being")
                            }.frame(height: 270)
                        }
                        HStack{
                            Spacer()
                            Text("passive indicitive imperfect")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(str: "1s"), grammar: "i was being")
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(str: "2s"), grammar: "you (plural) were being")
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(str: "3s"), grammar: "he/she/it was being")
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(str: "1p"), grammar: "we were being")
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(str: "2p"), grammar: "you (plural) were being")
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(str: "3p"), grammar: "they were being")
                        }.frame(height: 270)
                        HStack{
                            Spacer()
                            Text("passive Indicitive future")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(str: "1s"), grammar: "i will be")
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(str: "2s"), grammar: "you (singualr) will be")
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(str: "3s"), grammar: "he/she/it will be")
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(str: "1p"), grammar: "we will be)")
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(str: "2p"), grammar: "you (plural) will be")
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(str: "3p"), grammar: "they will be")
                        }.frame(height: 270)
                        HStack{
                            Spacer()
                            Text("passive Indicitive perfect")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(str: "1s",gender:"m"), grammar: "i have been")
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(str: "2s",gender:"m"), grammar: "you (singular) have been")
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(str: "3s",gender:"m"), grammar: "he/she/it has been")
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(str: "1p",gender:"m"), grammar: "we have been)")
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(str: "2p",gender:"m"), grammar: "you (plural) have been")
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(str: "3p",gender:"m"), grammar: "they have been")
                        }.frame(height: 270)
                        HStack{
                            Spacer()
                            Text("passive Indicitive pluperfect")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(str: "1s",gender:"m"), grammar: "i had been")
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(str: "2s",gender:"m"), grammar: "you (singular) had been")
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(str: "3s",gender:"m"), grammar: "he/she/it had been")
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(str: "1p",gender:"m"), grammar: "we had been")
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(str: "2p",gender:"m"), grammar: "you (plural) had been")
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(str: "3p",gender:"m"), grammar: "they had been")
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
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(str: "1s"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(str: "2s"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(str: "3s"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(str: "1p"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(str: "2p"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(str: "3p"), grammar: "\(verb.get_translation())")
                            }.frame(height: 270)
                            HStack{
                                Spacer()
                                Text("passive Subjunctive imperfect")
                                    .bold()
                                Spacer()
                            }
                            List{
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(str: "1s"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(str: "2s"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(str: "3s"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(str: "1p"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(str: "2p"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(str: "3p"), grammar: "\(verb.get_translation())")
                            }.frame(height: 270)
                            HStack{
                                Spacer()
                                Text("passive Subjunctive perfect")
                                    .bold()
                                Spacer()
                            }
                            List{
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(str: "1s", gender: "m"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(str: "2s", gender: "m"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(str: "3s", gender: "m"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(str: "1p", gender: "m"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(str: "2p", gender: "m"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(str: "3p", gender: "m"), grammar: "\(verb.get_translation())")
                            }.frame(height: 270)
                            HStack{
                                Spacer()
                                Text("passive Subjunctive pluperfect")
                                    .bold()
                                Spacer()
                            }
                            List{
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(str: "1s", gender: "m"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(str: "2s", gender: "m"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(str: "3s", gender: "m"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(str: "1p", gender: "m"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(str: "2p", gender: "m"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(str: "3p", gender: "m"), grammar: "\(verb.get_translation())")
                            }.frame(height: 270)
                        }
                    }
                }.onAppear(){
                    UITableView.appearance().separatorStyle = .none
                }
                .onDisappear(){
                    UITableView.appearance().separatorStyle = .singleLine
                }
                Spacer().frame( height: 10)
            }
        }
    }
}

