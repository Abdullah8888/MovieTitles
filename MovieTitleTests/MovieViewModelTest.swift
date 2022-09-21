//
//  MovieViewModelTest.swift
//  MovieTitleTests
//
//  Created by Abdullah on 21/09/2022.
//

import Foundation
import XCTest
@testable import MovieTitle

class MovieViewModelTest: XCTestCase {
    
    func test_movies_count() {
        let expectation = self.expectation(description: #function)
        let sut = makSut()
        let recorder = Recorder<MovieResponse>()
        recorder.on(valueSubject: sut.movieResponse)
        sut.getMovies()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now(), execute: {
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(recorder.value?.results?.count, 1)
    }
    
    func test_undecoded_movie_data() {
        let expectation = self.expectation(description: #function)
        let sut = makSut(withSuccessData: false)
        let recorder = Recorder<ErrorModel>()
        recorder.on(errorValueSubject: sut.errorHandler)
        sut.getMovies()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now(), execute: {
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 1)
        XCTAssertNotNil(recorder.error?.message)
    }
    
    func makSut(withSuccessData: Bool = true) -> MovieViewModel {
        let remoteServiceMock = RemoteServiceMock()
        withSuccessData ? remoteServiceMock.makeSuccessData() : remoteServiceMock.makeFailData()
        let movieRepository = MovieRepository(remoteService: remoteServiceMock)
        let getMoviesUseCase = GetMoviesUseCase(movieRepository: movieRepository)
        let movieViewModel = MovieViewModel(getMoviesUseCase: getMoviesUseCase)
        return movieViewModel
        
    }
}
