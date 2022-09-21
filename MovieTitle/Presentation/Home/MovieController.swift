//
//  MovieController.swift
//  MovieTitle
//
//  Created by Abdullah on 17/09/2022.
//

import Foundation
import UIKit

final class MovieHomeController: BaseController<MovieView> {
    
    var viewModel: MovieViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
        viewModel?.movieResponse.subscribe(weakify({ strongSelf, res in
            DispatchQueue.main.async {
                strongSelf.removeLoader()
                if let results = res.element?.results {
                    guard let _ = strongSelf._view.movies else {
                        strongSelf._view.movies = results
                        return
                        
                    }
                    strongSelf._view.movies?.append(contentsOf: results)
                }
                else {
                    strongSelf._view.movies = []
                }
            }
        })).disposed(by: disposeBag)
        
        viewModel?.errorHandler.subscribe(weakify({ strongSelf, error in
            DispatchQueue.main.async {
                strongSelf.showToastWithTItle(error.element?.message, type: .error)
                strongSelf.removeLoader()
            }
        })).disposed(by: disposeBag)
        
        showLoader()
        _view.viewModel = viewModel
    }
}
