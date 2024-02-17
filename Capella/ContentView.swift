//
//  ContentView.swift
//  Capella
//
//  Created by YOUJIM on 2/16/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showMainView = false
    
    var body: some View {
        ZStack {
            if showMainView {
                BaseTabView(selection: 0)
            } else {
                ZStack {
                    Image("SplashImage")
                        .resizable()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            showMainView = true
                        }
                    }
                }
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
