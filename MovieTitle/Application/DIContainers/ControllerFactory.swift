//
//  ControllerDIContainer.swift
//  MovieTitle
//
//  Created by Abdullah on 17/09/2022.
//

import Foundation

protocol MovieControllerFactoryProtocol {
    
    func makeMovieHomeController() -> MovieHomeController
}

final class MovieControllerFactory: MovieControllerFactoryProtocol {
    
    private let appDependencies: AppDependencies
    
    init(appDependencies: AppDependencies) {
        self.appDependencies = appDependencies
    }
    
    func makeMovieHomeController() -> MovieHomeController {
        let vc = MovieHomeController(view: MovieView())
        vc.viewModel = MovieViewModel(getMoviesUseCase: appDependencies.makeGetMoviesUseCase())
        return vc
    }
}
