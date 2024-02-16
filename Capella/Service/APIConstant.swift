//
//  APIConstant.swift
//  Capella
//
//  Created by 박민서 on 2/17/24.
//


import Foundation


struct Constant {
    static let baseURL = "https://api-dev-v2.mappilogue.shop"
    
    static let model = "/model"
    
    static let postCreateModel = model
    static let getLoadAllModels = model
    
    static func getLoadUsersModels(userId: Int) -> String  {
        return "\(model)/user/\(userId)"
    }
    
    static func getLoadModelsById(modelId: Int) -> String  {
        return "\(model)/id/\(modelId)"
    }
    
    // 추후 추가
//    static func patch(modelId: Int) -> String  {
//        return "\(model)/id/\(modelId)"
//    }
    
//    static func deletemodel
   
}

