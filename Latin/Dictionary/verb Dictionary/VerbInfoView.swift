//
//  VerbViews.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 27/07/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import SwiftUI
//THIS VIEW EXPANDS THE VERB AND DISPLAYS THEM IN THEIR DIFFERENT FORMS SO ... THERE ARE A LOT OF THEM 
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
                        //present active indicitive
                        List{
                            VerbRowView(word: verb.GetPresent(personNum: PersonNum.FirstSingular),formList: [Mood.indicative.rawValue,Voice.active.rawValue,Tense.Present.rawValue,PersonNum.FirstSingular.rawValue,""], grammar: "i am")
                            VerbRowView(word: verb.GetPresent(personNum: PersonNum.SecondSingular),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.Present.rawValue,PersonNum.SecondSingular.rawValue,""], grammar: "you (singualr) are")
                            VerbRowView(word: verb.GetPresent(personNum: PersonNum.ThirdSingular),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.Present.rawValue,PersonNum.ThirdSingular.rawValue,""], grammar: "he/she/it is")
                            VerbRowView(word: verb.GetPresent(personNum: PersonNum.FirstPlural),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.Present.rawValue,PersonNum.FirstPlural.rawValue,""], grammar: "we are")
                            VerbRowView(word: verb.GetPresent(personNum: PersonNum.SecondPlural),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.Present.rawValue,PersonNum.SecondPlural.rawValue,""], grammar: "you (Plural) are")
                            VerbRowView(word: verb.GetPresent(personNum: PersonNum.ThirdPlural),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.Present.rawValue,PersonNum.ThirdPlural.rawValue,""], grammar:"they are")
                        }.frame(height: 270)
                        HStack{
                            Spacer()
                            Text("Active indicitive imperfect ")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetImperfect(personNum: PersonNum.FirstSingular),formList: [Mood.indicative.rawValue,Voice.active.rawValue,Tense.imperfect.rawValue,PersonNum.FirstSingular.rawValue,""], grammar: "i am")
                            VerbRowView(word: verb.GetPresent(personNum: PersonNum.SecondSingular),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.imperfect.rawValue,PersonNum.SecondSingular.rawValue,""], grammar: "you (singualr) are")
                            VerbRowView(word: verb.GetImperfect(personNum: PersonNum.ThirdSingular),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.imperfect.rawValue,PersonNum.ThirdSingular.rawValue,""], grammar: "he/she/it is")
                            VerbRowView(word: verb.GetImperfect(personNum: PersonNum.FirstPlural),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.imperfect.rawValue,PersonNum.FirstPlural.rawValue,""], grammar: "we are")
                            VerbRowView(word: verb.GetImperfect(personNum: PersonNum.SecondPlural),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.imperfect.rawValue,PersonNum.SecondPlural.rawValue,""], grammar: "you (Plural) are")
                            VerbRowView(word: verb.GetImperfect(personNum: PersonNum.ThirdPlural),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.imperfect.rawValue,PersonNum.ThirdPlural.rawValue,""], grammar:"they are")
                        }.frame(height: 270)
                        //future active indicitive
                        HStack{
                            Spacer()
                            Text("Active indicitive future ")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetFuture(personNum: PersonNum.FirstSingular),formList: [Mood.indicative.rawValue,Voice.active.rawValue,Tense.future.rawValue,PersonNum.FirstSingular.rawValue,""], grammar: "i am")
                            VerbRowView(word: verb.GetFuture(personNum: PersonNum.SecondSingular),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.future.rawValue,PersonNum.SecondSingular.rawValue,""], grammar: "you (singualr) are")
                            VerbRowView(word: verb.GetFuture(personNum: PersonNum.ThirdSingular),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.future.rawValue,PersonNum.ThirdSingular.rawValue,""], grammar: "he/she/it is")
                            VerbRowView(word: verb.GetFuture(personNum: PersonNum.FirstPlural),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.future.rawValue,PersonNum.FirstPlural.rawValue,""], grammar: "we are")
                            VerbRowView(word: verb.GetFuture(personNum: PersonNum.SecondPlural),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.future.rawValue,PersonNum.SecondPlural.rawValue,""], grammar: "you (Plural) are")
                            VerbRowView(word: verb.GetFuture(personNum: PersonNum.ThirdPlural),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.future.rawValue,PersonNum.ThirdPlural.rawValue,""], grammar:"they are")
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
                            VerbRowView(word: verb.GetPerfect(personNum: PersonNum.FirstSingular),formList: [Mood.indicative.rawValue,Voice.active.rawValue,Tense.perfect.rawValue,PersonNum.FirstSingular.rawValue,""], grammar: "i am")
                            VerbRowView(word: verb.GetPerfect(personNum: PersonNum.SecondSingular),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.perfect.rawValue,PersonNum.SecondSingular.rawValue,""], grammar: "you (singualr) are")
                            VerbRowView(word: verb.GetPerfect(personNum: PersonNum.ThirdSingular),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.perfect.rawValue,PersonNum.ThirdSingular.rawValue,""], grammar: "he/she/it is")
                            VerbRowView(word: verb.GetPerfect(personNum: PersonNum.FirstPlural),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.perfect.rawValue,PersonNum.FirstPlural.rawValue,""], grammar: "we are")
                            VerbRowView(word: verb.GetPerfect(personNum: PersonNum.SecondPlural),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.perfect.rawValue,PersonNum.SecondPlural.rawValue,""], grammar: "you (Plural) are")
                            VerbRowView(word: verb.GetPerfect(personNum: PersonNum.ThirdPlural),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.perfect.rawValue,PersonNum.ThirdPlural.rawValue,""], grammar:"they are")
                        }.frame(height: 270)
                        // pluperfect active indicitive
                        HStack{
                            Spacer()
                            Text("Active indicitive pluperfect ")
                                .bold()
                            Spacer()
                        }
                        List{
                            List{
                                VerbRowView(word: verb.GetPluperfect(personNum: PersonNum.FirstSingular),formList: [Mood.indicative.rawValue,Voice.active.rawValue,Tense.pluperfect.rawValue,PersonNum.FirstSingular.rawValue,""], grammar: "i am")
                                VerbRowView(word: verb.GetPluperfect(personNum: PersonNum.SecondSingular),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.pluperfect.rawValue,PersonNum.SecondSingular.rawValue,""], grammar: "you (singualr) are")
                                VerbRowView(word: verb.GetPluperfect(personNum: PersonNum.ThirdSingular),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.pluperfect.rawValue,PersonNum.ThirdSingular.rawValue,""], grammar: "he/she/it is")
                                VerbRowView(word: verb.GetPluperfect(personNum: PersonNum.FirstPlural),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.pluperfect.rawValue,PersonNum.FirstPlural.rawValue,""], grammar: "we are")
                                VerbRowView(word: verb.GetPluperfect(personNum: PersonNum.SecondPlural),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.pluperfect.rawValue,PersonNum.SecondPlural.rawValue,""], grammar: "you (Plural) are")
                                VerbRowView(word: verb.GetPluperfect(personNum: PersonNum.ThirdPlural),formList:[Mood.indicative.rawValue,Voice.active.rawValue,Tense.pluperfect.rawValue,PersonNum.ThirdPlural.rawValue,""], grammar:"they are")
                            }.frame(height: 270)
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
                            VerbRowView(word: verb.GetSubjunctivePresent(personNum: PersonNum.FirstSingular),formList: [Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.Present.rawValue,PersonNum.FirstSingular.rawValue,""], grammar: "i am")
                            VerbRowView(word: verb.GetPluperfect(personNum: PersonNum.SecondSingular),formList:[Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.Present.rawValue,PersonNum.SecondSingular.rawValue,""], grammar: "you (singualr) are")
                            VerbRowView(word: verb.GetSubjunctivePresent(personNum: PersonNum.ThirdSingular),formList:[Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.Present.rawValue,PersonNum.ThirdSingular.rawValue,""], grammar: "he/she/it is")
                            VerbRowView(word: verb.GetSubjunctivePresent(personNum: PersonNum.FirstPlural),formList:[Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.Present.rawValue,PersonNum.FirstPlural.rawValue,""], grammar: "we are")
                            VerbRowView(word: verb.GetSubjunctivePresent(personNum: PersonNum.SecondPlural),formList:[Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.Present.rawValue,PersonNum.SecondPlural.rawValue,""], grammar: "you (Plural) are")
                            VerbRowView(word: verb.GetSubjunctivePresent(personNum: PersonNum.ThirdPlural),formList:[Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.Present.rawValue,PersonNum.ThirdPlural.rawValue,""], grammar:"they are")
                        }.frame(height: 270)
                        HStack{
                            Spacer()
                            Text("Active subjunctive Imperfect")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetSubjunctiveImperfect(personNum: PersonNum.FirstSingular),formList: [Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.imperfect.rawValue,PersonNum.FirstSingular.rawValue,""], grammar: "i am")
                            VerbRowView(word: verb.GetSubjunctiveImperfect(personNum: PersonNum.SecondSingular),formList:[Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.imperfect.rawValue,PersonNum.SecondSingular.rawValue,""], grammar: "you (singualr) are")
                            VerbRowView(word: verb.GetSubjunctiveImperfect(personNum: PersonNum.ThirdSingular),formList:[Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.imperfect.rawValue,PersonNum.ThirdSingular.rawValue,""], grammar: "he/she/it is")
                            VerbRowView(word: verb.GetSubjunctiveImperfect(personNum: PersonNum.FirstPlural),formList:[Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.imperfect.rawValue,PersonNum.FirstPlural.rawValue,""], grammar: "we are")
                            VerbRowView(word: verb.GetSubjunctiveImperfect(personNum: PersonNum.SecondPlural),formList:[Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.imperfect.rawValue,PersonNum.SecondPlural.rawValue,""], grammar: "you (Plural) are")
                            VerbRowView(word: verb.GetSubjunctiveImperfect(personNum: PersonNum.ThirdPlural),formList:[Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.imperfect.rawValue,PersonNum.ThirdPlural.rawValue,""], grammar:"they are")
                        }.frame(height: 270)
                        // perfect active Subjunctive
                        HStack{
                            Spacer()
                            Text("Active subjunctive Perfect")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetSubjunctivePerfect(personNum: PersonNum.FirstSingular),formList: [Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.perfect.rawValue,PersonNum.FirstSingular.rawValue,""], grammar: "i am")
                            VerbRowView(word: verb.GetSubjunctivePerfect(personNum: PersonNum.SecondSingular),formList:[Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.perfect.rawValue,PersonNum.SecondSingular.rawValue,""], grammar: "you (singualr) are")
                            VerbRowView(word: verb.GetSubjunctivePerfect(personNum: PersonNum.ThirdSingular),formList:[Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.perfect.rawValue,PersonNum.ThirdSingular.rawValue,""], grammar: "he/she/it is")
                            VerbRowView(word: verb.GetSubjunctivePerfect(personNum: PersonNum.FirstPlural),formList:[Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.perfect.rawValue,PersonNum.FirstPlural.rawValue,""], grammar: "we are")
                            VerbRowView(word: verb.GetSubjunctivePerfect(personNum: PersonNum.SecondPlural),formList:[Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.perfect.rawValue,PersonNum.SecondPlural.rawValue,""], grammar: "you (Plural) are")
                            VerbRowView(word: verb.GetSubjunctivePerfect(personNum: PersonNum.ThirdPlural),formList:[Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.perfect.rawValue,PersonNum.ThirdPlural.rawValue,""], grammar:"they are")
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
                                VerbRowView(word: verb.GetSubjunctivePluperfect(personNum: PersonNum.FirstSingular),formList: [Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.pluperfect.rawValue,PersonNum.FirstSingular.rawValue,""], grammar: "i am")
                                VerbRowView(word: verb.GetSubjunctivePluperfect(personNum: PersonNum.SecondSingular),formList:[Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.pluperfect.rawValue,PersonNum.SecondSingular.rawValue,""], grammar: "you (singualr) are")
                                VerbRowView(word: verb.GetSubjunctivePluperfect(personNum: PersonNum.ThirdSingular),formList:[Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.pluperfect.rawValue,PersonNum.ThirdSingular.rawValue,""], grammar: "he/she/it is")
                                VerbRowView(word: verb.GetSubjunctivePluperfect(personNum: PersonNum.FirstPlural),formList:[Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.pluperfect.rawValue,PersonNum.FirstPlural.rawValue,""], grammar: "we are")
                                VerbRowView(word: verb.GetSubjunctivePluperfect(personNum: PersonNum.SecondPlural),formList:[Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.pluperfect.rawValue,PersonNum.SecondPlural.rawValue,""], grammar: "you (Plural) are")
                                VerbRowView(word: verb.GetSubjunctivePluperfect(personNum: PersonNum.ThirdPlural),formList:[Mood.subjunctive.rawValue,Voice.active.rawValue,Tense.pluperfect.rawValue,PersonNum.ThirdPlural.rawValue,""], grammar:"they are")
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
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(personNum: PersonNum.FirstSingular),formList: [Mood.indicative.rawValue,Voice.passive.rawValue,Tense.Present.rawValue,PersonNum.FirstSingular.rawValue,""], grammar: "i am")
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(personNum: PersonNum.SecondSingular),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.Present.rawValue,PersonNum.SecondSingular.rawValue,""], grammar: "you (singualr) are")
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(personNum: PersonNum.ThirdSingular),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.Present.rawValue,PersonNum.ThirdSingular.rawValue,""], grammar: "he/she/it is")
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(personNum: PersonNum.FirstPlural),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.Present.rawValue,PersonNum.FirstPlural.rawValue,""], grammar: "we are")
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(personNum: PersonNum.SecondPlural),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.Present.rawValue,PersonNum.SecondPlural.rawValue,""], grammar: "you (Plural) are")
                                VerbRowView(word: verb.GetPassiveIndicitivePresent(personNum: PersonNum.ThirdPlural),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.Present.rawValue,PersonNum.ThirdPlural.rawValue,""], grammar:"they are")
                            }.frame(height: 270)
                        }
                        HStack{
                            Spacer()
                            Text("passive indicitive imperfect")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(personNum: PersonNum.FirstSingular),formList: [Mood.indicative.rawValue,Voice.passive.rawValue,Tense.imperfect.rawValue,PersonNum.FirstSingular.rawValue,""], grammar: "i am")
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(personNum: PersonNum.SecondSingular),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.imperfect.rawValue,PersonNum.SecondSingular.rawValue,""], grammar: "you (singualr) are")
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(personNum: PersonNum.ThirdSingular),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.imperfect.rawValue,PersonNum.ThirdSingular.rawValue,""], grammar: "he/she/it is")
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(personNum: PersonNum.FirstPlural),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.imperfect.rawValue,PersonNum.FirstPlural.rawValue,""], grammar: "we are")
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(personNum: PersonNum.SecondPlural),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.imperfect.rawValue,PersonNum.SecondPlural.rawValue,""], grammar: "you (Plural) are")
                            VerbRowView(word: verb.GetPassiveIndicitiveImperfect(personNum: PersonNum.ThirdPlural),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.imperfect.rawValue,PersonNum.ThirdPlural.rawValue,""], grammar:"they are")
                        }.frame(height: 270)
                        HStack{
                            Spacer()
                            Text("passive Indicitive future")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(personNum: PersonNum.FirstSingular),formList: [Mood.indicative.rawValue,Voice.passive.rawValue,Tense.future.rawValue,PersonNum.FirstSingular.rawValue,""], grammar: "i am")
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(personNum: PersonNum.SecondSingular),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.future.rawValue,PersonNum.SecondSingular.rawValue,""], grammar: "you (singualr) are")
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(personNum: PersonNum.ThirdSingular),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.future.rawValue,PersonNum.ThirdSingular.rawValue,""], grammar: "he/she/it is")
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(personNum: PersonNum.FirstPlural),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.future.rawValue,PersonNum.FirstPlural.rawValue,""], grammar: "we are")
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(personNum: PersonNum.SecondPlural),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.future.rawValue,PersonNum.SecondPlural.rawValue,""], grammar: "you (Plural) are")
                            VerbRowView(word: verb.GetPassiveIndicitiveFuture(personNum: PersonNum.ThirdPlural),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.future.rawValue,PersonNum.ThirdPlural.rawValue,""], grammar:"they are")
                        }.frame(height: 270)
                        HStack{
                            Spacer()
                            Text("passive Indicitive perfect")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(personNum: PersonNum.FirstSingular,gender:"m"),formList: [Mood.indicative.rawValue,Voice.passive.rawValue,Tense.perfect.rawValue,PersonNum.FirstSingular.rawValue,"m"], grammar: "i am")
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(personNum: PersonNum.SecondSingular,gender:"m"),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.perfect.rawValue,PersonNum.SecondSingular.rawValue,"m"], grammar: "you (singualr) are")
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(personNum: PersonNum.ThirdSingular,gender:"m"),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.perfect.rawValue,PersonNum.ThirdSingular.rawValue,"m"], grammar: "he/she/it is")
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(personNum: PersonNum.FirstPlural,gender:"m"),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.perfect.rawValue,PersonNum.FirstPlural.rawValue,"m"], grammar: "we are")
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(personNum: PersonNum.SecondPlural,gender:"m"),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.perfect.rawValue,PersonNum.SecondPlural.rawValue,"m"], grammar: "you (Plural) are")
                            VerbRowView(word: verb.GetPassiveIndicitivePerfect(personNum: PersonNum.ThirdPlural,gender:"m"),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.perfect.rawValue,PersonNum.ThirdPlural.rawValue,"m"], grammar:"they are")
                        
                        }.frame(height: 270)
                        HStack{
                            Spacer()
                            Text("passive Indicitive pluperfect")
                                .bold()
                            Spacer()
                        }
                        List{
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(personNum: PersonNum.FirstSingular,gender:"m"),formList: [Mood.indicative.rawValue,Voice.passive.rawValue,Tense.pluperfect.rawValue,PersonNum.FirstSingular.rawValue,"m"], grammar: "i am")
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(personNum: PersonNum.SecondSingular,gender:"m"),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.pluperfect.rawValue,PersonNum.SecondSingular.rawValue,"m"], grammar: "you (singualr) are")
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(personNum: PersonNum.ThirdSingular,gender:"m"),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.pluperfect.rawValue,PersonNum.ThirdSingular.rawValue,"m"], grammar: "he/she/it is")
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(personNum: PersonNum.FirstPlural,gender:"m"),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.pluperfect.rawValue,PersonNum.FirstPlural.rawValue,"m"], grammar: "we are")
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(personNum: PersonNum.SecondPlural,gender:"m"),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.pluperfect.rawValue,PersonNum.SecondPlural.rawValue,"m"], grammar: "you (Plural) are")
                            VerbRowView(word: verb.GetPassiveIndicitivePluperfect(personNum: PersonNum.ThirdPlural,gender:"m"),formList:[Mood.indicative.rawValue,Voice.passive.rawValue,Tense.pluperfect.rawValue,PersonNum.ThirdPlural.rawValue,"m"], grammar:"they are")
                        
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
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(personNum: PersonNum.FirstSingular),formList: [Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.Present.rawValue,PersonNum.FirstSingular.rawValue,""], grammar: "i am")
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(personNum: PersonNum.SecondSingular),formList:[Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.Present.rawValue,PersonNum.SecondSingular.rawValue,""], grammar: "you (singualr) are")
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(personNum: PersonNum.ThirdSingular),formList:[Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.Present.rawValue,PersonNum.ThirdSingular.rawValue,""], grammar: "he/she/it is")
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(personNum: PersonNum.FirstPlural),formList:[Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.Present.rawValue,PersonNum.FirstPlural.rawValue,""], grammar: "we are")
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(personNum: PersonNum.SecondPlural),formList:[Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.Present.rawValue,PersonNum.SecondPlural.rawValue,""], grammar: "you (Plural) are")
                                VerbRowView(word: verb.GetPassiveSubjunctivePresent(personNum: PersonNum.ThirdPlural),formList:[Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.Present.rawValue,PersonNum.ThirdPlural.rawValue,""], grammar:"they are")
                            }.frame(height: 270)
                            HStack{
                                Spacer()
                                Text("passive Subjunctive imperfect")
                                    .bold()
                                Spacer()
                            }
                            List{
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(personNum: PersonNum.FirstSingular),formList: [Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.imperfect.rawValue,PersonNum.FirstSingular.rawValue,""], grammar: "i am")
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(personNum: PersonNum.SecondSingular),formList:[Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.imperfect.rawValue,PersonNum.SecondSingular.rawValue,""], grammar: "you (singualr) are")
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(personNum: PersonNum.ThirdSingular),formList:[Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.imperfect.rawValue,PersonNum.ThirdSingular.rawValue,""], grammar: "he/she/it is")
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(personNum: PersonNum.FirstPlural),formList:[Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.imperfect.rawValue,PersonNum.FirstPlural.rawValue,""], grammar: "we are")
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(personNum: PersonNum.SecondPlural),formList:[Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.imperfect.rawValue,PersonNum.SecondPlural.rawValue,""], grammar: "you (Plural) are")
                                VerbRowView(word: verb.GetPassiveSubjunctiveImperfect(personNum: PersonNum.ThirdPlural),formList:[Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.imperfect.rawValue,PersonNum.ThirdPlural.rawValue,""], grammar:"they are")
                            }.frame(height: 270)
                            HStack{
                                Spacer()
                                Text("passive Subjunctive perfect")
                                    .bold()
                                Spacer()
                            }
                            List{
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(personNum: PersonNum.FirstSingular, gender: "m"),formList: [Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.perfect.rawValue,PersonNum.FirstSingular.rawValue,"m"], grammar: "i am")
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(personNum: PersonNum.SecondSingular, gender: "m"),formList:[Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.perfect.rawValue,PersonNum.SecondSingular.rawValue,"m"], grammar: "you (singualr) are")
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(personNum: PersonNum.ThirdSingular, gender: "m"),formList:[Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.perfect.rawValue,PersonNum.ThirdSingular.rawValue,"m"], grammar: "he/she/it is")
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(personNum: PersonNum.FirstPlural, gender: "m"),formList:[Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.perfect.rawValue,PersonNum.FirstPlural.rawValue,"m"], grammar: "we are")
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(personNum: PersonNum.SecondPlural, gender: "m"),formList:[Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.perfect.rawValue,PersonNum.SecondPlural.rawValue,"m"], grammar: "you (Plural) are")
                                VerbRowView(word: verb.GetPassiveSubjunctivePerfect(personNum: PersonNum.ThirdPlural, gender: "m"),formList:[Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.perfect.rawValue,PersonNum.ThirdPlural.rawValue,"m"], grammar:"they are")
                            }.frame(height: 270)
                            HStack{
                                Spacer()
                                Text("passive Subjunctive pluperfect")
                                    .bold()
                                Spacer()
                            }
                            List{
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(personNum: PersonNum.FirstSingular, gender: "m"),formList: [Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.pluperfect.rawValue,PersonNum.FirstSingular.rawValue,""], grammar: "i am")
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(personNum: PersonNum.SecondSingular, gender: "m"),formList:[Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.pluperfect.rawValue,PersonNum.SecondSingular.rawValue,""], grammar: "you (singualr) are")
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(personNum: PersonNum.ThirdSingular, gender: "m"),formList:[Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.pluperfect.rawValue,PersonNum.ThirdSingular.rawValue,""], grammar: "he/she/it is")
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(personNum: PersonNum.FirstPlural, gender: "m"),formList:[Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.pluperfect.rawValue,PersonNum.FirstPlural.rawValue,""], grammar: "we are")
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(personNum: PersonNum.SecondPlural, gender: "m"),formList:[Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.pluperfect.rawValue,PersonNum.SecondPlural.rawValue,""], grammar: "you (Plural) are")
                                VerbRowView(word: verb.GetPassiveSubjunctivePluperfect(personNum: PersonNum.ThirdPlural, gender: "m"),formList:[Mood.subjunctive.rawValue,Voice.passive.rawValue,Tense.pluperfect.rawValue,PersonNum.ThirdPlural.rawValue,""], grammar:"they are")
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
