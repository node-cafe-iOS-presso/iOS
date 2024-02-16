//
//  AppleLogin.swift
//  Capella
//
//  Created by 박민서 on 2/16/24.
//

import SwiftUI
import AuthenticationServices

struct SignInWithAppleButtonView: UIViewRepresentable {
    typealias UIViewType = UIView
    
    func makeUIView(context: Context) -> UIView {
        // 해당 UIView 생성시 실행
        return ASAuthorizationAppleIDButton()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
        // 해당 UIView 화면 업데이트시
    }
}

struct LoginTestView_UIKit: View {
    var body: some View {
        SignInWithAppleButtonView()
            .frame(width: 280, height: 60, alignment: .center)
            .onTapGesture { self.showAppleLogin() }
    }

    private func showAppleLogin() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        
        request.requestedScopes = [.email, .fullName]

        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.performRequests()
    }
}

// MARK : ----- 또는 -----

struct LoginTestView_SwiftUI: View {
    var body: some View {
        SignInWithAppleButton(
            onRequest: { request in
                // 애플 로그인 요청 설정
            },
            onCompletion: { result in
                // 애플 로그인 완료 후 처리
                switch result {
                case .success(let authResults):
                    // 로그인 성공
                    print("Authentication successful: \(authResults)")
                case .failure(let error):
                    // 로그인 실패
                    print("Error occurred: \(error.localizedDescription)")
                }
            }
        )
        .frame(width: 280, height: 60)
        .cornerRadius(12)
    }
}
