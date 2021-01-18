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
                Text(verb.conjugation.rawValue)
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
                            VerbRowView(word: verb.GetPresent(personNum: PersonNum.FirstSingular), grammar: "i am")
                            VerbRowView(word: verb.GetPresent(personNum: PersonNum.SecondSingular), grammar: "you (singualr) are")
                            VerbRowView(word: verb.GetPresent(personNum: PersonNum.ThirdSingular), grammar: "he/she/it is")
                            VerbRowView(word: verb.GetPresent(personNum: PersonNum.FirstSingular), grammar: "we are")
                            VerbRowView(word: verb.GetPresent(personNum: PersonNum.SecondSingular), grammar: "you (plural) are")
                            VerbRowView(word: verb.GetPresent(personNum: PersonNum.ThirdSingular), grammar:"they are")
                        }.frame(height: 270)
                        HStack{
                            Spacer()
                            Text("Active indicitive imperfect ")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetImperfect(personNum: PersonNum.FirstSingular), grammar:"i was")
                            VerbRowView(word: verb.GetImperfect(personNum: PersonNum.SecondSingular), grammar:"you (singular) were")
                            VerbRowView(word: verb.GetImperfect(personNum: PersonNum.ThirdSingular), grammar:"he/she/it was")
                            VerbRowView(word: verb.GetImperfect(personNum: PersonNum.FirstSingular), grammar:"we were")
                            VerbRowView(word: verb.GetImperfect(personNum: PersonNum.SecondSingular), grammar:"you (plural) are")
                            VerbRowView(word: verb.GetImperfect(personNum: PersonNum.ThirdSingular), grammar: "they are")
                        }.frame(height: 270)
                        //future active indicitive
                        HStack{
                            Spacer()
                            Text("Active indicitive future ")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetFuture(personNum: PersonNum.FirstSingular), grammar:"i will ")
                            VerbRowView(word: verb.GetFuture(personNum: PersonNum.SecondSingular), grammar:"you (singular) will")
                            VerbRowView(word: verb.GetFuture(personNum: PersonNum.ThirdSingular), grammar:"he/she/it will")
                            VerbRowView(word: verb.GetFuture(personNum: PersonNum.FirstSingular), grammar:"we will")
                            VerbRowView(word: verb.GetFuture(personNum: PersonNum.SecondSingular), grammar:"you (plural) will")
                            VerbRowView(word: verb.GetFuture(personNum: PersonNum.ThirdSingular), grammar:"they will")
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
                            VerbRowView(word: verb.GetPerfect(personNum: PersonNum.FirstSingular), grammar:"I have/ used to")
                            VerbRowView(word: verb.GetPerfect(personNum: PersonNum.SecondSingular), grammar:"you (singular) had/ used to")
                            VerbRowView(word: verb.GetPerfect(personNum: PersonNum.ThirdSingular), grammar:"he/she/it had/ used to")
                            VerbRowView(word: verb.GetPerfect(personNum: PersonNum.FirstSingular), grammar:"we had/ used to")
                            VerbRowView(word: verb.GetPerfect(personNum: PersonNum.SecondSingular), grammar:"you (plural) had/ used to")
                            VerbRowView(word: verb.GetPerfect(personNum: PersonNum.ThirdSingular), grammar:"they had/ used to")
                        }.frame(height: 270)
                        // pluperfect active indicitive
                        HStack{
                            Spacer()
                            Text("Active indicitive pluperfect ")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetPluperfect(personNum: PersonNum.FirstSingular), grammar:"i had")
                            VerbRowView(word: verb.GetPluperfect(personNum: PersonNum.SecondSingular), grammar:"you (singular) had")
                            VerbRowView(word: verb.GetPluperfect(personNum: PersonNum.ThirdSingular), grammar:"he/she/it had")
                            VerbRowView(word: verb.GetPluperfect(personNum: PersonNum.FirstSingular), grammar:"we had")
                            VerbRowView(word: verb.GetPluperfect(personNum: PersonNum.SecondSingular), grammar: "you (plural) had")
                            VerbRowView(word: verb.GetPluperfect(personNum: PersonNum.ThirdSingular), grammar: "they had")
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
                            VerbRowView(word: verb.GetSubjunctivePresent(personNum: PersonNum.FirstSingular), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctivePresent(personNum: PersonNum.SecondSingular), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctivePresent(personNum: PersonNum.ThirdSingular), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctivePresent(personNum: PersonNum.FirstSingular), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctivePresent(personNum: PersonNum.SecondSingular), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctivePresent(personNum: PersonNum.ThirdSingular), grammar: "\(verb.get_translation())")
                        }.frame(height: 270)
                        HStack{
                            Spacer()
                            Text("Active subjunctive Imperfect")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetSubjunctiveImperfect(personNum: PersonNum.FirstSingular), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctiveImperfect(personNum: PersonNum.SecondSingular), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctiveImperfect(personNum: PersonNum.ThirdSingular), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctiveImperfect(personNum: PersonNum.FirstSingular), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctiveImperfect(personNum: PersonNum.SecondSingular), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctiveImperfect(personNum: PersonNum.ThirdSingular), grammar: "\(verb.get_translation())")
                        }.frame(height: 270)
                        // perfect active Subjunctive
                        HStack{
                            Spacer()
                            Text("Active subjunctive Perfect")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetSubjunctivePerfect(personNum: PersonNum.FirstSingular), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctivePerfect(personNum: PersonNum.SecondSingular), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctivePerfect(personNum: PersonNum.ThirdSingular), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctivePerfect(personNum: PersonNum.FirstSingular), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctivePerfect(personNum: PersonNum.SecondSingular), grammar: "\(verb.get_translation())")
                            VerbRowView(word: verb.GetSubjunctivePerfect(personNum: PersonNum.ThirdSingular), grammar: "\(verb.get_translation())")
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
                                VerbRowView(word: verb.GetSubjunctivePluperfect(personNum: PersonNum.FirstSingular), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetSubjunctivePluperfect(personNum: PersonNum.SecondSingular), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetSubjunctivePluperfect(personNum: PersonNum.ThirdSingular), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetSubjunctivePluperfect(personNum: PersonNum.FirstSingular), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetSubjunctivePluperfect(personNum: PersonNum.SecondSingular), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetSubjunctivePluperfect(personNum: PersonNum.ThirdSingular), grammar: "\(verb.get_translation())")
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
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(personNum: PersonNum.FirstSingular), grammar: "i am being")
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(personNum: PersonNum.SecondSingular), grammar: "you (singular) are being")
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(personNum: PersonNum.ThirdSingular), grammar: "he/she/it is being")
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(personNum: PersonNum.FirstSingular), grammar: "we are being")
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(personNum: PersonNum.SecondSingular), grammar: "you (pural) are being")
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(personNum: PersonNum.ThirdSingular), grammar: "they are being")
                            }.frame(height: 270)
                        }
                        HStack{
                            Spacer()
                            Text("passive indicitive imperfect")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(personNum: PersonNum.FirstSingular), grammar: "i was being")
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(personNum: PersonNum.SecondSingular), grammar: "you (plural) were being")
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(personNum: PersonNum.ThirdSingular), grammar: "he/she/it was being")
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(personNum: PersonNum.FirstSingular), grammar: "we were being")
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(personNum: PersonNum.SecondSingular), grammar: "you (plural) were being")
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(personNum: PersonNum.ThirdSingular), grammar: "they were being")
                        }.frame(height: 270)
                        HStack{
                            Spacer()
                            Text("passive Indicitive future")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(personNum: PersonNum.FirstSingular), grammar: "i will be")
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(personNum: PersonNum.SecondSingular), grammar: "you (singualr) will be")
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(personNum: PersonNum.ThirdSingular), grammar: "he/she/it will be")
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(personNum: PersonNum.FirstSingular), grammar: "we will be)")
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(personNum: PersonNum.SecondSingular), grammar: "you (plural) will be")
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(personNum: PersonNum.ThirdSingular), grammar: "they will be")
                        }.frame(height: 270)
                        HStack{
                            Spacer()
                            Text("passive Indicitive perfect")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(personNum: PersonNum.FirstSingular,gender:"m"), grammar: "i have been")
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(personNum: PersonNum.SecondSingular,gender:"m"), grammar: "you (singular) have been")
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(personNum: PersonNum.ThirdSingular,gender:"m"), grammar: "he/she/it has been")
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(personNum: PersonNum.FirstSingular,gender:"m"), grammar: "we have been)")
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(personNum: PersonNum.SecondSingular,gender:"m"), grammar: "you (plural) have been")
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(personNum: PersonNum.ThirdSingular,gender:"m"), grammar: "they have been")
                        }.frame(height: 270)
                        HStack{
                            Spacer()
                            Text("passive Indicitive pluperfect")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(personNum: PersonNum.FirstSingular,gender:"m"), grammar: "i had been")
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(personNum: PersonNum.SecondSingular,gender:"m"), grammar: "you (singular) had been")
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(personNum: PersonNum.ThirdSingular,gender:"m"), grammar: "he/she/it had been")
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(personNum: PersonNum.FirstSingular,gender:"m"), grammar: "we had been")
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(personNum: PersonNum.SecondSingular,gender:"m"), grammar: "you (plural) had been")
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(personNum: PersonNum.ThirdSingular,gender:"m"), grammar: "they had been")
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
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(personNum: PersonNum.FirstSingular), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(personNum: PersonNum.SecondSingular), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(personNum: PersonNum.ThirdSingular), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(personNum: PersonNum.FirstSingular), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(personNum: PersonNum.SecondSingular), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(personNum: PersonNum.ThirdSingular), grammar: "\(verb.get_translation())")
                            }.frame(height: 270)
                            HStack{
                                Spacer()
                                Text("passive Subjunctive imperfect")
                                    .bold()
                                Spacer()
                            }
                            List{
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(personNum: PersonNum.FirstSingular), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(personNum: PersonNum.SecondSingular), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(personNum: PersonNum.ThirdSingular), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(personNum: PersonNum.FirstSingular), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(personNum: PersonNum.SecondSingular), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(personNum: PersonNum.ThirdSingular), grammar: "\(verb.get_translation())")
                            }.frame(height: 270)
                            HStack{
                                Spacer()
                                Text("passive Subjunctive perfect")
                                    .bold()
                                Spacer()
                            }
                            List{
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(personNum: PersonNum.FirstSingular, gender: "m"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(personNum: PersonNum.SecondSingular, gender: "m"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(personNum: PersonNum.ThirdSingular, gender: "m"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(personNum: PersonNum.FirstSingular, gender: "m"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(personNum: PersonNum.SecondSingular, gender: "m"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(personNum: PersonNum.ThirdSingular, gender: "m"), grammar: "\(verb.get_translation())")
                            }.frame(height: 270)
                            HStack{
                                Spacer()
                                Text("passive Subjunctive pluperfect")
                                    .bold()
                                Spacer()
                            }
                            List{
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(personNum: PersonNum.FirstSingular, gender: "m"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(personNum: PersonNum.SecondSingular, gender: "m"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(personNum: PersonNum.ThirdSingular, gender: "m"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(personNum: PersonNum.FirstSingular, gender: "m"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(personNum: PersonNum.SecondSingular, gender: "m"), grammar: "\(verb.get_translation())")
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(personNum: PersonNum.ThirdSingular, gender: "m"), grammar: "\(verb.get_translation())")
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
struct VerbInfoView_Previews: PreviewProvider {
    static var previews: some View {
        VerbInfoView(verb: Verb(line: "amo ,\"amare, amavi, amatus\",verb 1,\"love, like\"" , id_: -1))
    }
}
