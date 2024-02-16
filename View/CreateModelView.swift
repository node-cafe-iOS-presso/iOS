//
//  CreateModelView.swift
//  Capella
//
//  Created by YOUJIM on 2/17/24.
//

import SwiftUI

struct CreateModelView: View {
    
    
    @State private var backToPage = false
    
    var body: some View {
        ZStack {
            ScrollView {
                
            }
            
            
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: screenWidth, height: 108)
                        .foregroundStyle(.gray10)
                    
                    Button("", systemImage: "chevron.left") {
                        self.backToPage.toggle()
                    }
                    .foregroundStyle(.white)
                    .offset(x: -168, y: 24)
                } // ZStack
                
                Spacer()
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    CreateModelView()
}
