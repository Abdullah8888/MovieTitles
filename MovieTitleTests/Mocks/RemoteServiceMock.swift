//
//  RemoteServiceMock.swift
//  MovieTitleTests
//
//  Created by Abdullah on 21/09/2022.
//

import Foundation
@testable import MovieTitle

/// RemoteServiceMock
final class RemoteServiceMock: RemoteServiceProtocol {
    
    private var data = Data("".utf8)
    
    func fetch<T>(pathUrl: String, type: T.Type, page: Int, completionHandler completion: @escaping (Result<T, ErrorModel>) -> Void) where T : Decodable, T : Encodable {
        do {
            let decodedResponse = try JSONDecoder().decode(type.self, from: data)
            completion(.success(decodedResponse))
        }
        catch {
            completion(.failure(ErrorModel(message: "Unable to decode data")))
        }
    }
    
    
    func makeSuccessData() {
        let stringData = "{\"results\":[{\"id\":985939,\"overview\":\"For best friends Becky and Hunter, life is all about conquering fears and pushing limits. But after they climb 2,000 feet to the top of a remote, abandoned radio tower, they find themselves stranded with no way down. Now Becky and Hunter’s expert climbing skills will be put to the ultimate test as they desperately fight to survive the elements, a lack of supplies, and vertigo-inducing heights\",\"poster_path\":\"/9f5sIJEgvUpFv0ozfA6TurG4j22.jpg\",\"title\":\"Fall\"}]}"
        data = Data(stringData.utf8)
    }
    
    func makeFailData() {
        data = Data("fail".utf8)
    }
    
}
