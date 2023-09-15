import SwiftUI

@main
struct shopping_listApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Quesitos", systemImage: "pencil")
                    }
                
                ListView()
                    .tabItem {
                        Label("Lista", systemImage: "list.bullet")
    
                    }
            }
        }
    }
}
