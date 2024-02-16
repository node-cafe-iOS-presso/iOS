//
//  FinishCreateView.swift
//  Capella
//
//  Created by YOUJIM on 2/17/24.
//

import SwiftUI

struct FinishCreateView: View {
    
    
    @State private var startConversation = false
    @State private var backHome = false
    @State private var postChatter = false
    
    
    var body: some View {
        ZStack {
            Image("DefaultImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: screenWidth, height: screenHeight)
            
            Rectangle()
                .frame(width: screenWidth, height: screenHeight)
                .opacity(0.6)
            
            VStack {
                Rectangle()
                    .frame(width: screenWidth,height: 280)
                    .foregroundStyle(.clear)
                
                Text("이길여")
                    .font(.title1)
                    .foregroundStyle(.white)
                    .padding(.bottom, 8)
                
                Text("Chatter가 생성되었어요!\n지금 바로 운명적인 대화를 시작해볼까요?")
                    .multilineTextAlignment(.center)
                    .font(.paragraph1)
                    .foregroundStyle(.white)
                    .lineSpacing(4)
                    .padding(.bottom, 32)
                
                
                // TODO: 화면 전환 및 데이터 연결 필요
                
                Button(action: {
                    self.startConversation.toggle()
                }, label: {
                    Text("운명적인 대화 시작하기")
                        .foregroundStyle(.black)
                        
                        .padding(EdgeInsets(top: 16, leading: 108, bottom: 16, trailing: 108))
                        .font(.pretendard(.semibold, size: 14.0))
                        .background(
                            RoundedRectangle(cornerRadius: 8, style: .circular)
                        )
                        .tint(.white)
                        
                })
                .padding(.bottom, 8)
                
                Button(action: {
                    self.backHome.toggle()
                }, label: {
                    Text("홈으로 돌아가기")
                        .foregroundStyle(.white)
                        
                        .padding(EdgeInsets(top: 16, leading: 128, bottom: 16, trailing: 128))
                        .font(.pretendard(.semibold, size: 14.0))
                        .background(
                            RoundedRectangle(cornerRadius: 8, style: .circular)
                        )
                        .tint(.gray04)
                })
                .padding(.bottom, 8)
                
                Button(action: {
                    self.postChatter.toggle()
                }, label: {
                    Text("내가 만든 Chatter 게시하기")
                        .foregroundStyle(.white)
                        .padding(EdgeInsets(top: 16, leading: 94, bottom: 16, trailing: 94))
                        .font(.pretendard(.semibold, size: 14.0))
                        .background(
                            RoundedRectangle(cornerRadius: 8, style: .circular)
                                .stroke(.white, lineWidth: 1)
                        )
                        .tint(.clear)
                })
                .padding(.bottom, 8)
            } // VStack
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    FinishCreateView()
}
