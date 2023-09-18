import Foundation

// Definimos una estructura para representar los datos de respuesta JSON
struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

func fetchPosts(completion: @escaping ([Post]?, Error?) -> Void) {
    // URL de la API pública de prueba (JSONPlaceholder)
    let apiURL = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
    // Creamos una instancia de URLSession
    let session = URLSession.shared
    
    // Creamos una tarea de solicitud de datos
    let task = session.dataTask(with: apiURL) { (data, response, error) in
        if let error = error {
            completion(nil, error)
            return
        }
        
        guard let data = data else {
            completion(nil, NSError(domain: "NoData", code: 0, userInfo: nil))
            return
        }
        
        do {
            // Parseamos los datos JSON en un array de objetos Post
            let posts = try JSONDecoder().decode([Post].self, from: data)
            completion(posts, nil)
        } catch let jsonError {
            completion(nil, jsonError)
        }
    }
    
    // Iniciamos la tarea
    task.resume()
}


