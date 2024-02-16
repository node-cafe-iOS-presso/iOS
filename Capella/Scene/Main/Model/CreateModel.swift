//
//  CreateModel.swift
//  Capella
//
//  Created by 박민서 on 2/17/24.
//

/// 모델 생성하기 Req 모델
struct CreateModel: Codable {
    var name: String
    var role: String   // 모델 역할 (ex. 마동석)
    var tone: String   // 모델 말투 (친근한/정중한/유머러스한/무례한)
    var style: String   // 모델 대답 정확도 (정확하게/간결하게/자세하게)
    var readerLevel: String   // 모델 대화 난이도 (초등학생/대학생/전문가)
    var relationship: String?   // 모델 관계 (null 허용) // (어색한 관계/팬과 연예인 관계/연인 관계/가족 관계/친구 관계)
    var isInFormal: String   // 모델 추가 옵션 (반말 모드 여부) (ACTIVE/INACTIVE)
    var modelCoverImage: String?   // 모델 대표 이미지 (null 허용)
    var question: String   // 사용자의 첫 질문
}

/// 모델 생성하기 Res 모델
struct CreateResponseModel: Codable {
    let newModelId: Int
    let newChatRoomId: Int
    let userSend: MessageInfo
    let modelAnswer: MessageInfo
    
    private enum CodingKeys: String, CodingKey {
        case newModelId
        case newChatRoomId
        case userSend
        case modelAnswer
    }
}

struct MessageInfo: Codable {
    let id: Int
    let message: String
}
