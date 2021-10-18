//
//  File.swift
//  MockTechPost
//
//  Created by Farhandika on 16/10/21.
//

import Foundation


struct CommentEntity: Codable {
    let postID, id: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}
