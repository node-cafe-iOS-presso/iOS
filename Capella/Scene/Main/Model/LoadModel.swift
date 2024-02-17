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
    let userId: Int
    let name: String
    let role: String
    let tone: String
    let style: String
    let readerLevel: String
    let relationship: String?
    let isInFormal: String
    let modelCoverImage: String?
    let createdAt: String
    let updatedAt: String
    let deletedAt: String?
}
