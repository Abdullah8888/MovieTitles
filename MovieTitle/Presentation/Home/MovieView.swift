//
//  MovieView.swift
//  MovieTitle
//
//  Created by Abdullah on 17/09/2022.
//

import Foundation
import UIKit

class MovieView: BaseView {
    
    private var movieCell = String(describing: MovieCell.self)
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero)
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
        tableView.register(MovieCell.self, forCellReuseIdentifier: movieCell)
        return tableView
    }()
    
    var pageCount = 0
    var viewModel: MovieViewModel?
    var isLoadingStarted = true
    var movies: [Movie]? {
        didSet {
            if movies?.isEmpty ?? false {
                tableView.showEmptyViewWith(text: "No data found")
            }
            else {
                tableView.reloadData()
            }
        }
    }
    
    override func setup() {
        super.setup()
        addSubview(tableView)
        tableView.fillUpSuperview(margin: .topOnly(20))
    }
}

extension MovieView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: movieCell) as! MovieCell
        if let movie = self.movies?[indexPath.row] {
            cell.updateCell(with: movie)
        }
        return cell
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.isLoadingStarted = true
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if offsetY > contentHeight - scrollView.frame.height {

            if let vievModel = viewModel {
                if !vievModel.paginationFinished && isLoadingStarted {
                    isLoadingStarted = false
                    pageCount = pageCount + 1
                    //fetchMoreMovies?(pageCount)
                    viewModel?.getMovies(page: pageCount)
                    self.tableView.reloadData()

                }
            }

        }
    }
}
    

class MovieCell: BaseTableViewCell {
    
    let posterImage: UIImageView = {
        let img = UIImageView()
        img.changeImageColor(to: .red)
        img.backgroundColor = .red
        img.contentMode = .scaleAspectFit
        img.backgroundColor = .black
        img.constrainHeight(constant: 250)
        return img
    }()
    
    let titleLabel: Label = {
        let label = Label(text: "Title", font: .helveticaNeueBold(size: 17), textColor: .systemRed, alignment: .center)
        return label
    }()
    
    let overViewLabel: Label = {
        let label = Label(text: "Overview", font: .helveticaNeueRegular(size: 15), textColor: .systemRed.withAlphaComponent(0.8), alignment: .center)
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView.init(arrangedSubviews: [posterImage,titleLabel,overViewLabel])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.layer.borderWidth = 1
        stackView.clipsToBounds = true
        return stackView
    }()
    
    let containerView: ShadowView = {
        let view = ShadowView()
        view.backgroundColor = .black
        return view
    }()
    
    override func setup() {
        super.setup()
        
        contentView.addSubview(containerView)
        backgroundColor = .black
        containerView.fillUpSuperview(margin: .init(allEdges: 20))
        containerView.addSubview(stackView)
        stackView.fillUpSuperview(margin: .init(allEdges: 20))

    }
    
    func updateCell(with movie: Movie) {
        titleLabel.text = movie.title ?? "Not Found"
        overViewLabel.text = movie.overview ?? "Not Found"
        posterImage.showImage(url: .posterHost + (movie.posterPath ?? ""))
    }
}
