//
//  LoadAllModel.swift
//  Capella
//
//  Created by 박민서 on 2/17/24.
//

import Foundation

/// 모든 모델들 불러오기 res
typealias LoadAllResponseModel = [Model]
/// 유저 id로 모델 불러오기 res
typealias LoadUsersModelResponseModel = [Model]

struct Model: Codable {
    let id: Int
    let user: String
    let name: String
    let person: String
    let attitude: String
    let createdAt: String
    let updatedAt: String
    let deletedAt: String?
}
