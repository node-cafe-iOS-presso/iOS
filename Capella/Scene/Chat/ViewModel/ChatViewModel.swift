//
//  ChatViewModel.swift
//  Capella
//
//  Created by 박민서 on 2/17/24.
//

import Foundation

class ChatViewModel: ObservableObject {
    
    @Published var textFieldValue = ""
    @Published var modelList = ["강아지","Taylor Swift","Linus Torvalds","Ms.Lee"]
    @Published var selectedModel: String = "강아지"
    @Published var chatList: [Chat] = [ ]
    @Published var count:Int = 0
    
    /// 토큰 전송
//    func postAppleToken(token: String) {
//        print("서버로 보냄 : \(token)")
//        self.isLogin = true
//    }
    func postNextChat() {
        if self.selectedModel == "Taylor Swift" {
            self.chatList.append(chatListWithSwift[self.count])
        }
        else if self.selectedModel == "Ms.Lee"{
            self.chatList.append(chatListWithLee[self.count])
        }
        else {
            self.chatList.append(chatListWithDog[self.count])
        }
        
        self.count+=1
        self.textFieldValue = ""
        DispatchQueue.main.asyncAfter(deadline: .now()+Double.random(in: 5...8)) {
            if self.selectedModel == "Taylor Swift" {
                self.chatList.append(chatListWithSwift[self.count])
            }
            else if self.selectedModel == "Ms.Lee"{
                self.chatList.append(chatListWithLee[self.count])
            }
            else {
                self.chatList.append(chatListWithDog[self.count])
            }
            self.count+=1
        }
    }
    
    func clearChat() {
        self.chatList.removeAll()
    }
}
