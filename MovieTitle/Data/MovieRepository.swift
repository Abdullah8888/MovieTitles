//
//  MovieRepository.swift
//  MovieTitle
//
//  Created by Abdullah on 17/09/2022.
//

import Foundation

protocol MovieRepositoryProtocol {
    func getMovies(page: Int, completion: @escaping (Result<MovieResponse, ErrorModel>) -> Void)
}

final class MovieRepository: MovieRepositoryProtocol{
    
    private let remoteService: RemoteServiceProtocol
    
    init(remoteService: RemoteServiceProtocol) {
        self.remoteService = remoteService
    }
    
    func getMovies(page: Int, completion: @escaping (Result<MovieResponse, ErrorModel>) -> Void) {
        remoteService.fetch(pathUrl: .popularMoviesPathUrl, type: MovieResponse.self, page: page) { result in
            switch result {
            case .success(let res):
                completion(.success(res))
            case .failure(let error):
                completion(.failure(ErrorModel(message: error.message)))
            }
        }
    }
}

