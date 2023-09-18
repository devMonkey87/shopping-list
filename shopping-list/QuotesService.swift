//
//  QuotesService.swift
//  shopping-list
//
//  Created by Jose Antonio Landete Muñoz on 17/9/23.
//

import Foundation

class QuoteService {
    func loadQuotesFromJSON() async -> [Quote]? {
        if let path = Bundle.main.path(forResource: "new", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = JSONDecoder()
                let quotes = try decoder.decode([Quote].self, from: data)
                
                return quotes
            } catch {
                print("Error al cargar datos desde el archivo JSON: \(error)")
            }
        } else {
            print("El archivo JSON 'light.json' no se encontró en la carpeta 'datasets'.")
        }
        
        return nil
    }
}

