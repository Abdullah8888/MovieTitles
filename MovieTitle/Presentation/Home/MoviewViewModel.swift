//
//  MoviewViewModel.swift
//  MovieTitle
//
//  Created by Abdullah on 17/09/2022.
//

import Foundation

class MoviewViewModel {
    
    private let getMoviesUseCase: GetMoviesUseCaseProtocol
    var movie: Variable<[Movie]> = Variable([])
    
    init(getMoviesUseCase: GetMoviesUseCaseProtocol) {
        self.getMoviesUseCase = getMoviesUseCase
    }
    
    func getPopularMovies() {
        
    }
}
