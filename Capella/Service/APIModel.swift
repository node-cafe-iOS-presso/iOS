//
//  APIModel.swift
//  Capella
//
//  Created by 박민서 on 2/17/24.
//

// MARK: 서버에서 오는 응답값 저장할 구조체 Generic으로 구현

import Foundation

struct APIModel<T: Codable>: Codable {
    let success: Bool?
    let code: Int?
    let message: String?
    let result: T?
}
