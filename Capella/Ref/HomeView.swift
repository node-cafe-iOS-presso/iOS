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
                ZStack() {
                    Image("MainHomeBackgroundImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    VStack() {
                        
                    }
                } // ZStack
            } // ScrollView
            .ignoresSafeArea(.all)
        } // ZStack
        .ignoresSafeArea(.all)
        
    }
}

#Preview {
    HomeView()
}
