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
    
    @Published var chatterName: String = ""
    @Published var roleName: String = ""
    @Published var imageUrl: String?
    
    @Published var tonesSelectedModel: String = ""
    @Published var answersSelectedModel: String = ""
    @Published var conversationsSelectedModel: String = ""
    @Published var relationshipsSelectedModel: String = ""
    @Published var extraSelectedModel: String = ""
    
    @Published var userName: String?

    
    init() {
        self.userName = UserDefaults.standard.string(forKey: "UserName")
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: Notification.Name("imageURL"), object: nil)
    }
        
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handleNotification(_ notification: Notification) {
        if let message = notification.userInfo?["message"] as? String {
            print("Received message: \(message)")
            self.imageUrl = message
        }
    }
    
    func setMadeModel(model: CreateModel) {
        if let encoded = try? JSONEncoder().encode(model) {
            // 인코딩된 데이터를 UserDefaults에 저장
            UserDefaults.standard.set(encoded, forKey: "setMadeModel")
        }
    }
}

