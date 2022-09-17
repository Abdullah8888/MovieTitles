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
        title = "Movies"
        super.viewDidLoad()
    }
}
