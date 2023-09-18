import SwiftUI

@main
struct shopping_listApp: App {
    var quoteService = QuoteService()
    @State private var quotesList: [Quote] = []

    // Cargar las citas de forma asíncrona
    func loadQuotesAsync() async {
        do {
            if let quotes = await quoteService.loadQuotesFromJSON() {
                // Actualizar el estado una vez que las citas se carguen exitosamente
                quotesList = quotes
            } else {
                // Manejar el caso en el que no se pudieron cargar las citas
            }
        } catch {
            // Manejar errores si ocurren durante la carga
            print("Error al cargar las citas: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Quesitos", systemImage: "pencil")
                    }

                // Llama a la función de carga asíncrona en la vista de lista
                ListView(quotes: $quotesList)
                    .tabItem {
                        Label("Lista", systemImage: "list.bullet")
                    }
                    .onAppear {
                        Task {
                            await loadQuotesAsync()
                        }
                    }
            }
        }
    }
}
