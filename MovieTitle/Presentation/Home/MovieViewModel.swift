//
//  MoviewViewModel.swift
//  MovieTitle
//
//  Created by Abdullah on 17/09/2022.
//

import Foundation
import RxSwift

class MovieViewModel {
    
    private let getMoviesUseCase: GetMoviesUseCaseProtocol
    var movieResponse: PublishSubject<MovieResponse> = PublishSubject<MovieResponse>()
    var errorHandler: PublishSubject<ErrorModel> = PublishSubject<ErrorModel>()
    //let error: Variable<ErrorModel?> = Variable(nil)
    init(getMoviesUseCase: GetMoviesUseCaseProtocol) {
        self.getMoviesUseCase = getMoviesUseCase
    }
    
    func getMovies(page: Int = 1) {
        getMoviesUseCase.getMovies(page: page) { result in
            switch result {
            case .success(let res):
                self.movieResponse.onNext(res)
            case .failure(let err):
                self.errorHandler.onNext(err)
            }
        }
    }
}
