struct PractiseSetUpView: View {
    @ObservedObject var newPractise:Practise = Practise()
    @State var InPractise:Bool = false
    var body: some View {
        ZStack{
            if (InPractise){
                PractiseView(practise: newPractise, InPractise: $InPractise)
            }else{
                
                VStack{
                    Form {
                        Section(header: Text("practise parameters")){
                            Toggle(isOn: $newPractise.testingVerbs) {
                                Text("practise verbs")
                                .bold()
                                .font(.system(size: 20))
                            }
                            Toggle(isOn: $newPractise.testingNouns) {
                                Text("practise nouns")
                                .bold()
                                .font(.system(size: 20))
                            }
                            Toggle(isOn: $newPractise.testingPrepositions) {
                                Text("practise prepositions")
                                .bold()
                                .font(.system(size: 20))
                            }
                            NavigationLink(destination: practiseAdvancedSettingsView(practise: newPractise)){
                                Text("select words")
                                    .bold()
                                    .font(.system(size: 20))
                            }
                        }
                        Section(header: Text("practise style")){
                            Toggle(isOn: $newPractise.isMultipleChoice) {
                                Text("multiple choice")
                                .bold()
                                .font(.system(size: 30))
                            }
                            Toggle(isOn: $newPractise.isVocabPractise) {
                                Text("vocab only")
                                .bold()
                                .font(.system(size: 30))
                            }
                        }
                    }
                    Button(action: {
                        self.InPractise = true
                        self.newPractise.setWordType(type: "verbs")
                        if self.newPractise.isVocabPractise{
                            self.newPractise.setVocabQuestion()
                        }
                    }){
                        HStack{
                            Spacer()
                            Text("start practise")
                                .padding(30)
                                .background(Color.black)
                                .foregroundColor(.green)
                                .cornerRadius(20)
                                .opacity(0.8)
                                .multilineTextAlignment(.center)
                            Spacer()
                            
                        }
                    }
                }
            }
        }
    }
}
