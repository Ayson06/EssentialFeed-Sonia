//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Sonia AYADI on 03/07/2023.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
