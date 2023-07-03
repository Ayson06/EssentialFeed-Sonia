//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Sonia AYADI on 03/07/2023.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error (Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
