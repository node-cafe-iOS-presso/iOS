//
//  HomeViewModel.swift
//  Capella
//
//  Created by 박민서 on 2/17/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    init() {
        self.fetchDatas()
    }
    
    @Published var capellaList: [CardView] = [
        CardView(modelId: 0, image: "https://i.namu.wiki/i/S-a-EJ8V4CVZdU1ol7X88OzBdEjz4qgMuTJcIXPfDe6wlRPTv865dng38lzlVk8Q0CJm3-RRCry4fM-w8aaVUR_q7ErOj18ImXXcRpIogmlm3aFE_cKyGQtkZFhJcC9x2zeiO7zF-FowazNEgggIrZ0HTwwkEfhZNlMYSQ59IfE.webp", name: "이길여"),
        CardView(modelId: 0, image: "https://image.edaily.co.kr/images/photo/files/NP/S/2023/12/PS23120100506.jpg", name: "Taylor Swift"),
        CardView(modelId: 0, image: "https://hips.hearstapps.com/hmg-prod/images/apple-ceo-steve-jobs-speaks-during-an-apple-special-event-news-photo-1683661736.jpg?crop=0.757xw:0.534xh;0.0799xw,0.0372xh&resize=1200:*", name: "Steve Jobs"),
        CardView(modelId: 0, image: "https://wimg.mk.co.kr/meet/neds/2022/06/image_readtop_2022_556367_16561184505086722.jpeg", name: "Elon Musk"),
        CardView(modelId: 0, image: "https://i.pcmag.com/imagery/articles/040JHoVNgc1gh2e7sunj82k-1..v1569492349.png", name: "Linus Torvalds")
    ]
    
    @Published var chatterList: [CardView] = [
        CardView(modelId: 0, image: "https://image.cine21.com/resize/cine21/person/2018/0423/13_42_54__5add644ed52f5%5BW578-%5D.jpg", name: "마동석"),
        CardView(modelId: 0, image: "https://thumbnews.nateimg.co.kr/view610///news.nateimg.co.kr/orgImg/tn/2022/12/04/tn_1670510464342_363754_0.jpg", name: "허윤진"),
        CardView(modelId: 0, image: "https://www.kukinews.com/data/kuk/image/2022/10/24/kuk202210240314.png", name: "이찬혁")
    ]
    
    @Published var recentChattedList: [CardView] = [
        CardView(modelId: 0, image: "https://www.kukinews.com/data/kuk/image/2022/10/24/kuk202210240314.png", name: "이찬혁"),
        CardView(modelId: 0, image: "https://wimg.mk.co.kr/meet/neds/2022/06/image_readtop_2022_556367_16561184505086722.jpeg", name: "Elon Musk"),
        CardView(modelId: 0, image: "https://image.edaily.co.kr/images/photo/files/NP/S/2023/12/PS23120100506.jpg", name: "Taylor Swift")
    ]
    
    @Published var recentlyGeneratedList: [CardView] = [
        CardView(modelId: 0, image: "https://image.cine21.com/resize/cine21/person/2018/0423/13_42_54__5add644ed52f5%5BW578-%5D.jpg", name: "마동석"),
        CardView(modelId: 0, image: "https://thumbnews.nateimg.co.kr/view610///news.nateimg.co.kr/orgImg/tn/2022/12/04/tn_1670510464342_363754_0.jpg", name: "허윤진")
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
