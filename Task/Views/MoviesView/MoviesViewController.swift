//
//  MoviesViewController.swift
//  Task
//
//  Created by Muhammad Junaid on 14/09/2023.
//

import UIKit
import SDWebImage

class MoviesViewController: UIViewController {

    //MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: Properties
    
    var movieService = MoviesService()
    var movieList : [Movie]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Popular Movies"
        configureTableView()
        getPopularMovies()
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        // Register tableView Cell
        let nib = UINib.init(nibName: "MoviesTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MoviesTableViewCell")
    }
    
    func getPopularMovies() {
        activityIndicator.startAnimating()
        movieService.getPopularMovies(completion: { [self] movies, message in
            activityIndicator.stopAnimating()
            movieList = movies
            reloadData()
        })
    }
    
    func reloadData() {
        if (movieList?.count ?? 0) == 0 {
            lblMessage.isHidden = false
        }
        else {
            lblMessage.isHidden = true
        }
        tableView.reloadData()
    }
}
extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath) as! MoviesTableViewCell
        cell.updateView(data: movieList?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MovieDetailsViewController(nibName: "MovieDetailsViewController", bundle: .main)
        vc.movieData = movieList?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
