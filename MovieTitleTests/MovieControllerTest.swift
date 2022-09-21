//
//  MovieControllerTest.swift
//  MovieTitleTests
//
//  Created by Abdullah on 21/09/2022.
//

import Foundation
import XCTest
@testable import MovieTitle

class MovieControllerTest: XCTestCase {
    
    func test_number_of_rows() {
        let sut = makSut()
        sut._view.movies = makeMovieData()
        let tableView = sut._view.tableView
        let numberOfRows = sut._view.tableView.dataSource?.tableView(tableView, numberOfRowsInSection: tableView.numberOfSections)
        XCTAssertTrue(numberOfRows == 2)
    }
    
    func test_undecoded_movie_data() {
        let sut = makSut()
        let mockMovies = makeMovieData()
        sut._view.movies = mockMovies
        let tableView = sut._view.tableView
        let cell = sut._view.tableView.dataSource?.tableView(tableView, cellForRowAt: IndexPath(item: 1, section: tableView.numberOfSections-1)) as! MovieCell
        
        XCTAssertEqual(cell.titleLabel.text, mockMovies[1].title)
    }
    
    func makSut() -> MovieHomeController {
        let movieHomeController = MovieHomeController(view: MovieView())
        return movieHomeController
    }
    
    func makeMovieData() -> [Movie] {
        [Movie.init(id: 11, overview: "For best friends Becky and Hunter, life is all about conquering fears and pushing limits. But after they climb 2,000 feet to the top of a remote, abandoned radio tower, they find themselves stranded with no way down. Now Becky and Hunter’s expert climbing skills will be put to the ultimate test as they desperately fight to survive the elements, a lack of supplies, and vertigo-inducing heights", title: "Fall", posterPath: "/9f5sIJEgvUpFv0ozfA6TurG4j22.jpg"),
         Movie.init(id: 12, overview: "A wooden puppet embarks on a thrilling adventure to become a real boy.", title: "Pinocchio", posterPath: "/h32gl4a3QxQWNiNaR4Fc1uvLBkV.jpg")]
    }
}
