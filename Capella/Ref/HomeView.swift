//
//  HomeView.swift
//  Capella
//
//  Created by YOUJIM on 2/17/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack() {
            Color.gray10
            
            ScrollView() {
                ZStack {
                    Image("MainHomeBackgroundImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    VStack {
                        
                        
                        Spacer()
                    }
                } // ZStack
                .ignoresSafeArea(.all)
            } // ScrollView
            .ignoresSafeArea(.all)
            
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: screenWidth, height: 108)
                        .foregroundStyle(.gray10)
                    
                    Image("TabBarLogo")
                        .resizable()
                        .frame(width: 127, height: 24)
                        .offset(x: -108, y: 24)
                } // ZStack
                
                Spacer()
            }
        } // ZStack
        .ignoresSafeArea(.all)
        
    }
}

#Preview {
    HomeView()
}
