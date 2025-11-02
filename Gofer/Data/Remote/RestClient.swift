//
//  RestClient.swift
//  Gofer
//
//  Created by Abhishek Velekar on 02/11/25.
//

import Foundation
import FactoryKit
import os

class RestClient{
    
    @Injected(\.jsonDecoder) private static var jsonDecoder: JSONDecoder
    @Injected(\.jsonEncoder) private static var jsonEncoder: JSONEncoder 
    private static let logger = Logger(subsystem: "com.app.SwiftuiPractice", category: "network")
    
    static func get <O> (url: String) async throws -> O where O : Codable{
        guard let url = URL(string: url) else {
            throw RestError.invalidUrl
        }
        
        do{
            let (data, status) = try await URLSession.shared.data(from: url)
            logger.debug("GET url:\(url) \n Status:\(status) \n Data:\(String(decoding: data, as: UTF8.self))")
            return try jsonDecoder.decode(O.self, from: data)
        } catch {
            print("RestClient.get: \(error.localizedDescription)")
            throw RestError.invalidResponse
        }
    }
    
    static func post <I, O> (url: String, body: I) async throws -> O where I : Codable, O : Codable{
        guard let url = URL(string: url) else {
            throw RestError.invalidUrl
        }
        
        guard let body = try? jsonEncoder.encode(body) else {
            throw RestError.invalidRequestBody
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return try jsonDecoder.decode(O.self, from: data)
        } catch {
            throw RestError.invalidResponse
        }
        
    }
}
