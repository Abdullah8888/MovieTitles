//
//  MovieRepository.swift
//  MovieTitle
//
//  Created by Abdullah on 17/09/2022.
//

import Foundation

protocol MovieRepositoryProtocol {
    
}

final class MovieRepository: MovieRepositoryProtocol{
    
    private let remoteService: RemoteServiceProtocol
    
    init(remoteService: RemoteServiceProtocol) {
        self.remoteService = remoteService
    }
}

