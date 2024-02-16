//
//  CreateModelViewModel.swift
//  Capella
//
//  Created by YOUJIM on 2/17/24.
//

import Foundation

class CreateModelViewModel: ObservableObject {
    
    @Published var tones = ["친근한", "정중한", "유머러스한", "무례한"]
    @Published var answers = ["정확하게", "간결하게", "자세하게"]
    @Published var conversations = ["초등학생 수준", "대학생 수준", "전문가 수준"]
    @Published var relationships = ["선택하지 않음", "어색한 관계", "팬과 연예인 관계", "연인 관계", "가족 관계", "친구 관계"]
    @Published var extra = ["반말 모드"]
    
    @Published var tonesSelectedModel: String = ""
    @Published var answersSelectedModel: String = ""
    @Published var conversationsSelectedModel: String = ""
    @Published var relationshipsSelectedModel: String = ""
    @Published var extraSelectedModel: String = ""
}

