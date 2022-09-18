//
//  GetMoviesWithTitleUseCase.swift
//  MovieTitle
//
//  Created by Abdullah on 17/09/2022.
//

import Foundation

protocol GetMoviesUseCaseProtocol: AnyObject {
    func getMovies(page: Int, completion: @escaping (Result<MovieResponse, ErrorModel>) -> Void)
}

final class GetMoviesUseCase: GetMoviesUseCaseProtocol {

    private let movieRepository: MovieRepositoryProtocol
    
    init(movieRepository: MovieRepositoryProtocol) {
        self.movieRepository = movieRepository
    }
    
    func getMovies(page: Int, completion: @escaping (Result<MovieResponse, ErrorModel>) -> Void) {
        movieRepository.getMovies(page: page, completion: completion)
    }
}
