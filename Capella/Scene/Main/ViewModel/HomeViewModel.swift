//
//  HomeViewModel.swift
//  Capella
//
//  Created by 박민서 on 2/17/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var capellaList: [CardView] = [
        CardView(modelId: 0, image: "https://firebasestorage.googleapis.com:443/v0/b/capella-2902a.appspot.com/o/B9F200AF-E147-4EE6-A92C-31D3C0481EA01708121054.137567?alt=media&token=26cf11f9-3075-4c0e-8a2a-c0708ee9ea22", name: "Jobs"),
        CardView(modelId: 0, image: "asdf", name: "Jobs"),
        CardView(modelId: 0, image: "asdf", name: "Jobs")
    ]
    
    @Published var chatterList: [CardView] = [
        CardView(modelId: 0, image: "asdf", name: "chatter"),
        CardView(modelId: 0, image: "asdf", name: "chatter"),
        CardView(modelId: 0, image: "https://firebasestorage.googleapis.com:443/v0/b/capella-2902a.appspot.com/o/B9F200AF-E147-4EE6-A92C-31D3C0481EA01708121054.137567?alt=media&token=26cf11f9-3075-4c0e-8a2a-c0708ee9ea22", name: "chatter")
    ]
    
    @Published var recentChattedList: [CardView] = [
        CardView(modelId: 0, image: "asdf", name: "chatter"),
        CardView(modelId: 0, image: "asdf", name: "chatter"),
        CardView(modelId: 0, image: "asdf", name: "chatter")
    ]
    
    @Published var recentlyGeneratedList: [CardView] = [
        CardView(modelId: 0, image: "asdf", name: "chatter"),
        CardView(modelId: 0, image: "https://firebasestorage.googleapis.com:443/v0/b/capella-2902a.appspot.com/o/B9F200AF-E147-4EE6-A92C-31D3C0481EA01708121054.137567?alt=media&token=26cf11f9-3075-4c0e-8a2a-c0708ee9ea22", name: "chatter"),
        CardView(modelId: 0, image: "asdf", name: "chatter")
    ]
    
    /// 토큰 전송
//    func postAppleToken(token: String) {
//        print("서버로 보냄 : \(token)")
//        self.isLogin = true
//    }
    
    func fetchDatas() {
        if let userID = UserDefaults.standard.string(forKey: "userIdentifier") {
            
            /// 카펠라
            
            /// 유저가 만든 모델 불러오기 두번째 로우
            APIManager.shared.getData(
                urlEndpointString: Constant.getLoadUsersModels(userId: userID),
                responseDataType: LoadUsersModelResponseModel.self,
                requestDataType: LoadUsersModelResponseModel.self,
                parameter: nil ) { model in
                    let cardViewList = model.map {
                        return CardView(
                            modelId: $0.id,
                            image: $0.modelCoverImage ?? "", // 이미지 추가할 때 변경 필요
                            name: $0.name)
                    }
                    
                    self.chatterList = cardViewList
                }
            
            /// 최근 진행한 커피챗
             
            /// 최근 생성된 커피챗들
            APIManager.shared.getData(
                urlEndpointString: Constant.getLoadAllModels,
                responseDataType: LoadAllResponseModel.self,
                requestDataType: LoadAllResponseModel.self,
                parameter: nil ) { model in
                    let cardViewList = model.map {
                        return CardView(
                            modelId: $0.id,
                            image: $0.modelCoverImage ?? "", // 이미지 추가할 때 변경 필요
                            name: $0.name)
                    }
                    
                    self.recentlyGeneratedList = cardViewList
                }
            
        }
    }
}
