//
//  AdjectiveInfoView.swift
//  Latin
//
//  Created by Kenan Palmer on 25/11/2020.
//

import SwiftUI
//ADJECTIVES 2/1/2 SHOWS ALL THE DIFFERERNT FORMS THESE ADJECTIVES CAN BE IN
struct AdjectiveOneTwoInfoView: View {
    var adjective:FirstSecondAdjective
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text(adjective.mascNom)
                    Text(adjective.femNom)
                    Text(adjective.neuNom)
                }
                Text("adjective 1/2")
                Text(adjective.get_all_translations())
                    .font(.subheadline)
                    .bold()
                    .multilineTextAlignment(.center)
            }
            List{
                VStack{
                    VStack{
                        Text("positive degree")
                            .bold()
                            .multilineTextAlignment(.center)
                        Text("SINGULAR")
                            .bold()
                            .multilineTextAlignment(.center)
                        HStack{
                            Text("case")
                                .bold()
                            Spacer()
                            Text("masc")
                                .bold()
                            Spacer()
                            Text("fem")
                                .bold()
                            Spacer()
                            Text("neu")
                                .bold()
                        }
                        HStack{
                            Text("Nom")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Nom", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Nom", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Nom", isSingle: true))
                        }
                        HStack{
                            Text("Voc")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Voc", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Voc", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Voc", isSingle: true))
                        }
                        HStack{
                            Text("Acc")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Acc", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Acc", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Acc", isSingle: true))
                        }
                        HStack{
                            Text("Gen")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Gen", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Gen", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Gen", isSingle: true))
                        }
                        HStack{
                            Text("Dat")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Dat", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Dat", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Dat", isSingle: true))
                        }
                        HStack{
                            Text("Abl")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Abl", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Abl", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Abl", isSingle: true))
                        }
                    }
                    VStack{
                        Text("Plural")
                            .bold()
                            .multilineTextAlignment(.center)
                        HStack{
                            Text("case")
                                .bold()
                            Spacer()
                            Text("masc")
                                .bold()
                            Spacer()
                            Text("fem")
                                .bold()
                            Spacer()
                            Text("neu")
                                .bold()
                        }
                        HStack{
                            Text("Nom")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Nom", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Nom", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Nom", isSingle: false))
                        }
                        HStack{
                            Text("Voc")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Voc", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Voc", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Voc", isSingle: false))
                        }
                        HStack{
                            Text("Acc")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Acc", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Acc", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Acc", isSingle: false))
                        }
                        HStack{
                            Text("Gen")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Gen", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Gen", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Gen", isSingle: false))
                        }
                        HStack{
                            Text("Dat")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Dat", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Dat", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Dat", isSingle: false))
                        }
                        HStack{
                            Text("Abl")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Abl", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Abl", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Abl", isSingle: false))
                        }
                    }
                }
                VStack{
                    VStack{
                        Text("comparative degree")
                            .bold()
                            .multilineTextAlignment(.center)
                        Text("SINGULAR")
                            .bold()
                            .multilineTextAlignment(.center)
                        HStack{
                            Text("case")
                                .bold()
                            Spacer()
                            Text("masc")
                                .bold()
                            Spacer()
                            Text("fem")
                                .bold()
                            Spacer()
                            Text("neu")
                                .bold()
                        }
                        HStack{
                            Text("Nom")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Nom", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Nom", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Nom", isSingle: true))
                        }
                        HStack{
                            Text("Voc")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Voc", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Voc", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Voc", isSingle: true))
                        }
                        HStack{
                            Text("Acc")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Acc", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Acc", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Acc", isSingle: true))
                        }
                        HStack{
                            Text("Gen")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Gen", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Gen", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Gen", isSingle: true))
                        }
                        HStack{
                            Text("Dat")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Dat", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Dat", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Dat", isSingle: true))
                        }
                        HStack{
                            Text("Abl")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Abl", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Abl", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Abl", isSingle: true))
                        }
                    }
                    VStack{
                        Text("PLURAL")
                            .bold()
                            .multilineTextAlignment(.center)
                        HStack{
                            Text("case")
                                .bold()
                            Spacer()
                            Text("masc")
                                .bold()
                            Spacer()
                            Text("fem")
                                .bold()
                            Spacer()
                            Text("neu")
                                .bold()
                        }
                        HStack{
                            Text("Nom")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Nom", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Nom", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Nom", isSingle: false))
                        }
                        HStack{
                            Text("Voc")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Voc", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Voc", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Voc", isSingle: false))
                        }
                        HStack{
                            Text("Acc")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Acc", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Acc", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Acc", isSingle: false))
                        }
                        HStack{
                            Text("Gen")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Gen", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Gen", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Gen", isSingle: false))
                        }
                        HStack{
                            Text("Dat")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Dat", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Dat", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Dat", isSingle: false))
                        }
                        HStack{
                            Text("Abl")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Abl", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Abl", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Abl", isSingle: false))
                        }
                    }
                }
                VStack{
                    VStack{
                    Text("Superlative degree")
                        .bold()
                        .multilineTextAlignment(.center)
                    Text("SINGULAR")
                        .bold()
                        .multilineTextAlignment(.center)
                    HStack{
                        Text("case")
                            .bold()
                        Spacer()
                        Text("masc")
                            .bold()
                        Spacer()
                        Text("fem")
                            .bold()
                        Spacer()
                        Text("neu")
                            .bold()
                    }
                    HStack{
                        Text("Nom")
                            .bold()
                        Spacer()
                        Text(adjective.get_superlative(gender: "masc", caseForm: "Nom", isSingle: true))
                        Spacer()
                        Text(adjective.get_superlative(gender: "fem", caseForm: "Nom", isSingle: true))
                        Spacer()
                        Text(adjective.get_superlative(gender: "neu", caseForm: "Nom", isSingle: true))
                    }
                    HStack{
                        Text("Voc")
                            .bold()
                        Spacer()
                        Text(adjective.get_superlative(gender: "masc", caseForm: "Voc", isSingle: true))
                        Spacer()
                        Text(adjective.get_superlative(gender: "fem", caseForm: "Voc", isSingle: true))
                        Spacer()
                        Text(adjective.get_superlative(gender: "neu", caseForm: "Voc", isSingle: true))
                    }
                    HStack{
                        Text("Acc")
                            .bold()
                        Spacer()
                        Text(adjective.get_superlative(gender: "masc", caseForm: "Acc", isSingle: true))
                        Spacer()
                        Text(adjective.get_superlative(gender: "fem", caseForm: "Acc", isSingle: true))
                        Spacer()
                        Text(adjective.get_superlative(gender: "neu", caseForm: "Acc", isSingle: true))
                    }
                    HStack{
                        Text("Gen")
                            .bold()
                        Spacer()
                        Text(adjective.get_superlative(gender: "masc", caseForm: "Gen", isSingle: true))
                        Spacer()
                        Text(adjective.get_superlative(gender: "fem", caseForm: "Gen", isSingle: true))
                        Spacer()
                        Text(adjective.get_superlative(gender: "neu", caseForm: "Gen", isSingle: true))
                    }
                    HStack{
                        Text("Dat")
                            .bold()
                        Spacer()
                        Text(adjective.get_superlative(gender: "masc", caseForm: "Dat", isSingle: true))
                        Spacer()
                        Text(adjective.get_superlative(gender: "fem", caseForm: "Dat", isSingle: true))
                        Spacer()
                        Text(adjective.get_superlative(gender: "neu", caseForm: "Dat", isSingle: true))
                    }
                    HStack{
                        Text("Abl")
                            .bold()
                        Spacer()
                        Text(adjective.get_superlative(gender: "masc", caseForm: "Abl", isSingle: true))
                        Spacer()
                        Text(adjective.get_superlative(gender: "fem", caseForm: "Abl", isSingle: true))
                        Spacer()
                        Text(adjective.get_superlative(gender: "neu", caseForm: "Abl", isSingle: true))
                    }
                }
                    VStack{
                    Text("PLURAL")
                    HStack{
                        Text("case")
                            .bold()
                        Spacer()
                        Text("masc")
                            .bold()
                        Spacer()
                        Text("fem")
                            .bold()
                        Spacer()
                        Text("neu")
                            .bold()
                    }
                    HStack{
                        Text("Nom")
                            .bold()
                        Spacer()
                        Text(adjective.get_positive(gender: "masc", caseForm: "Nom", isSingle: false))
                        Spacer()
                        Text(adjective.get_positive(gender: "fem", caseForm: "Nom", isSingle: false))
                        Spacer()
                        Text(adjective.get_positive(gender: "neu", caseForm: "Nom", isSingle: false))
                    }
                    HStack{
                        Text("Voc")
                            .bold()
                        Spacer()
                        Text(adjective.get_positive(gender: "masc", caseForm: "Voc", isSingle: false))
                        Spacer()
                        Text(adjective.get_positive(gender: "fem", caseForm: "Voc", isSingle: false))
                        Spacer()
                        Text(adjective.get_positive(gender: "neu", caseForm: "Voc", isSingle: false))
                    }
                    HStack{
                        Text("Acc")
                            .bold()
                        Spacer()
                        Text(adjective.get_positive(gender: "masc", caseForm: "Acc", isSingle: false))
                        Spacer()
                        Text(adjective.get_positive(gender: "fem", caseForm: "Acc", isSingle: false))
                        Spacer()
                        Text(adjective.get_positive(gender: "neu", caseForm: "Acc", isSingle: false))
                    }
                    HStack{
                        Text("Gen")
                            .bold()
                        Spacer()
                        Text(adjective.get_positive(gender: "masc", caseForm: "Gen", isSingle: false))
                        Spacer()
                        Text(adjective.get_positive(gender: "fem", caseForm: "Gen", isSingle: false))
                        Spacer()
                        Text(adjective.get_positive(gender: "neu", caseForm: "Gen", isSingle: false))
                    }
                    HStack{
                        Text("Dat")
                            .bold()
                        Spacer()
                        Text(adjective.get_positive(gender: "masc", caseForm: "Dat", isSingle: false))
                        Spacer()
                        Text(adjective.get_positive(gender: "fem", caseForm: "Dat", isSingle: false))
                        Spacer()
                        Text(adjective.get_positive(gender: "neu", caseForm: "Dat", isSingle: false))
                    }
                    HStack{
                        Text("Abl")
                            .bold()
                        Spacer()
                        Text(adjective.get_positive(gender: "masc", caseForm: "Abl", isSingle: false))
                        Spacer()
                        Text(adjective.get_positive(gender: "fem", caseForm: "Abl", isSingle: false))
                        Spacer()
                        Text(adjective.get_positive(gender: "neu", caseForm: "Abl", isSingle: false))
                    }
                }
                }
            }
        }
    }
}
//ADJECTIVES 3 SHOWS ALL THE DIFFERERNT FORMS THESE ADJECTIVES CAN BE IN 
struct AdjectiveThirdInfoView: View {
    var adjective:ThirdAdjective
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text(adjective.mascNom)
                    Text(adjective.femNom)
                    Text(adjective.neuNom)
                }
                Text("adjective 3")
                Text(adjective.get_all_translations())
                    .font(.subheadline)
                    .bold()
                    .multilineTextAlignment(.center)
            }
            List{
                VStack{
                    VStack{
                        Text("positive degree")
                            .bold()
                            .multilineTextAlignment(.center)
                        Text("SINGULAR")
                            .bold()
                            .multilineTextAlignment(.center)
                        HStack{
                            Text("case")
                                .bold()
                            Spacer()
                            Text("masc")
                                .bold()
                            Spacer()
                            Text("fem")
                                .bold()
                            Spacer()
                            Text("neu")
                                .bold()
                        }
                        HStack{
                            Text("Nom")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Nom", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Nom", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Nom", isSingle: true))
                        }
                        HStack{
                            Text("Voc")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Voc", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Voc", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Voc", isSingle: true))
                        }
                        HStack{
                            Text("Acc")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Acc", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Acc", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Acc", isSingle: true))
                        }
                        HStack{
                            Text("Gen")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Gen", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Gen", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Gen", isSingle: true))
                        }
                        HStack{
                            Text("Dat")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Dat", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Dat", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Dat", isSingle: true))
                        }
                        HStack{
                            Text("Abl")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Abl", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Abl", isSingle: true))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Abl", isSingle: true))
                        }
                    }
                    VStack{
                        Text("Plural")
                            .bold()
                            .multilineTextAlignment(.center)
                        HStack{
                            Text("case")
                                .bold()
                            Spacer()
                            Text("masc")
                                .bold()
                            Spacer()
                            Text("fem")
                                .bold()
                            Spacer()
                            Text("neu")
                                .bold()
                        }
                        HStack{
                            Text("Nom")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Nom", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Nom", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Nom", isSingle: false))
                        }
                        HStack{
                            Text("Voc")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Voc", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Voc", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Voc", isSingle: false))
                        }
                        HStack{
                            Text("Acc")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Acc", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Acc", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Acc", isSingle: false))
                        }
                        HStack{
                            Text("Gen")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Gen", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Gen", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Gen", isSingle: false))
                        }
                        HStack{
                            Text("Dat")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Dat", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Dat", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Dat", isSingle: false))
                        }
                        HStack{
                            Text("Abl")
                                .bold()
                            Spacer()
                            Text(adjective.get_positive(gender: "masc", caseForm: "Abl", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "fem", caseForm: "Abl", isSingle: false))
                            Spacer()
                            Text(adjective.get_positive(gender: "neu", caseForm: "Abl", isSingle: false))
                        }
                    }
                }
                VStack{
                    VStack{
                        Text("comparative degree")
                            .bold()
                            .multilineTextAlignment(.center)
                        Text("SINGULAR")
                            .bold()
                            .multilineTextAlignment(.center)
                        HStack{
                            Text("case")
                                .bold()
                            Spacer()
                            Text("masc")
                                .bold()
                            Spacer()
                            Text("fem")
                                .bold()
                            Spacer()
                            Text("neu")
                                .bold()
                        }
                        HStack{
                            Text("Nom")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Nom", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Nom", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Nom", isSingle: true))
                        }
                        HStack{
                            Text("Voc")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Voc", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Voc", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Voc", isSingle: true))
                        }
                        HStack{
                            Text("Acc")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Acc", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Acc", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Acc", isSingle: true))
                        }
                        HStack{
                            Text("Gen")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Gen", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Gen", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Gen", isSingle: true))
                        }
                        HStack{
                            Text("Dat")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Dat", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Dat", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Dat", isSingle: true))
                        }
                        HStack{
                            Text("Abl")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Abl", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Abl", isSingle: true))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Abl", isSingle: true))
                        }
                    }
                    VStack{
                        Text("PLURAL")
                            .bold()
                            .multilineTextAlignment(.center)
                        HStack{
                            Text("case")
                                .bold()
                            Spacer()
                            Text("masc")
                                .bold()
                            Spacer()
                            Text("fem")
                                .bold()
                            Spacer()
                            Text("neu")
                                .bold()
                        }
                        HStack{
                            Text("Nom")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Nom", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Nom", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Nom", isSingle: false))
                        }
                        HStack{
                            Text("Voc")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Voc", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Voc", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Voc", isSingle: false))
                        }
                        HStack{
                            Text("Acc")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Acc", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Acc", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Acc", isSingle: false))
                        }
                        HStack{
                            Text("Gen")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Gen", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Gen", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Gen", isSingle: false))
                        }
                        HStack{
                            Text("Dat")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Dat", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Dat", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Dat", isSingle: false))
                        }
                        HStack{
                            Text("Abl")
                                .bold()
                            Spacer()
                            Text(adjective.get_comparative(gender: "masc", caseForm: "Abl", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "fem", caseForm: "Abl", isSingle: false))
                            Spacer()
                            Text(adjective.get_comparative(gender: "neu", caseForm: "Abl", isSingle: false))
                        }
                    }
                }
                VStack{
                    VStack{
                        Text("Superlative degree")
                            .bold()
                            .multilineTextAlignment(.center)
                        Text("SINGULAR")
                            .bold()
                            .multilineTextAlignment(.center)
                        HStack{
                            Text("case")
                                .bold()
                            Spacer()
                            Text("masc")
                                .bold()
                            Spacer()
                            Text("fem")
                                .bold()
                            Spacer()
                            Text("neu")
                                .bold()
                        }
                        HStack{
                            Text("Nom")
                                .bold()
                            Spacer()
                            Text(adjective.get_superlative(gender: "masc", caseForm: "Nom", isSingle: true))
                            Spacer()
                            Text(adjective.get_superlative(gender: "fem", caseForm: "Nom", isSingle: true))
                            Spacer()
                            Text(adjective.get_superlative(gender: "neu", caseForm: "Nom", isSingle: true))
                        }
                        HStack{
                            Text("Voc")
                                .bold()
                            Spacer()
                            Text(adjective.get_superlative(gender: "masc", caseForm: "Voc", isSingle: true))
                            Spacer()
                            Text(adjective.get_superlative(gender: "fem", caseForm: "Voc", isSingle: true))
                            Spacer()
                            Text(adjective.get_superlative(gender: "neu", caseForm: "Voc", isSingle: true))
                        }
                        HStack{
                            Text("Acc")
                                .bold()
                            Spacer()
                            Text(adjective.get_superlative(gender: "masc", caseForm: "Acc", isSingle: true))
                            Spacer()
                            Text(adjective.get_superlative(gender: "fem", caseForm: "Acc", isSingle: true))
                            Spacer()
                            Text(adjective.get_superlative(gender: "neu", caseForm: "Acc", isSingle: true))
                        }
                        HStack{
                            Text("Gen")
                                .bold()
                            Spacer()
                            Text(adjective.get_superlative(gender: "masc", caseForm: "Gen", isSingle: true))
                            Spacer()
                            Text(adjective.get_superlative(gender: "fem", caseForm: "Gen", isSingle: true))
                            Spacer()
                            Text(adjective.get_superlative(gender: "neu", caseForm: "Gen", isSingle: true))
                        }
                        HStack{
                            Text("Dat")
                                .bold()
                            Spacer()
                            Text(adjective.get_superlative(gender: "masc", caseForm: "Dat", isSingle: true))
                            Spacer()
                            Text(adjective.get_superlative(gender: "fem", caseForm: "Dat", isSingle: true))
                            Spacer()
                            Text(adjective.get_superlative(gender: "neu", caseForm: "Dat", isSingle: true))
                        }
                        HStack{
                            Text("Abl")
                                .bold()
                            Spacer()
                            Text(adjective.get_superlative(gender: "masc", caseForm: "Abl", isSingle: true))
                            Spacer()
                            Text(adjective.get_superlative(gender: "fem", caseForm: "Abl", isSingle: true))
                            Spacer()
                            Text(adjective.get_superlative(gender: "neu", caseForm: "Abl", isSingle: true))
                        }
                    }
                    VStack{
                        Text("PLURAL")
                        HStack{
                            Text("case")
                                .bold()
                            Spacer()
                            Text("masc")
                                .bold()
                            Spacer()
                            Text("fem")
                                .bold()
                            Spacer()
                            Text("neu")
                                .bold()
                        }
                        HStack{
                            Text("Nom")
                                .bold()
                            Spacer()
                            Text(adjective.get_superlative(gender: "masc", caseForm: "Nom", isSingle: false))
                            Spacer()
                            Text(adjective.get_superlative(gender: "fem", caseForm: "Nom", isSingle: false))
                            Spacer()
                            Text(adjective.get_superlative(gender: "neu", caseForm: "Nom", isSingle: false))
                        }
                        HStack{
                            Text("Voc")
                                .bold()
                            Spacer()
                            Text(adjective.get_superlative(gender: "masc", caseForm: "Voc", isSingle: false))
                            Spacer()
                            Text(adjective.get_superlative(gender: "fem", caseForm: "Voc", isSingle: false))
                            Spacer()
                            Text(adjective.get_superlative(gender: "neu", caseForm: "Voc", isSingle: false))
                        }
                        HStack{
                            Text("Acc")
                                .bold()
                            Spacer()
                            Text(adjective.get_superlative(gender: "masc", caseForm: "Acc", isSingle: false))
                            Spacer()
                            Text(adjective.get_superlative(gender: "fem", caseForm: "Acc", isSingle: false))
                            Spacer()
                            Text(adjective.get_superlative(gender: "neu", caseForm: "Acc", isSingle: false))
                        }
                        HStack{
                            Text("Gen")
                                .bold()
                            Spacer()
                            Text(adjective.get_superlative(gender: "masc", caseForm: "Gen", isSingle: false))
                            Spacer()
                            Text(adjective.get_superlative(gender: "fem", caseForm: "Gen", isSingle: false))
                            Spacer()
                            Text(adjective.get_superlative(gender: "neu", caseForm: "Gen", isSingle: false))
                        }
                        HStack{
                            Text("Dat")
                                .bold()
                            Spacer()
                            Text(adjective.get_superlative(gender: "masc", caseForm: "Dat", isSingle: false))
                            Spacer()
                            Text(adjective.get_superlative(gender: "fem", caseForm: "Dat", isSingle: false))
                            Spacer()
                            Text(adjective.get_superlative(gender: "neu", caseForm: "Dat", isSingle: false))
                        }
                        HStack{
                            Text("Abl")
                                .bold()
                            Spacer()
                            Text(adjective.get_superlative(gender: "masc", caseForm: "Abl", isSingle: false))
                            Spacer()
                            Text(adjective.get_superlative(gender: "fem", caseForm: "Abl", isSingle: false))
                            Spacer()
                            Text(adjective.get_superlative(gender: "neu", caseForm: "Abl", isSingle: false))
                        }
                    }
                }
            }
        }
    }
}
struct AdjectiveIndeclinableInfoView: View{
    var adjective: IndeclinableAdjective
    var body: some View{
        VStack{
            
        Spacer()
        Text(adjective.mascNom)
        Spacer()
        Text(adjective.get_all_translations())
        Spacer()
        }
    }
}

