//
//  APIConstant.swift
//  Capella
//
//  Created by 박민서 on 2/17/24.
//


import Foundation


struct Constant {
    static let baseURL = "https://api-dev-v2.mappilogue.shop"
    
    static let createUser = "/user"
    static func getFindUser(token: String) -> String {
        return "/user/:\(token)"
    }
    static func patchUpdateProfile(id: String) -> String {
        return "/user/:\(id)"
    }
}

