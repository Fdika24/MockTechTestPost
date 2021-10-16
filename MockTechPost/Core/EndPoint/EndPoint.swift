//
//  EndPoint.swift
//  MockTechPost
//
//  Created by Farhandika on 16/10/21.
//

//https://jsonplaceholder.typicode.com/albums?userId=1
//https://jsonplaceholder.typicode.com/comments?postId=1

import Foundation


struct EndPoint {
    private let link:String =  "https://jsonplaceholder.typicode.com/"
    
    
    //MARK: Endpoint for Posts
    public func getPostsEndPoint() -> String {
        return link + "posts"
    }
    
    public func getCommentsEndPoint() -> String {
        return link + "comments"
    }
    
    public func getAlbumsEndPoint() -> String {
        return link + "albums"
    }
    
    public func getPhotosEndPoint() -> String {
        return link + "photos"
    }
    
    public func getUsersEndPoint() -> String {
        return link + "users"
    }
}
