import SwiftUI

struct ListView: View {
    @State private var showModal = false
    @State private var selectedQuote: Quote?
    
    @Binding var quotes: [Quote]
    
    init(quotes: Binding<[Quote]>) {
        _quotes = quotes
    }
    
    var body: some View {
        List {
            ForEach(quotes, id: \.title) { quote in
                Text(quote.title)
                    .foregroundColor(setRandomColor())
                    .onTapGesture {
                        // Al hacer clic en un elemento de la lista, guarda la cita seleccionada
                        selectedQuote = quote
                        // Abre el modal
                        showModal = true
                    }
            }
        }
        .sheet(isPresented: $showModal) {
            if let quote = selectedQuote {
                QuoteDetailView(quote: quote)
            }
        }
    }
    
    func setRandomColor() -> Color {
        let colors: [Color] = [.pink, .red, .blue, .green]
        let randomIndex = Int.random(in: 0..<colors.count)
        return colors[randomIndex]
    }
}

struct QuoteDetailView: View {
    let quote: Quote
    
    var body: some View {
        // Aquí puedes mostrar la información extendida de la cita en el modal
        VStack {
            Text("Título: \(quote.title)")
            Text("Contenido: \(quote.description)")
            // Agrega más detalles según sea necesario
        }
    }
}
