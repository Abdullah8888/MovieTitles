//
//  MovieController.swift
//  MovieTitle
//
//  Created by Abdullah on 17/09/2022.
//

import Foundation
import UIKit

final class MovieHomeController: BaseController<MovieView> {
    
    var viewModel: MoviewViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
//        viewModel?.movieResponse.onUpdate = { [weak self] res in
//            self?._view.movies = res?.results
//            self?.removeLoader()
//        }
//
//        viewModel?.error.onUpdate = { [weak self] err in
//            self?.showToastWithTItle(err?.message, type: .error)
//            self?.removeLoader()
//        }
        
        viewModel?.movieResponse.subscribe(weakify({ strongSelf, res in
            DispatchQueue.main.async {
                strongSelf._view.movies = res.element?.results
                strongSelf.removeLoader()
            }
        })).disposed(by: disposeBag)
        
        viewModel?.errorHandler.subscribe(weakify({ strongSelf, error in
            DispatchQueue.main.async {
                strongSelf.showToastWithTItle(error.element?.message ?? "asdfadfd", type: .error)
                strongSelf.removeLoader()
            }
        })).disposed(by: disposeBag)
        
        showLoader()
        viewModel?.getMovies()
    }
}
