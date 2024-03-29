//
//  CreateModelView.swift
//  Capella
//
//  Created by YOUJIM on 2/17/24.
//

import SwiftUI


enum tones: String, CaseIterable, Equatable {
    case kind
    case gentle
    case humor
    case rude
}

enum answers: String, CaseIterable, Equatable {
    case exact
    case simple
    case complex
}

enum relationship: String, CaseIterable, Equatable {
    case notSelected
    case awkward
    case fan
    case lover
    case family
    case friend
}

struct CreateModelView: View {
    
    @State private var backToPage = false
    @State private var isPhotoButtonSelected = false
    @State private var isInformally = false
    @State private var isCreate = false
    @State private var isNext = false
    
    @ObservedObject private var viewModel = CreateModelViewModel()
    
    var body: some View {
        if self.isNext == true {
            FinishCreateView()
        }
        else {
            ZStack {
                ScrollView {
                    Button(action: {
                        isPhotoButtonSelected.toggle()
                    }, label: {
                        PhotoSelectorView(isPhotoButtonSelected: $isPhotoButtonSelected)
                    })
                    .padding(.bottom, 40)
                    
                    HStack {
                        Text("나의 새로운 Chatter 설정하기")
                            .font(.pretendard(.bold, size: 20.0))
                            .foregroundStyle(.white)
                            .padding(.leading, 24)
                        
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
                    
                    HStack {
                        Text("유진 님의 새로운 Chatter를 커스텀해보세요!")
                            .font(.captionText4)
                            .foregroundStyle(.white)
                            .padding(.leading, 24)
                        
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 32, trailing: 0))
                    
                    HStack {
                        Text("Chatter 이름 설정하기")
                            .font(.title5)
                            .foregroundStyle(.white)
                            .padding(.leading, 24)
                        
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                    
                    HStack {
                        TextField("나의 새로운 Chatter", text: $viewModel.chatterName)
                            .font(.captionText1)
                            .foregroundStyle(.white)
                            .padding(.leading, 24)
                        
                        Spacer()
                    }
                    .padding(.bottom, 4)
                    
                    Rectangle()
                        .foregroundStyle(.gray03)
                        .padding(.leading, 24)
                        .frame(height: 1)
                        .padding(.trailing, 24)
                        .padding(.bottom, 32)
                    
                    HStack {
                        Text("Chatter 역할 설정하기")
                            .font(.title5)
                            .foregroundStyle(.white)
                            .padding(.leading, 24)
                        
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                    
                    HStack {
                        TextField("Ex. 상담사 역할을 해주는 착한 강아지", text: $viewModel.roleName)
                            .font(.captionText1)
                            .foregroundStyle(.white)
                            .padding(.leading, 24)
                        
                        Spacer()
                    }
                    .padding(.bottom, 4)
                    
                    Rectangle()
                        .foregroundStyle(.gray03)
                        .padding(.leading, 24)
                        .frame(height: 1)
                        .padding(.trailing, 24)
                        .padding(.bottom, 32)
                    
                    HStack {
                        Text("Chatter 말투 설정하기")
                            .font(.title5)
                            .foregroundStyle(.white)
                            .padding(.leading, 24)
                        
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                    
                    HStack {
                        ForEach(viewModel.tones, id: \.self) { model in
                            Button(action: {
                                viewModel.tonesSelectedModel = model
                            }) {
                                if model == viewModel.tonesSelectedModel {
                                    Text(model)
                                        .font(.captionText4)
                                        .lineLimit(1)
                                        .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                                        .foregroundStyle(.gray10)
                                        .background(
                                            RoundedRectangle(cornerRadius: 16, style: .circular)
                                                .fill(.white)
                                         )
                                        
                                } else {
                                    Text(model)
                                        .font(.captionText4)
                                        .lineLimit(1)
                                        .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                                        .foregroundStyle(.white)
                                        .background(
                                            RoundedRectangle(cornerRadius: 16, style: .circular)
                                                .stroke(.white, lineWidth: 1)
                                        )
                                }
                            }
                            .padding(.trailing, 8)
                        }
                        Spacer()
                    }
                    .padding(.leading, 24)
                    .padding(.bottom, 32)
                    
                    HStack {
                        Text("Chatter 대답 정확도 설정하기")
                            .font(.title5)
                            .foregroundStyle(.white)
                            .padding(.leading, 24)
                        
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                    
                    HStack {
                        ForEach(viewModel.answers, id: \.self) { model in
                            Button(action: {
                                viewModel.answersSelectedModel = model
                            }) {
                                if model == viewModel.answersSelectedModel {
                                    Text(model)
                                        .font(.captionText4)
                                        .lineLimit(1)
                                        .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                                        .foregroundStyle(.gray10)
                                        .background(
                                            RoundedRectangle(cornerRadius: 16, style: .circular)
                                                .fill(.white)
                                         )
                                } else {
                                    Text(model)
                                        .font(.captionText4)
                                        .lineLimit(1)
                                        .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                                        .foregroundStyle(.white)
                                        .background(
                                            RoundedRectangle(cornerRadius: 16, style: .circular)
                                                .stroke(.white, lineWidth: 1)
                                        )
                                }
                            }
                            .padding(.trailing, 8)
                        }
                        Spacer()
                    }
                    .padding(.leading, 24)
                    .padding(.bottom, 32)
                    
                    HStack {
                        Text("Chatter 대화 난이도 설정하기")
                            .font(.title5)
                            .foregroundStyle(.white)
                            .padding(.leading, 24)
                        
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                    
                    HStack {
                        ForEach(viewModel.conversations, id: \.self) { model in
                            Button(action: {
                                viewModel.conversationsSelectedModel = model
                            }) {
                                if model == viewModel.conversationsSelectedModel {
                                    Text(model)
                                        .font(.captionText4)
                                        .lineLimit(1)
                                        .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                                        .foregroundStyle(.gray10)
                                        .background(
                                            RoundedRectangle(cornerRadius: 16, style: .circular)
                                                .fill(.white)
                                         )
                                } else {
                                    Text(model)
                                        .font(.captionText4)
                                        .lineLimit(1)
                                        .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                                        .foregroundStyle(.white)
                                        .background(
                                            RoundedRectangle(cornerRadius: 16, style: .circular)
                                                .stroke(.white, lineWidth: 1)
                                        )
                                }
                            }
                            .padding(.trailing, 8)
                        }
                        Spacer()
                    }
                    .padding(.leading, 24)
                    .padding(.bottom, 32)
                    
                    HStack {
                        Text("Chatter 관계 설정하기")
                            .font(.title5)
                            .foregroundStyle(.white)
                            .padding(.leading, 24)
                        
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.relationships, id: \.self) { model in
                                Button(action: {
                                    viewModel.relationshipsSelectedModel = model
                                }) {
                                    if model == viewModel.relationshipsSelectedModel {
                                        Text(model)
                                            .font(.captionText4)
                                            .lineLimit(1)
                                            .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                                            .foregroundStyle(.gray10)
                                            .background(
                                                RoundedRectangle(cornerRadius: 16, style: .circular)
                                                    .fill(.white)
                                             )
                                    } else {
                                        Text(model)
                                            .font(.captionText4)
                                            .lineLimit(1)
                                            .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                                            .foregroundStyle(.white)
                                            .background(
                                                RoundedRectangle(cornerRadius: 16, style: .circular)
                                                    .stroke(.white, lineWidth: 1)
                                            )
                                    }
                                }
                                .padding(.trailing, 8)
                            }
                            Spacer()
                        }
                        .padding(.vertical, 1)
                    }
                    .padding(.leading, 24)
                    .padding(.bottom, 32)
                    
                    HStack {
                        Text("추가 옵션 설정하기")
                            .font(.title5)
                            .foregroundStyle(.white)
                            .padding(.leading, 24)
                        
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                    
                    HStack {
                        ForEach(viewModel.extra, id: \.self) { model in
                            Button(action: {
                                viewModel.extraSelectedModel = model
                            }) {
                                if model == viewModel.extraSelectedModel {
                                    Text(model)
                                        .font(.captionText4)
                                        .lineLimit(1)
                                        .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                                        .foregroundStyle(.gray10)
                                        .background(
                                            RoundedRectangle(cornerRadius: 16, style: .circular)
                                                .fill(.white)
                                         )
                                } else {
                                    Text(model)
                                        .font(.captionText4)
                                        .lineLimit(1)
                                        .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                                        .foregroundStyle(.white)
                                        .background(
                                            RoundedRectangle(cornerRadius: 16, style: .circular)
                                                .stroke(.white, lineWidth: 1)
                                        )
                                }
                            }
                            .padding(.trailing, 8)
                        }
                        Spacer()
                    }
                    .padding(.leading, 24)
                    .padding(.bottom, 40)
                    
                    Button(action: {
                        viewModel.setMadeModel(model: CreateModel(
                            name: viewModel.chatterName,
                            role: viewModel.roleName,
                            tone: viewModel.tonesSelectedModel,
                            style: viewModel.answersSelectedModel,
                            readerLevel: viewModel.conversationsSelectedModel,
                            relationship: viewModel.relationshipsSelectedModel == "선택하지 않음" ? nil : viewModel.relationshipsSelectedModel,
                            isInFormal: viewModel.extraSelectedModel == "" ? "INACTIVE" : "ACTIVE",
                            modelCoverImage: viewModel.imageUrl,
                            question: "형님 ... 인생이 힘들어요"))
                        DispatchQueue.main.async {
                            self.isNext = true
                        }
                        
                        
                    }, label: {
                        Text("Chatter 생성하기")
                            .foregroundStyle(.white)
                            .padding(EdgeInsets(top: 16, leading: 128, bottom: 16, trailing: 128))
                            .font(.pretendard(.semibold, size: 14.0))
                            .background(
                                RoundedRectangle(cornerRadius: 8, style: .circular)
                                    .fill(.main01)
                            )
                            
                    })
                    .padding(.bottom, 8)
                    
                    Spacer()
                    
                    Rectangle()
                        .frame(height: 130)
                }
                .offset(y: 108)
                .background(.gray10)
                
                
                
                
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
            }
            .ignoresSafeArea()
            .sheet(isPresented: $isPhotoButtonSelected) {
                PhotoSelectorView(isPhotoButtonSelected: $isPhotoButtonSelected)
            }
            .onTapGesture {
                hideKeyboard()
            }
        }
        
    }
}

#Preview {
    CreateModelView()
}
