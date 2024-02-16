//
//  chatView.swift
//  Capella
//
//  Created by 박민서 on 2/17/24.
//

import SwiftUI

struct Chat: Codable, Hashable {
    var name: String
    var isMe: Bool
    var text: String
}

struct chatView: View {
    
    @State var textList = ["asdf","afsf","xvc","asdff"]
    @State var chatList = [
        Chat(name: "박민서", isMe: true, text: "진짜 뒤질거같아"),
        Chat(name: "SteveJobs", isMe: false, text: "죽을 거같지? 참아라asdfghjk,mnbvcxsdfghjkl,mnbvc"),
        Chat(name: "Me", isMe: true, text: "아니 진짜 뒤질거같다니까?")
    ]
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
                ZStack(alignment: .top) {
                    Image("MainBackgroundImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    ScrollView {
                        VStack {
                            ForEach(chatList, id: \.self) { chat in
                                chatCellView(
                                    isMe: chat.isMe,
                                    name: chat.name,
                                    subName: chat.isMe ? "Me" : "Coffee-Chatter",
                                    text: chat.text)
                            }
                            ForEach(chatList, id: \.self) { chat in
                                chatCellView(
                                    isMe: chat.isMe,
                                    name: chat.name,
                                    subName: chat.isMe ? "Me" : "Coffee-Chatter",
                                    text: chat.text)
                            }
                            ForEach(chatList, id: \.self) { chat in
                                chatCellView(
                                    isMe: chat.isMe,
                                    name: chat.name,
                                    subName: chat.isMe ? "Me" : "Coffee-Chatter",
                                    text: chat.text)
                            }
                        }
                        .padding(.vertical, 15)
                    }
                    
                }
                .offset(y:108)
            
            

            VStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .frame(width: screenWidth, height: 108)
                        .foregroundStyle(.gray10)
                    Text("Steve Jobs")
                        .font(.paragraph1)
                        .foregroundStyle(.white)
                        .offset(y:35)
                }
                Divider()
                    .background(.gray09)
                Spacer()
            } // 상단 바
        }
        .ignoresSafeArea(.container)
        .background(.gray10)
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
    chatView()
}
