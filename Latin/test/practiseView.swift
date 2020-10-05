struct PractiseView: View{
    @ObservedObject var practise:Practise
    @ObservedObject var programDatabase:ProgramDatabase=PROGRAMDATABASE
    @Binding var InPractise:Bool
    var body: some View{
        ZStack{
            if (practise.isVocabPractise == true){
                vocabPractiseView(InPractise: $InPractise,practise: practise)
            }
        }
    }
}
