//
//  Chat.swift
//  Capella
//
//  Created by 박민서 on 2/17/24.
//

import Foundation

struct Chat: Codable, Hashable {
    var name: String
    var isMe: Bool
    var text: String
}
