//
//  NounContextView.swift
//  Latin
//
//  Created by Kenan Palmer on 11/03/2021.
//

import SwiftUI
struct NounRowView: View{
    let nounString: String
    let caseNumber: caseNum
    var body: some View{
        NavigationLink(destination: NounContextView(caseNumber: caseNumber)){
            HStack{
                Text(nounString)
                Spacer()
                Text(caseNumber.rawValue)
            }
        }
    }
}
struct NounContextView: View {
    let caseNumber : caseNum
    var body: some View {
        List{
            HStack{
                Text(caseNumber.rawValue)
            }
            switch caseNumber{
            case .NomSingular:
                Text(Noun.Contex.Nom.rawValue)
                Text(Noun.Contex.Sing.rawValue)
            case .VocSingular:
                Text(Noun.Contex.Voc.rawValue)
                Text(Noun.Contex.Sing.rawValue)
            case .AccSingular:
                Text(Noun.Contex.Acc.rawValue)
                Text(Noun.Contex.Sing.rawValue)
            case .GenSingular:
                Text(Noun.Contex.Gen.rawValue)
                Text(Noun.Contex.Sing.rawValue)
            case .DatSingular:
                Text(Noun.Contex.Dat.rawValue)
                Text(Noun.Contex.Sing.rawValue)
            case .AblSingular:
                Text(Noun.Contex.Abl.rawValue)
                Text(Noun.Contex.Sing.rawValue)
            case .NomPlural:
                Text(Noun.Contex.Nom.rawValue)
                Text(Noun.Contex.Plural.rawValue)
            case .VocPlural:
                Text(Noun.Contex.Voc.rawValue)
                Text(Noun.Contex.Plural.rawValue)
            case .AccPlural:
                Text(Noun.Contex.Acc.rawValue)
                Text(Noun.Contex.Plural.rawValue)
            case .GenPlural:
                Text(Noun.Contex.Gen.rawValue)
                Text(Noun.Contex.Plural.rawValue)
            case .DatPlural:
                Text(Noun.Contex.Dat.rawValue)
                Text(Noun.Contex.Plural.rawValue)
            case .AblPlural:
                Text(Noun.Contex.Nom.rawValue)
                Text(Noun.Contex.Plural.rawValue)
            }
        }
    }
}

struct NounContextView_Previews: PreviewProvider {
    static var previews: some View {
        NounContextView(caseNumber: caseNum.NomPlural)
    }
}
