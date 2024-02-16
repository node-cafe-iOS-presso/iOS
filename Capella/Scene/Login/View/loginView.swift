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
                    .font(.pretendard(.semibold, size: 18))
                    .lineSpacing(6)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                
                Image("SwiftAndJobs")
                    .padding(.top, 40)
                    .padding(.bottom, 80)
                
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
                            // token POST
                            viewModel.postAppleToken(token: authResults.credential.description)
                            
                        case .failure(let error):
                            // 로그인 실패
                            print("Error occurred: \(error.localizedDescription)")
                        }
                    }
                )
                .onTapGesture { // Test용
                    viewModel.postAppleToken(token: "test")
                }
                .frame(width: 345, height: 50)
                .cornerRadius(12)
                .signInWithAppleButtonStyle(.white)
                .fullScreenCover(isPresented: $viewModel.isLogin ){
                    nextView()// 다음 화면 넘어가기
                }

            }//: Vstack
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
