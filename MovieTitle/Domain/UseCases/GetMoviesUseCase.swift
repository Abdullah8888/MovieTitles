//
//  GetMoviesWithTitleUseCase.swift
//  MovieTitle
//
//  Created by Abdullah on 17/09/2022.
//

import Foundation

protocol GetMoviesUseCaseProtocol: AnyObject {
    
}

final class GetMoviesUseCase: GetMoviesUseCaseProtocol {
    
    private let movieRepository: MovieRepositoryProtocol
    
    init(movieRepository: MovieRepositoryProtocol) {
        self.movieRepository = movieRepository
    }
}
