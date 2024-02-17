//
//  getFindUser.swift
//  Capella
//
//  Created by YOUJIM on 2/17/24.
//

import Foundation


struct CreateUserRequestModel: Codable {
    let token: String
    let name: String
}

struct CreateUserResponseModel: Codable {
    let token: String?
    let name: String?
    let userCoverImage: String?
    let updatedAt: String?
    let id: Int?
    let createdAt: String?
    let deletedAt: String?
}
