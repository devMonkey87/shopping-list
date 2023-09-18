//
//  Utils.swift
//  shopping-list
//
//  Created by Jose Antonio Landete Muñoz on 16/9/23.
//

import Foundation


func getColors() -> [ColorType] {
    let colors  = [ColorType(name: "red"),ColorType(name: "blue"), ColorType(name: "green")]
    return colors
}

func callPosts() -> [Post]{
    let postsList: [Post] = []
    
    fetchPosts { (posts, error) in
        if let error = error {
            print("Error al obtener los datos: \(error)")
            return
        }
        
        if var posts = posts {
            // Aquí puedes trabajar con los datos obtenidos de la API
            for post in posts {
                //print("ID: \(post.id), Título: \(post.title)")
                posts.append(post)
            }
        }
    }
    return postsList
    
}
