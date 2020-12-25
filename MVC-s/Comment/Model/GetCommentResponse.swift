//
//  GetCommentResponse.swift
//  MVC-s
//
//  Created by Тимофей on 25.12.2020.
//

import Foundation

struct GetCommandRespons {
    typealias JSON = [String: AnyObject]
    let comments: [Comment]
    
    init(json: Any) throws{
        guard let array = json as? [JSON] else {
            throw NetworkError.failInternerError
        }
        var comments = [Comment]()
        for dictionary in array{
            guard  let comment = Comment(dict: dictionary) else {
                continue
            }
            comments.append(comment)
        }
        self.comments = comments
    }
}
