//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Sonia AYADI on 05/07/2023.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
