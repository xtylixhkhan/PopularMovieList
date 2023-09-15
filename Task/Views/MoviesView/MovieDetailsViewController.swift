//
//  MovieDetailsViewController.swift
//  Task
//
//  Created by Muhammad Junaid on 15/09/2023.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    //MARK: IBOutlets
    
    @IBOutlet weak var vBackground: UIView!
    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblUserScore: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    
    //MARK: Properties
    
    var movieData : Movie? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeUISettings()
        setDetails()
    }
    
    func initializeUISettings() {
        self.title = "Movie Details"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        vBackground.layer.cornerRadius = 15
        vBackground.clipsToBounds = true
    }
    
    func setDetails() {
        if let movieData = movieData {
            lblMessage.isHidden = true
            vBackground.isHidden = false
            ivPoster.sd_setImage(with: URL(string: "\(imageBaseURL)\(movieData.posterPath ?? "")"), placeholderImage: UIImage(named: "photo_placeholder"))
            lblName.text = movieData.originalTitle ?? "---"
            if let date = Helper.shared.convertDateStrIntoDate(dateStr: movieData.releaseDate ?? "") {
                lblDate.text = Helper.shared.convertDateIntoDateString(date: date)
            }
            else {
                lblDate.text = "---"
            }
            let userScore = (movieData.voteAverage ?? 0.0) * 10
            lblUserScore.text = "\(Int(userScore))%"
            lblOverview.text = movieData.overview ?? "---"
        }
        else {
            vBackground.isHidden = true
            lblMessage.isHidden = false
        }
    }
}
