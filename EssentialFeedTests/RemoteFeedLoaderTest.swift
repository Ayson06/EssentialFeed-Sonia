//
//  RemoteFeedLoaderTest.swift
//  EssentialFeedTests
//
//  Created by Sonia AYADI on 03/07/2023.
//

import XCTest

class RemoteFeedLoader {
    
}

class HTTPClient {
    var requestedURL: URL?
}

class RemoteFeedLoaderTest: XCTestCase {

    func test_init_doesNotRequestDataFromURL(){
        let client = HTTPClient()
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
    
}
