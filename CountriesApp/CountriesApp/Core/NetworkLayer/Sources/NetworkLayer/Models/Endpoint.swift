//
//  Endpoint.swift
//  CountriesApp
//
//  Created by Baher Tamer on 25/11/2024.
//

import Foundation

public protocol Endpoint: Sendable {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var body: [String: Any]? { get }
    var queryParams: [String: String]? { get }
}

// MARK: - Config Variables
public extension Endpoint {
    var headers: [String: String]? { nil }
    var body: [String: Any]? { nil }
    var queryParams: [String: String]? { nil }

    private var baseURL: URL {
        guard
            let url = URL(string: "https://" + NetworkConfig.baseURL)
        else {
            fatalError("Base URL is not valid.")
        }

        return url
    }

    private var requestURL: URL {
        baseURL.appendingPathComponent(path)
    }
}

// MARK: - Core Functions
extension Endpoint {
    func asURLRequest() throws -> URLRequest {
        var request = createBaseRequest()
        setRequestMethod(&request)
        setRequestHeaders(&request)
        try setRequestBody(&request)
        setRequestQueryParams(&request)
        return request
    }
}

// MARK: - Private Helpers
extension Endpoint {
    private func createBaseRequest() -> URLRequest {
        URLRequest(url: requestURL)
    }

    private func setRequestMethod(_ request: inout URLRequest) {
        request.httpMethod = method.rawValue
    }

    private func setRequestHeaders(_ request: inout URLRequest) {
        request.allHTTPHeaderFields = headers
    }

    private func setRequestBody(_ request: inout URLRequest) throws {
        guard let body else { return }
        request.httpBody = try JSONSerialization.data(
            withJSONObject: body,
            options: []
        )
    }

    private func setRequestQueryParams(_ request: inout URLRequest) {
        guard let queryParams else { return }
        var components = URLComponents(
            url: requestURL,
            resolvingAgainstBaseURL: false
        )
        components?.queryItems = mapQueryItems(from: queryParams)
        if let urlWithParams = components?.url {
            request.url = urlWithParams
        }
    }

    private func mapQueryItems(from queryParams: [String: String]) -> [URLQueryItem] {
        queryParams.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
    }
}
