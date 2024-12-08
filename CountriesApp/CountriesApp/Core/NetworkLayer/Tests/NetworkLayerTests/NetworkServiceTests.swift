//
//  NetworkServiceTests.swift
//  NetworkLayer
//
//  Created by Baher Tamer on 08/12/2024.
//

import Foundation
import Testing
@testable import NetworkLayer

struct NetworkServiceTests {
    // MARK: - Variables
    private var networkService: NetworkService!
    private var endpoint: Endpoint!
    
    // MARK: - Life Cycle
    init() async {
        networkService = await MockNetworkService.shared
        endpoint = MockEndpoint()
    }
    
    // MARK: - Tests
    @Test func successResponse() async throws {
        let result: MockResponse = try await networkService.request(with: endpoint)
        #expect(result.id == 1)
        #expect(result.name == "Test Item")
    }
    
    @Test func failureResponse() async throws {
        do {
            let _: String = try await networkService.request(with: endpoint)
        } catch {
            #expect(error is NetworkError)
        }
    }
}
