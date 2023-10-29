//
//  NetworkClientBuilder.swift
//  ShortLink
//
//  Created by Eder  Padilla on 26/10/23.
//

import Foundation

extension URLSession {
    
    func post<T: Decodable, E: Encodable>(_ data: E) async throws -> T {
        var request = URLRequest(url: BuildConfig.environment)
        request.httpMethod = NetworkRequest.post.rawValue
        request.timeoutInterval = 15
        request.addValue(NetworkRequest.application.rawValue, forHTTPHeaderField: NetworkRequest.contentType.rawValue)
        
        do {
            let encoder = JSONEncoder()
            request.httpBody = try encoder.encode(data)
        } catch {
            throw NetworkError.invalidRequestData
        }
        
        do {
            let (responseData, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.noInternetConnection
            }
            
            guard httpResponse.statusCode == NetworkError.successCode else {
                throw NetworkError.invalidStatusCode
            }
            
            let decoder = JSONDecoder()
            let responseDecoded = try decoder.decode(T.self, from: responseData)
            return responseDecoded
        } catch {
            if let urlError = error as? URLError, urlError.code == .timedOut {
                throw NetworkError.timeout
            } else {
                throw NetworkError.invalidResponse
            }
        }
    }
    
    func fetch<T: Decodable>(endopoint: String) async throws -> T {
        
        var request = URLRequest(url: BuildConfig.environment)
        request.timeoutInterval = 15
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.noInternetConnection
        }
        
        guard httpResponse.statusCode == NetworkError.successCode else {
            throw NetworkError.invalidStatusCode
        }
        
        do {
            let decoder = JSONDecoder()
            let responseDecoded = try decoder.decode(T.self, from: data)
            return responseDecoded
        } catch {
            if let urlError = error as? URLError, urlError.code == .timedOut {
                throw NetworkError.timeout
            } else {
                throw NetworkError.invalidResponse
            }
        }
    }
}

enum NetworkRequest: String {
    case post = "POST"
    case get = "GET"
    case application = "application/json"
    case contentType = "Content-Type"
}

enum NetworkError: Error {
    static let successCode = 200
    case invalidResponse
    case invalidRequestData
    case timeout
    case invalidStatusCode
    case noInternetConnection
}
