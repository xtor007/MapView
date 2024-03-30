//
//  MainViewNetworkHelper.swift
//  MapView
//
//  Created by Anatoliy Khramchenko on 30.03.2024.
//

import Foundation

class MainViewNetworkHelper {
    
    private let networkManager = NetworkManager()
    
    private var lastId = 0
    
    private var isRequestPossible = true
    
    func fetchDataIfPossible(_ callback: @escaping ([ProcessedAgentData]) -> Void) {
        guard isRequestPossible else {
            return
        }
        isRequestPossible = false
        Task {
            do {
                let data = try await fetchData()
                DispatchQueue.main.async {
                    callback(data)
                }
            } catch {
                print(error)
            }
        }
    }
    
    private func fetchData() async throws -> [ProcessedAgentData] {
        guard let url = URL(string: Config.serverURL) else {
            throw MainViewNetworkError.failedURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        var data: [ProcessedAgentData] = try await networkManager.makeRequest(request)
        data = data.filter({ $0.id > lastId })
        
        if let lastId = data.map({ $0.id }).max() {
            self.lastId = lastId
        }
        isRequestPossible = true
        return data
    }
    
}

enum MainViewNetworkError: Error {
    case failedURL
}
