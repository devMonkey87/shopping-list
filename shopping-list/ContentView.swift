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
            
            Button(action:{
                useGlobalProperties()
                labelText = "\(globalProperty)"
            }) {
                Text("Clicame porfi papa")
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Label("Quesitos", systemImage: "\(labelText).circle")
                .padding(.all, 10.0).font(.system(size: 40))
            
            Text("🐭") // Agrega el emoji del ratón a la derecha del Label
                .font(.system(size: 100))
        }
        
        
        
        
        .frame(width: 500, height: 1000) // repasar cuantos son las constantes que puedo usar
        .background(Color.mint)
    }
    
}
/*
 struct ContentView_Previews: PreviewProvider {
 static var previews: some View {
 ContentView()
 }
 }*/
 
