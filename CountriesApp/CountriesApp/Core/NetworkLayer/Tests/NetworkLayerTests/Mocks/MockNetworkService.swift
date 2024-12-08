//
//  MockNetworkService.swift
//  NetworkLayer
//
//  Created by Baher Tamer on 08/12/2024.
//

import Foundation
@testable import NetworkLayer

@NetworkActor
final class MockNetworkService: NetworkService {
    // MARK: - Singleton
    public static let shared = MockNetworkService()
    private init() {}
    
    // MARK: - Base Functions
    public func request<T: Decodable & Sendable>(with endpoint: Endpoint) async throws -> T {
        let data = """
        {
            "id": 1,
            "name": "Test Item"
        }
        """.data(using: .utf8)!
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }
}
