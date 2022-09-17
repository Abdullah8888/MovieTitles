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
        //tableView.backgroundColor = .hexE5E5E5
        tableView.register(MovieCell.self, forCellReuseIdentifier: movieCell)
        return tableView
    }()
    
    var movies: [Movie]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func setup() {
        super.setup()
        addSubview(tableView)
        tableView.fillUpSuperview()
    }
}

extension MovieView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //10
        //posts?.count ?? 0
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: movieCell) as! MovieCell

        return cell
    }
}
    

class MovieCell: BaseTableViewCell {
    
    let posterImage: UIImageView = {
        let img = UIImageView(image: UIImage(systemName: ""))
        img.changeImageColor(to: .lightGray)
        img.constrainHeight(constant: 170)
        return img
    }()
    
    let titleLabel: Label = {
        let label = Label(text: "Title", font: .helveticaNeueBold(size: 16), textColor: .white)
        return label
    }()
    
    let overViewLabel: Label = {
        let label = Label(text: "Overview", font: .helveticaNeueRegular(size: 14), textColor: .white.withAlphaComponent(0.8))
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView.init(arrangedSubviews: [posterImage,titleLabel,overViewLabel])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.layer.borderWidth = 1
        return stackView
    }()
    
    override func setup() {
        super.setup()
        addSubview(stackView)
        stackView.fillUpSuperview(margin: .init(allEdges: 10))
    }
    
    func updateCell(with movie: Movie) {
        titleLabel.text = movie.title ?? "Not Found"
        overViewLabel.text = movie.overview ?? "Not Found"
    }
}

