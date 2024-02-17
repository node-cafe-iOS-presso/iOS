//
//  loginView.swift
//  Capella
//
//  Created by 박민서 on 2/17/24.
//

import SwiftUI
import _AuthenticationServices_SwiftUI

struct loginView: View {
    
    @ObservedObject var viewModel = loginViewModel()
    @State var isPresented = false
    
    var body: some View {
        ZStack {
            Image("Onboarding2")
                .ignoresSafeArea(.all)
            VStack {
                Text("나만의 커피채터로\n내가 원하는 대화를 시작해보세요!")
                    .font(.pretendard(.semibold, size: 22))
                    .lineSpacing(6)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                
                Image("SwiftAndJobs")
                    .resizable()
                    .frame(width: 322.75, height: 299.66)
                    .padding(.top, 40)
                    .padding(.bottom, 80)
                
                SignInWithAppleButton(
                    onRequest: { request in
                        let appleIDProvider = ASAuthorizationAppleIDProvider()
                        let request = appleIDProvider.createRequest()
                        request.requestedScopes = [.fullName, .email]
                    },
                    onCompletion: { result in
                        // 애플 로그인 완료 후 처리
                        switch result {
                        case .success(let authResults):
                            // 로그인 성공
                            guard let appleIDCredential = authResults.credential as? ASAuthorizationAppleIDCredential else { return }
                            print("Authentication successful: \(appleIDCredential.user)")
                            
                            // token POST
                            viewModel.postAppleToken(token: appleIDCredential.user)
                            
                        case .failure(let error):
                            // 로그인 실패
                            print("Error occurred: \(error.localizedDescription)")
                        }
                    }
                )
                .frame(width: 345, height: 50)
                .cornerRadius(8)
                .signInWithAppleButtonStyle(.white)
                .fullScreenCover(isPresented: $viewModel.isLogin ){
                    BaseTabView(selection: 0)// 다음 화면 넘어가기
                }
            }//: Vstack
        }
        .onAppear() {
            // printAll()
        }//: ZStack
        
    }
}

struct nextView: View {
    var body: some View {
        Color.blue
    }
}

#Preview {
    loginView()
}
