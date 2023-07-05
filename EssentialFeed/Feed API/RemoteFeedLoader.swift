//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Sonia AYADI on 03/07/2023.
//

import Foundation

public final class RemoteFeedLoader {
    
    private let url: URL
    private let client: HTTPClient

    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public enum Result: Equatable {
        case success([FeedItem])
        case failure(Error)
    }
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Result) -> Void){
        client.get(from: url) { result in
            switch result {
                case let .success(data, response):
                do {
                    let items = try FeedItemsMapper.map(data, response)
                    return completion(.success(items))
                } catch {
                    return completion(.failure(.invalidData))
                }
                case .failure:
                    completion(.failure(.connectivity))
            }
        }
    }
    
    private func map(_ data: Data, from response: HTTPURLResponse) -> Result {
        do {
            let items = try FeedItemsMapper.map(data, response)
            return .success(items)
        } catch {
            return .failure(.invalidData)
        }
    }
}
