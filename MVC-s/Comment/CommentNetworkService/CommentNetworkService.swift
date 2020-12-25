//
//  CommentNetworkService.swift
//  MVC-s
//
//  Created by Тимофей on 25.12.2020.
//

import Foundation

class CommentNetworkService{
    private init(){}
    static func getComments(competion: @escaping(GetCommandRespons)->()){
        guard  let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else {
            return}
        NetworkService.shared.getData(url: url, completion: { (json) in
            do{
                let response = try GetCommandRespons(json: json)
                competion(response)
            }catch{
                print(error)
            }
        })
    }
}
