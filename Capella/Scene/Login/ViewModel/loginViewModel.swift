//
//  loginViewModel.swift
//  Capella
//
//  Created by 박민서 on 2/17/24.
//

import Foundation

class loginViewModel: ObservableObject {
    
    /// 로그인 상태 확인
    @Published var isLogin: Bool = false
    
    /// 토큰 전송
    func postAppleToken(token: String) {
        APIManager.shared.postData(
            urlEndpointString: Constant.createUser,
            responseDataType: CreateUserResponseModel?.self,
            requestDataType: CreateUserRequestModel.self,
            parameter: CreateUserRequestModel(token: token, name: "유진")) { response in
                print(response!)
                
                UserDefaults.standard.set(response?.token!, forKey: "UserIdentifier")
                UserDefaults.standard.set(response?.name!, forKey: "UserName")
            }
        
        self.isLogin = true
    }
}
