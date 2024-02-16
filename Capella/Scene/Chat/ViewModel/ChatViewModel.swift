//
//  ChatViewModel.swift
//  Capella
//
//  Created by 박민서 on 2/17/24.
//

import Foundation

class ChatViewModel: ObservableObject {
    
    @Published var textFieldValue = ""
    @Published var modelList = ["Taylor Swift","Steve Jobs","xvc","asdff"]
    @Published var selectedModel: String = ""
    @Published var chatList: [Chat] = [
//        Chat(name: "박민서", isMe: true, text: "진짜 뒤질거같아"),
//        Chat(name: "SteveJobs", isMe: false, text: "죽을 거같지? 참아라asdfghjk,mnbvcxsdfghjkl,mnbvc"),
//        Chat(name: "Me", isMe: true, text: "아니 진짜 뒤질거같다니까?")
    ]
    
    /// 토큰 전송
//    func postAppleToken(token: String) {
//        print("서버로 보냄 : \(token)")
//        self.isLogin = true
//    }
}
