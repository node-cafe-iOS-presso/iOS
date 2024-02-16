//
//  FindUsert.swift
//  Capella
//
//  Created by YOUJIM on 2/17/24.
//

import Foundation


struct FindUserRequestModel: Codable {
    
}

struct FindUserResponseModel: Codable {
    let id: Int?
    let token: String?
    let name: String?
    let userCoverImage: String?
    let createdAt: String?
    let updatedAt: String?
    let deletedAt: String?
}
