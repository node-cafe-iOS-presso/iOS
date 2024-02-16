//
//  TabView.swift
//  Capella
//
//  Created by YOUJIM on 2/17/24.
//

import SwiftUI

struct BaseTabView: View {
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = .gray10
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("메인")
                                .font(.captionText4)
                        }
                    
                    ChatView()
                        .tabItem {
                            Image(systemName: "bubble.left.and.bubble.right.fill")
                            Text("채팅")
                                .font(.captionText4)
                        }
                    
                    MyView()
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("마이")
                                .font(.captionText4)
                        }
                }
                .foregroundStyle(.gray10)
            .tint(.white)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    BaseTabView()
}
