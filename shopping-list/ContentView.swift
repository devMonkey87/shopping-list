import SwiftUI

var globalProperty: Int = 0

func useGlobalProperties() {
    globalProperty += 1
}

struct ContentView: View {
    @State private var labelText = "0"

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.red)
            Text("My first iOS app!").bold(true)
            
            Button("Clicame porfi") {
                useGlobalProperties()
                labelText = "\(globalProperty)"
            }
            .padding(.top, 10.0)
            
            
            
            Label("Contador", systemImage: "\(labelText).circle")
                .padding(.top, 10.0)
        }
        .frame(width: 500, height: 1000) // repasar cuantos son las constantes que puedo usar
        .background(Color.blue)
    }
}

/*
 struct ContentView_Previews: PreviewProvider {
 static var previews: some View {
 ContentView()
 }
 }*/
 
