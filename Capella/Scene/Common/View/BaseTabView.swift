//
//  TabView.swift
//  Capella
//
//  Created by YOUJIM on 2/17/24.
//

import SwiftUI

struct BaseTabView: View {
    
    @State public var selection = 0
    
    init(selection: Int) {
        self.selection = selection
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = .gray10
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                TabView(selection: $selection) {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("메인")
                                .font(.captionText4)
                        }.tag(0)
                    
                    chatView(selectedModel: "Taylor Swift")
                        .tabItem {
                            Image(systemName: "bubble.left.and.bubble.right.fill")
                            Text("채팅")
                                .font(.captionText4)
                        }.tag(1)
                    
                    MyView()
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("마이")
                                .font(.captionText4)
                        }.tag(2)
                }
                .foregroundStyle(.gray10)
                .tint(.white)
            }
        }
    }
}

#Preview {
    BaseTabView(selection: 0)
}
