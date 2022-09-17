//
//  MovieFlowCoordinator.swift
//  MovieTitle
//
//  Created by Abdullah on 17/09/2022.
//

import Foundation
import UIKit

class MovieFlowCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    let movieControllerFactory: MovieControllerFactoryProtocol
    
    init(navigationController: UINavigationController, movieControllerFactory: MovieControllerFactoryProtocol) {
        self.navigationController = navigationController
        self.movieControllerFactory = movieControllerFactory
    }
    
    override func start() {
        let vc = movieControllerFactory.makeMovieHomeController()
        navigationController.pushViewController(vc, animated: true)
    }

}
