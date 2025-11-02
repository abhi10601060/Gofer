//
//  RestError.swift
//  Gofer
//
//  Created by Abhishek Velekar on 02/11/25.
//


import Foundation


enum RestError: LocalizedError{
    case invalidUrl
    case invalidResponse
    case invalidRequestBody
    
    var errorMessage : String{
        switch self {
            case .invalidUrl:
                return "Invalid URL"
            case .invalidResponse:
                return "Invalid Response"
            case .invalidRequestBody:
                return "Invalid Request Body"
        }
    }
    
}
