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
        print("서버로 보냄 : \(token)")
        self.isLogin = true
    }
}
