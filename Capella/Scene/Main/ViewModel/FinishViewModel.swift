//
//  FinishViewModel.swift
//  Capella
//
//  Created by 박민서 on 2/17/24.
//


import Foundation

class FinishViewModel: ObservableObject {
    
    @Published var model: CreateModel?
    
    init() {
        if let savedData = UserDefaults.standard.data(forKey: "setMadeModel") {
            if let loadedStruct = try? JSONDecoder().decode(CreateModel.self, from: savedData) {
//                print("Loaded struct: \(loadedStruct)")
                self.model = loadedStruct
            }
        }
    }
    
    func makeModel() {
        APIManager.shared.postData(
            urlEndpointString: Constant
            .postCreateModel,
            responseDataType: CreateResponseModel.self, 
            requestDataType: CreateModel.self,
            parameter: self.model) { result in
                print(result)
            }
    }
    
}
