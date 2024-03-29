//
//  chatView.swift
//  Capella
//
//  Created by 박민서 on 2/17/24.
//

import SwiftUI

struct chatView: View {
    
    init(selectedModel: String) {
        self.viewModel.selectedModel = selectedModel
    }
    @ObservedObject var viewModel = ChatViewModel()
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .frame(width: screenWidth, height: 108)
                        .foregroundStyle(.gray10)
                    Text(viewModel.selectedModel)
                        .font(.paragraph1)
                        .foregroundStyle(.white)
                        .offset(y:35)
                    Divider()
                        .background(.gray09)
                        .offset(y:55)
                }
                
            } // 상단 바
            
            ZStack(alignment: .top) {
                Image("MainBackgroundImage")
                    .resizable()
                
                ScrollViewReader { proxy in
                    ScrollView {
                        VStack {
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(viewModel.modelList, id: \.self) { model in
                                        Button(action: {
                                            viewModel.selectedModel = model
                                            viewModel.clearChat()
                                        }) {
                                            if model == viewModel.selectedModel {
                                                Text(model)
                                                    .font(.captionText4)
                                                    .lineLimit(1)
                                                    .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                                                    .foregroundStyle(.gray10)
                                                    .background(
                                                        RoundedRectangle(cornerRadius: 16, style: .circular)
                                                            .fill(.white)
                                                            .background(in: .capsule, fillStyle: .init())
                                                            
                                                    )
                                            } else {
                                                Text(model)
                                                    .font(.captionText4)
                                                    .lineLimit(1)
                                                    .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                                                    .foregroundStyle(.white)
                                                    .background(
                                                        RoundedRectangle(cornerRadius: 16, style: .circular)
                                                            .stroke(.white, lineWidth: 1)
                                                    )
                                            }
                                            
                                        }
                                        Spacer(minLength: 8)
                                    }
                                }
                                .padding(.horizontal, 24)
                                .padding(.vertical, 1)
                            }
                            
                            if viewModel.chatList.isEmpty {
                                Spacer(minLength: 200)
                                Text("첫번째 채팅으로 대화를 시작하세요")
                                    .font(.captionText2)
                                    .lineLimit(1)
                                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                                    .foregroundStyle(.white)
                                    .background(
                                        RoundedRectangle(cornerRadius: 16, style: .circular)
                                            .stroke(.white, lineWidth: 1)
                                            .background(in: .capsule, fillStyle: .init())
                                    )
                                Spacer()
                            } else {
                                ForEach(viewModel.chatList, id: \.self) { chat in
                                    chatCellView(
                                        isMe: chat.isMe,
                                        name: chat.name,
                                        subName: chat.isMe ? "Me" : "Coffee-Chatter",
                                        text: chat.text)
                                }
                            }
                            
                        
                            
                        }
                        .padding(.vertical, 15)
                        .id("endOfChat")
                        
                        

                    }
                    
                    ZStack {
                        TextField("채팅 내용 입력하기", text: $viewModel.textFieldValue)
                            .font(.paragraph4)
                            .padding(EdgeInsets(top: 16, leading: 12, bottom: 16, trailing: 52))
                            .foregroundStyle(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 20, style: .circular)
                                    .foregroundStyle(.gray10)
                            )
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                print("tap")
                                viewModel.postNextChat()
                                proxy.scrollTo("endOfChat", anchor: .bottom)
                            }, label: {
                                ZStack {
                                    Circle()
                                        .frame(width: 28, height: 28)
                                        .foregroundStyle(viewModel.textFieldValue.isEmpty ? .gray07 : .main01)
                                    Image(systemName: "arrow.up")
                                        .foregroundStyle(.gray10)
                                }
                                
                            })
                            .padding(.trailing, 12)
                            .padding(.bottom, 1)
                        }
                    } // 텍스트필드 끝
                        .padding(.horizontal, 24)
                        .background(.gray10)
                }
            }
            .ignoresSafeArea()
            .background(.gray10)
            
        }
        .ignoresSafeArea()
        .background(.gray10)
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    private struct chatCellView: View {
        
        var isMe: Bool
        var name: String
        var subName: String
        var text: String
        
        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                
                HStack {
                    if isMe {
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Spacer()
                                Text(self.name)
                                    .font(.captionText1)
                                    .foregroundStyle(.white)
                            }
                            HStack {
                                Spacer()
                                Text(self.subName)
                                    .font(.captionText4)
                                    .foregroundStyle(.gray06)
                            }
                        }
                        
                        Image("SwiftAndJobs")
                            .resizable()
                            .frame(width: 44, height: 44)
                            .aspectRatio(contentMode: .fit)
                            .background(.white)
                            .clipShape(Circle())
                    }
                    else {
                        Image("SwiftAndJobs")
                            .resizable()
                            .frame(width: 44, height: 44)
                            .aspectRatio(contentMode: .fit)
                            .background(.white)
                            .clipShape(Circle())
                            
                        VStack(alignment: .leading) {
                            Text(self.name)
                                .font(.captionText1)
                                .foregroundStyle(.white)
                            Text(self.subName)
                                .font(.captionText4)
                                .foregroundStyle(.gray06)
                        }
                        Spacer()
                    }
                } // HStack
                .padding(.top, 12)
                .padding(.leading, 24)
                .padding(.bottom, 12)
                .padding(.trailing, 24)
                
                HStack {
                    if isMe {
                        Spacer()
                    }
                    
                    Text(self.text)
                        .font(.pretendard(.bold, size: 15))
                        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
                        .foregroundStyle(.main04)
                        .background(
                            RoundedRectangle(cornerRadius: 15, style: .circular)
                                .foregroundStyle(.white)
                        )
                        .padding(.leading, 24)
                        .padding(.trailing, 24)
                }
                
            }
        }
    }
}

#Preview {
    BaseTabView(selection: 0)
}
