//
//  HomeView.swift
//  Capella
//
//  Created by YOUJIM on 2/17/24.
//

import SwiftUI


struct HomeView: View {
    
    
    // MARK: Variable
    
    @State var nextView: Bool = false
    
    @StateObject var viewModel = HomeViewModel()
    
    init() {
        self.viewModel.fetchDatas()
    }
    
    // MARK: Body
    
    var body: some View {
        if self.nextView == true {
            FinishCreateView()
        }
        else {
            ZStack() {
                Color.gray10
                
                ScrollView() {
                    ZStack {
                        Image("MainHomeBackgroundImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        VStack {
                            ZStack {
                                Image("NewChatterImage")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                                VStack {
                                    Text("{UserName} 님만의\n새로운 Coffee-Chater를 생성해보세요!")
                                        .multilineTextAlignment(.center)
                                        .font(.pretendard(.bold, size: 20.0))
                                        .foregroundStyle(.white)
                                        .lineSpacing(8)
                                        .padding()
                                    
                                    Button(action: {
                                        nextView = true
                                    }, label: {
                                        Text("나만의 모델 생성하러 가기")
                                            .foregroundStyle(.white)
                                            .font(.pretendard(.semibold, size: 12.0))
                                            .padding(EdgeInsets(top: 8, leading: 26, bottom: 8, trailing: 26))
                                            .background(
                                                RoundedRectangle(cornerRadius: 16, style: .circular)
                                                    .stroke(.white, lineWidth: 1)
                                            )
                                    })
                                }
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 32, trailing: 0))
                            
                            HStack {
                                Text("Capella와의 커피챗")
                                    .font(.pretendard(.bold, size: 20.0))
                                    .foregroundStyle(.white)
                                    .padding(.leading, 24)
                                
                                Spacer()
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
                            
                            HStack {
                                Text("Capella에서 직접 학습시킨 모델과 대화를 나누어보세요!")
                                    .font(.captionText4)
                                    .foregroundStyle(.white)
                                    .padding(.leading, 24)
                                
                                Spacer()
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach($viewModel.capellaList, id: \.self) { model in
                                        cardCellView(cardModel: model)
                                            .onTapGesture {
                                                print("capella\(model.name) selected")
                                            }
                                        Spacer(minLength: 10)
                                    }
                                }
                                .padding(.horizontal, 24)
                                .padding(.vertical, 8)
                            }
                            .frame(width: screenWidth, height: 200)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 22, trailing: 0))
                            
                            HStack {
                                Text("{UserName}의 Coffee-Chatter")
                                    .font(.pretendard(.bold, size: 20.0))
                                    .foregroundStyle(.white)
                                    .padding(.leading, 24)
                                
                                Spacer()
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
                            
                            HStack {
                                Text("{UserName} 님이 직접 제작하신 모델과 대화를 나누어보세요!")
                                    .font(.captionText4)
                                    .foregroundStyle(.white)
                                    .padding(.leading, 24)
                                
                                Spacer()
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach($viewModel.chatterList, id: \.self) { model in
                                        cardCellView(cardModel: model)
                                            .onTapGesture {
                                                print("chatter\(model.name) selected")
                                            }
                                        Spacer(minLength: 10)
                                    }
                                }
                                .padding(.horizontal, 24)
                                .padding(.vertical, 8)
                            }
                            .frame(width: screenWidth, height: 200)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 22, trailing: 0))
                            
                            HStack {
                                Text("최근 진행한 커피챗")
                                    .font(.pretendard(.bold, size: 20.0))
                                    .foregroundStyle(.white)
                                    .padding(.leading, 24)
                                
                                Spacer()
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
                            
                            HStack {
                                Text("{UserName} 님이 최근 진행하신 커피챗들을 모아봤어요.")
                                    .font(.captionText4)
                                    .foregroundStyle(.white)
                                    .padding(.leading, 24)
                                
                                Spacer()
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach($viewModel.recentChattedList, id: \.self) { model in
                                        cardCellView(cardModel: model)
                                            .onTapGesture {
                                                print("chat\(model.name) selected")
                                            }
                                        Spacer(minLength: 10)
                                    }
                                }
                                .padding(.horizontal, 24)
                                .padding(.vertical, 8)
                            }
                            .frame(width: screenWidth, height: 200)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 22, trailing: 0))
                            
                            HStack {
                                Text("최근 생성된 모델")
                                    .font(.pretendard(.bold, size: 20.0))
                                    .foregroundStyle(.white)
                                    .padding(.leading, 24)
                                
                                Spacer()
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
                            
                            HStack {
                                Text("{UserName} 님이 최근 생성하신 커피챗들을 모아봤어요.")
                                    .font(.captionText4)
                                    .foregroundStyle(.white)
                                    .padding(.leading, 24)
                                
                                Spacer()
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach($viewModel.recentlyGeneratedList, id: \.self) { model in
                                        cardCellView(cardModel: model)
                                            .onTapGesture {
                                                print("model\(model.name) selected")
                                            }
                                        Spacer(minLength: 10)
                                    }
                                }
                                .padding(.horizontal, 24)
                                .padding(.vertical, 8)
                            }
                            .frame(width: screenWidth, height: 200)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 22, trailing: 0))
                            
                            Spacer()
                        } // VStack
                    } // ZStack
                    .ignoresSafeArea(.all)
                } // ScrollView
                .offset(y: 108)
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
    
    private struct cardCellView: View {
        
        @Binding var cardModel: CardView
        
        var body: some View {
            ZStack {
                UrlImageView(url: URL(string: cardModel.image)!,
                             size: CGSize(width: 160, height: 200))
                
                Color.black
                    .frame(width: 160, height: 200)
                    .opacity(0.2)
                
                
                VStack {
                    Spacer()
                    Text(cardModel.name)
                        .font(.paragraph4)
                        .foregroundStyle(.white)
                        .padding(.bottom, 16)
                }
                
            }
            .clipShape(.rect(cornerRadius: 10, style: .continuous))
            .shadow(radius: 5)
        }
    }
}

#Preview {
    HomeView()
}
