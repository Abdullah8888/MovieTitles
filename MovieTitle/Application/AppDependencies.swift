//
//  AppDIContainer.swift
//  MovieTitle
//
//  Created by Abdullah on 17/09/2022.
//

import Foundation

protocol AppDependenciesProtocol{
    func makeGetMoviesUseCase() -> GetMoviesUseCaseProtocol
    func makeMovieRepository() -> MovieRepositoryProtocol
    func makeRemoteService() -> RemoteServiceProtocol
}

final class AppDependencies: AppDependenciesProtocol {
    
    
    func makeGetMoviesUseCase() -> GetMoviesUseCaseProtocol {
        GetMoviesUseCase(movieRepository: makeMovieRepository())
    }
    
    func makeMovieRepository() -> MovieRepositoryProtocol {
        MovieRepository(remoteService: makeRemoteService())
    }
    
    func makeRemoteService() -> RemoteServiceProtocol {
        RemoteService()
    }
}
