//
//  PostEntity.swift
//  MockTechPost
//
//  Created by Farhandika on 16/10/21.
//

import Foundation



struct PostEntity:Codable,Identifiable {
    let userId:Int
    let id:Int
    let title:String
    let body:String
}
