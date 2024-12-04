//
//  RESTNetworkService.swift
//  CountriesApp
//
//  Created by Baher Tamer on 25/11/2024.
//

import Foundation

@NetworkActor
public final class RESTNetworkService: NetworkService {
    // MARK: - Singleton
    public static let shared = RESTNetworkService()
    private init() {}
    
    // MARK: - Base Functions
    public func request<T: Decodable & Sendable>(with endpoint: Endpoint) async throws -> T {
        let request = try createURLRequest(from: endpoint)
        let (data, response) = try await fetchData(with: request)
        try validateResponse(response)
        return try decodeData(data, to: T.self)
    }
}

// MARK: - Private Helpers
extension RESTNetworkService {
    private func createURLRequest(from endpoint: Endpoint) throws -> URLRequest {
        do {
            return try endpoint.asURLRequest()
        } catch {
            throw NetworkError.invalidURL
        }
    }
    
    private func fetchData(with request: URLRequest) async throws -> (Data, URLResponse) {
        do {
            return try await URLSession.shared.data(for: request)
        } catch {
            throw NetworkError.unknown
        }
    }
    
    private func validateResponse(_ response: URLResponse) throws {
        guard
            let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode
        else {
            throw NetworkError.invalidResponse
        }
    }
    
    private func decodeData<T: Decodable>(_ data: Data, to type: T.Type) throws -> T {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }
}

extension Data {
    var prettyPrintedJSONString: NSString? {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: jsonObject,
                                                       options: [.prettyPrinted]),
              let prettyJSON = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else {
                  return nil
               }

        return prettyJSON
    }
}
