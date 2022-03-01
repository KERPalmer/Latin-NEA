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
            HStack{
                Text(adjective.mascNom)
                Spacer()
                Text(adjective.femNom)
                Spacer()
                Text(adjective.neuNom)
            }
                Text("adjective 1/2")
                Text(adjective.get_all_translations())
                    .font(.subheadline)
                    .bold()
                    .multilineTextAlignment(.center)
            VStack{
            List{
                VStack{
                Text("positive degree")
                    .bold()
                    .multilineTextAlignment(.center)
                Text("SINGULAR")
                    .bold()
                    .multilineTextAlignment(.center)
                HStack{
                    Text("case")
                    Spacer()
                    Text("Male")
                    Spacer()
                    Text("Female")
                    Spacer()
                    Text("Neuter")
                }
                    List{
                AdjectiveRowView(
                    caseNum: caseNum.NomSingular,
                    maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.NomSingular),
                    femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.NomSingular),
                    nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.NomSingular))
                AdjectiveRowView(
                    caseNum: caseNum.VocSingular,
                    maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.VocSingular),
                    femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.VocSingular),
                    nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.VocSingular))
                AdjectiveRowView(
                    caseNum: caseNum.AccSingular,
                    maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.AccSingular),
                    femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.AccSingular),
                    nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.AccSingular))
                AdjectiveRowView(
                    caseNum: caseNum.GenSingular,
                    maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.GenSingular),
                    femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.GenSingular),
                    nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.GenSingular))
                AdjectiveRowView(
                    caseNum: caseNum.DatSingular,
                    maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.DatSingular),
                    femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.DatSingular),
                    nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.DatSingular))
                AdjectiveRowView(
                    caseNum: caseNum.AblSingular,
                    maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.AblSingular),
                    femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.AblSingular),
                    nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.AblSingular))
                    }
                }.frame(height: 350)
                VStack{
                Text("Plural")
                        .bold()
                        .multilineTextAlignment(.center)
                HStack{
                        Text("case")
                        Spacer()
                        Text("Male")
                        Spacer()
                        Text("Female")
                        Spacer()
                        Text("Neuter")
                        }
                    List{
                    AdjectiveRowView(
                        caseNum: caseNum.NomSingular,
                        maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.NomPlural),
                        femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.NomPlural),
                        nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.NomPlural))
                    AdjectiveRowView(
                        caseNum: caseNum.VocSingular,
                        maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.VocPlural),
                        femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.VocPlural),
                        nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.VocPlural))
                    AdjectiveRowView(
                        caseNum: caseNum.AccSingular,
                        maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.AccPlural),
                        femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.AccPlural),
                        nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.AccPlural))
                    AdjectiveRowView(
                        caseNum:caseNum.GenPlural,
                        maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.GenPlural),
                        femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.GenPlural),
                        nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.GenPlural))
                    AdjectiveRowView(
                        caseNum:caseNum.DatPlural,
                        maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.DatPlural),
                        femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.DatPlural),
                        nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.DatPlural))
                    AdjectiveRowView(
                        caseNum:caseNum.AblPlural,
                        maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.AblPlural),
                        femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.AblPlural),
                        nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.AblPlural))
                    }
                }.frame(height: 350)
                VStack{
                Text("comparative degree")
                            .bold()
                            .multilineTextAlignment(.center)
                Text("SINGULAR")
                            .bold()
                            .multilineTextAlignment(.center)
                HStack{
                        Text("case")
                        Spacer()
                        Text("Male")
                        Spacer()
                        Text("Female")
                        Spacer()
                        Text("Neuter")
                    }
                    List{
                    AdjectiveRowView(
                        caseNum: caseNum.NomSingular,
                        maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.NomSingular),
                        femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.NomSingular),
                        nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.NomSingular))
                    AdjectiveRowView(
                        caseNum: caseNum.VocSingular,
                        maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.VocSingular),
                        femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.VocSingular),
                        nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.VocSingular))
                    AdjectiveRowView(
                        caseNum: caseNum.AccSingular,
                        maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.AccSingular),
                        femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.AccSingular),
                        nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.AccSingular))
                    AdjectiveRowView(
                        caseNum: caseNum.GenSingular,
                        maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.GenSingular),
                        femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.GenSingular),
                        nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.GenSingular))
                    AdjectiveRowView(
                        caseNum: caseNum.DatSingular,
                        maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.DatSingular),
                        femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.DatSingular),
                        nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.DatSingular))
                    AdjectiveRowView(
                        caseNum: caseNum.AblPlural,
                        maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.AblSingular),
                        femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.AblSingular),
                        nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.AblSingular))
                }
                }.frame(height: 350)
                VStack{
                        Text("Plural")
                            .bold()
                            .multilineTextAlignment(.center)
                        HStack{
                            Text("case")
                            Spacer()
                            Text("Male")
                            Spacer()
                            Text("Female")
                            Spacer()
                            Text("Neuter")
                    }
                    List{
                        AdjectiveRowView(
                            caseNum: caseNum.NomPlural,
                            maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.NomPlural),
                            femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.NomPlural),
                            nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.NomPlural))
                        AdjectiveRowView(
                            caseNum: caseNum.VocPlural,
                            maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.VocPlural),
                            femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.VocPlural),
                            nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.VocPlural))
                        AdjectiveRowView(
                            caseNum: caseNum.AccPlural,
                            maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.AccPlural),
                            femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.AccPlural),
                            nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.AccPlural))
                        AdjectiveRowView(
                            caseNum: caseNum.GenPlural,
                            maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.GenPlural),
                            femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.GenPlural),
                            nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.GenPlural))
                        AdjectiveRowView(
                            caseNum:caseNum.DatPlural,
                            maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.DatPlural),
                            femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.DatPlural),
                            nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.DatPlural))
                        AdjectiveRowView(
                            caseNum: caseNum.AblPlural,
                            maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.AblPlural),
                            femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.AblPlural),
                            nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.AblPlural))
                        }
                }.frame(height: 350)
                VStack{
                        Text("Superlative degree")
                            .bold()
                            .multilineTextAlignment(.center)
                        Text("SINGULAR")
                            .bold()
                            .multilineTextAlignment(.center)
                        HStack{
                            Text("case")
                            Spacer()
                            Text("Male")
                            Spacer()
                            Text("Female")
                            Spacer()
                            Text("Neuter")
                        }
                    List{
                        AdjectiveRowView(
                            caseNum: caseNum.NomSingular,
                            maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.NomSingular),
                            femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.NomSingular),
                            nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.NomSingular))
                        AdjectiveRowView(
                            caseNum: caseNum.VocSingular,
                            maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.VocSingular),
                            femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.VocSingular),
                            nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.VocSingular))
                        AdjectiveRowView(
                            caseNum: caseNum.AccSingular,
                            maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.AccSingular),
                            femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.AccSingular),
                            nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.AccSingular))
                        AdjectiveRowView(
                            caseNum: caseNum.GenSingular,
                            maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.GenSingular),
                            femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.GenSingular),
                            nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.GenSingular))
                        AdjectiveRowView(
                            caseNum: caseNum.DatSingular,
                            maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.DatSingular),
                            femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.DatSingular),
                            nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.DatSingular))
                        AdjectiveRowView(
                            caseNum: caseNum.AblSingular,
                            maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.AblSingular),
                            femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.AblSingular),
                            nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.AblSingular))
                        }
                }.frame(height: 350)
                VStack{
                    
                    Text("Plural")
                        .bold()
                        .multilineTextAlignment(.center)
                    HStack{
                        Text("case")
                        Spacer()
                        Text("Male")
                        Spacer()
                        Text("Female")
                        Spacer()
                        Text("Neuter")
                        }
                    List{
                AdjectiveRowView(
                    caseNum: caseNum.NomPlural,
                    maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.NomPlural),
                    femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.NomPlural),
                    nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.NomPlural))
                AdjectiveRowView(
                    caseNum: caseNum.VocPlural,
                    maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.VocPlural),
                    femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.VocPlural),
                    nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.VocPlural))
                AdjectiveRowView(
                    caseNum: caseNum.AccPlural,
                    maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.AccPlural),
                    femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.AccPlural),
                    nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.AccPlural))
                AdjectiveRowView(
                    caseNum: caseNum.GenPlural,
                    maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.GenPlural),
                    femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.GenPlural),
                    nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.GenPlural))
                AdjectiveRowView(
                    caseNum: caseNum.DatPlural,
                    maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.DatPlural),
                    femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.DatPlural),
                    nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.DatPlural))
                AdjectiveRowView(
                    caseNum: caseNum.AblPlural,
                    maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.AblPlural),
                    femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.AblPlural),
                    nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.AblPlural))
            }
                }.frame(height: 350)
            }
            }
        }
    }
}
//ADJECTIVES 3 SHOWS ALL THE DIFFERERNT FORMS THESE ADJECTIVES CAN BE IN 
struct AdjectiveThirdInfoView: View {
    var adjective:ThirdAdjective
    var body: some View{
        VStack{
            HStack{
                Text(adjective.mascNom)
                Spacer()
                Text(adjective.femNom)
                Spacer()
                Text(adjective.neuNom)
            }
                Text("adjective 3")
                Text(adjective.get_all_translations())
                    .font(.subheadline)
                    .bold()
                    .multilineTextAlignment(.center)
            VStack{
            List{
                VStack{
                Text("positive degree")
                    .bold()
                    .multilineTextAlignment(.center)
                Text("SINGULAR")
                    .bold()
                    .multilineTextAlignment(.center)
                HStack{
                    Text("case")
                    Spacer()
                    Text("Male")
                    Spacer()
                    Text("Female")
                    Spacer()
                    Text("Neuter")
                }
                    List{
                AdjectiveRowView(
                    caseNum: caseNum.NomSingular,
                    maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.NomSingular),
                    femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.NomSingular),
                    nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.NomSingular))
                AdjectiveRowView(
                    caseNum: caseNum.VocSingular,
                    maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.VocSingular),
                    femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.VocSingular),
                    nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.VocSingular))
                AdjectiveRowView(
                    caseNum: caseNum.AccSingular,
                    maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.AccSingular),
                    femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.AccSingular),
                    nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.AccSingular))
                AdjectiveRowView(
                    caseNum: caseNum.GenSingular,
                    maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.GenSingular),
                    femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.GenSingular),
                    nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.GenSingular))
                AdjectiveRowView(
                    caseNum: caseNum.DatSingular,
                    maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.DatSingular),
                    femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.DatSingular),
                    nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.DatSingular))
                AdjectiveRowView(
                    caseNum: caseNum.AblSingular,
                    maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.AblSingular),
                    femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.AblSingular),
                    nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.AblSingular))
                    }
                }.frame(height: 350)
                VStack{
                Text("Plural")
                        .bold()
                        .multilineTextAlignment(.center)
                HStack{
                        Text("case")
                        Spacer()
                        Text("Male")
                        Spacer()
                        Text("Female")
                        Spacer()
                        Text("Neuter")
                        }
                    List{
                    AdjectiveRowView(
                        caseNum: caseNum.NomSingular,
                        maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.NomPlural),
                        femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.NomPlural),
                        nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.NomPlural))
                    AdjectiveRowView(
                        caseNum: caseNum.VocSingular,
                        maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.VocPlural),
                        femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.VocPlural),
                        nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.VocPlural))
                    AdjectiveRowView(
                        caseNum: caseNum.AccSingular,
                        maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.AccPlural),
                        femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.AccPlural),
                        nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.AccPlural))
                    AdjectiveRowView(
                        caseNum:caseNum.GenPlural,
                        maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.GenPlural),
                        femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.GenPlural),
                        nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.GenPlural))
                    AdjectiveRowView(
                        caseNum:caseNum.DatPlural,
                        maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.DatPlural),
                        femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.DatPlural),
                        nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.DatPlural))
                    AdjectiveRowView(
                        caseNum:caseNum.AblPlural,
                        maleForm: adjective.get_positive(gender: Gender.male, CaseNum: caseNum.AblPlural),
                        femForm: adjective.get_positive(gender: Gender.female, CaseNum: caseNum.AblPlural),
                        nueForm: adjective.get_positive(gender: Gender.neuter, CaseNum: caseNum.AblPlural))
                    }
                }.frame(height: 350)
                VStack{
                Text("comparative degree")
                            .bold()
                            .multilineTextAlignment(.center)
                Text("SINGULAR")
                            .bold()
                            .multilineTextAlignment(.center)
                HStack{
                        Text("case")
                        Spacer()
                        Text("Male")
                        Spacer()
                        Text("Female")
                        Spacer()
                        Text("Neuter")
                    }
                    List{
                    AdjectiveRowView(
                        caseNum: caseNum.NomSingular,
                        maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.NomSingular),
                        femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.NomSingular),
                        nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.NomSingular))
                    AdjectiveRowView(
                        caseNum: caseNum.VocSingular,
                        maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.VocSingular),
                        femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.VocSingular),
                        nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.VocSingular))
                    AdjectiveRowView(
                        caseNum: caseNum.AccSingular,
                        maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.AccSingular),
                        femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.AccSingular),
                        nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.AccSingular))
                    AdjectiveRowView(
                        caseNum: caseNum.GenSingular,
                        maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.GenSingular),
                        femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.GenSingular),
                        nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.GenSingular))
                    AdjectiveRowView(
                        caseNum: caseNum.DatSingular,
                        maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.DatSingular),
                        femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.DatSingular),
                        nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.DatSingular))
                    AdjectiveRowView(
                        caseNum: caseNum.AblPlural,
                        maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.AblSingular),
                        femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.AblSingular),
                        nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.AblSingular))
                }
                }.frame(height: 350)
                VStack{
                        Text("Plural")
                            .bold()
                            .multilineTextAlignment(.center)
                        HStack{
                            Text("case")
                            Spacer()
                            Text("Male")
                            Spacer()
                            Text("Female")
                            Spacer()
                            Text("Neuter")
                    }
                    List{
                        AdjectiveRowView(
                            caseNum: caseNum.NomPlural,
                            maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.NomPlural),
                            femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.NomPlural),
                            nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.NomPlural))
                        AdjectiveRowView(
                            caseNum: caseNum.VocPlural,
                            maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.VocPlural),
                            femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.VocPlural),
                            nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.VocPlural))
                        AdjectiveRowView(
                            caseNum: caseNum.AccPlural,
                            maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.AccPlural),
                            femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.AccPlural),
                            nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.AccPlural))
                        AdjectiveRowView(
                            caseNum: caseNum.GenPlural,
                            maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.GenPlural),
                            femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.GenPlural),
                            nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.GenPlural))
                        AdjectiveRowView(
                            caseNum:caseNum.DatPlural,
                            maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.DatPlural),
                            femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.DatPlural),
                            nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.DatPlural))
                        AdjectiveRowView(
                            caseNum: caseNum.AblPlural,
                            maleForm: adjective.get_comparative(gender: Gender.male, CaseNum: caseNum.AblPlural),
                            femForm: adjective.get_comparative(gender: Gender.female, CaseNum: caseNum.AblPlural),
                            nueForm: adjective.get_comparative(gender: Gender.neuter, CaseNum: caseNum.AblPlural))
                        }
                }.frame(height: 350)
                VStack{
                        Text("Superlative degree")
                            .bold()
                            .multilineTextAlignment(.center)
                        Text("SINGULAR")
                            .bold()
                            .multilineTextAlignment(.center)
                        HStack{
                            Text("case")
                            Spacer()
                            Text("Male")
                            Spacer()
                            Text("Female")
                            Spacer()
                            Text("Neuter")
                        }
                    List{
                        AdjectiveRowView(
                            caseNum: caseNum.NomSingular,
                            maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.NomSingular),
                            femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.NomSingular),
                            nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.NomSingular))
                        AdjectiveRowView(
                            caseNum: caseNum.VocSingular,
                            maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.VocSingular),
                            femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.VocSingular),
                            nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.VocSingular))
                        AdjectiveRowView(
                            caseNum: caseNum.AccSingular,
                            maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.AccSingular),
                            femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.AccSingular),
                            nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.AccSingular))
                        AdjectiveRowView(
                            caseNum: caseNum.GenSingular,
                            maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.GenSingular),
                            femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.GenSingular),
                            nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.GenSingular))
                        AdjectiveRowView(
                            caseNum: caseNum.DatSingular,
                            maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.DatSingular),
                            femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.DatSingular),
                            nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.DatSingular))
                        AdjectiveRowView(
                            caseNum: caseNum.AblSingular,
                            maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.AblSingular),
                            femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.AblSingular),
                            nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.AblSingular))
                        }
                }.frame(height: 350)
                VStack{
                    
                    Text("Plural")
                        .bold()
                        .multilineTextAlignment(.center)
                    HStack{
                        Text("case")
                        Spacer()
                        Text("Male")
                        Spacer()
                        Text("Female")
                        Spacer()
                        Text("Neuter")
                        }
                    List{
                AdjectiveRowView(
                    caseNum: caseNum.NomPlural,
                    maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.NomPlural),
                    femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.NomPlural),
                    nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.NomPlural))
                AdjectiveRowView(
                    caseNum: caseNum.VocPlural,
                    maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.VocPlural),
                    femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.VocPlural),
                    nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.VocPlural))
                AdjectiveRowView(
                    caseNum: caseNum.AccPlural,
                    maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.AccPlural),
                    femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.AccPlural),
                    nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.AccPlural))
                AdjectiveRowView(
                    caseNum: caseNum.GenPlural,
                    maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.GenPlural),
                    femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.GenPlural),
                    nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.GenPlural))
                AdjectiveRowView(
                    caseNum: caseNum.DatPlural,
                    maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.DatPlural),
                    femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.DatPlural),
                    nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.DatPlural))
                AdjectiveRowView(
                    caseNum: caseNum.AblPlural,
                    maleForm: adjective.get_superlative(gender: Gender.male, CaseNum: caseNum.AblPlural),
                    femForm: adjective.get_superlative(gender: Gender.female, CaseNum: caseNum.AblPlural),
                    nueForm: adjective.get_superlative(gender: Gender.neuter, CaseNum: caseNum.AblPlural))
            }
                }.frame(height: 350)
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
struct AdjectiveRowView:View{
    let caseNum:caseNum
    let maleForm: String
    let femForm:String
    let nueForm:String
    var body: some View{
        NavigationLink(destination: AdjectiveContexView(CaseNum: caseNum)){
            HStack{
                Text(caseNum.rawValue).bold()
                Spacer()
                Text(maleForm)
                Spacer()
                Text(femForm)
                Spacer()
                Text(nueForm)
            }
        }
    }
}
struct AdjectiveContexView:View {
    let CaseNum: caseNum
    var body: some View{
        switch CaseNum{
        case.NomSingular:
            VStack{
            Text(Adjective.contex.Nom.rawValue)
            Text(Adjective.contex.Sing.rawValue)
            }
        case.VocSingular:
            VStack{
            Text(Adjective.contex.Voc.rawValue)
            Text(Adjective.contex.Sing.rawValue)
            }
        case .AccSingular:
            VStack{
            Text(Adjective.contex.Acc.rawValue)
            Text(Adjective.contex.Sing.rawValue)
            }
        case .GenSingular:
            VStack{
            Text(Adjective.contex.Gen.rawValue)
            Text(Adjective.contex.Sing.rawValue)
            }
        case .DatSingular:
            VStack{
            Text(Adjective.contex.Dat.rawValue)
            Text(Adjective.contex.Sing.rawValue)
            }
        case .AblSingular:
            VStack{
                Text(Adjective.contex.Abl.rawValue)
                Text(Adjective.contex.Sing.rawValue)
            }
        case .NomPlural:
            VStack{
                Text(Adjective.contex.Nom.rawValue)
                Text(Adjective.contex.Plural.rawValue)
            }
        case .VocPlural:
            VStack{
                Text(Adjective.contex.Voc.rawValue)
                Text(Adjective.contex.Plural.rawValue)
            }
        case .AccPlural:
            VStack{
                Text(Adjective.contex.Acc.rawValue)
                Text(Adjective.contex.Plural.rawValue)
            }
        case .GenPlural:
            VStack{
                Text(Adjective.contex.Gen.rawValue)
                Text(Adjective.contex.Plural.rawValue)
            }
        case .DatPlural:
            VStack{
                Text(Adjective.contex.Dat.rawValue)
                Text(Adjective.contex.Plural.rawValue)
            }
        case .AblPlural:
            VStack{
                Text(Adjective.contex.Abl.rawValue)
                Text(Adjective.contex.Plural.rawValue)
            }
        }
    }
}

