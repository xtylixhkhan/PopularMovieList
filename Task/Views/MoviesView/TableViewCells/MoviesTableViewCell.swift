//
//  MoviesTableViewCell.swift
//  Task
//
//  Created by Muhammad Junaid on 15/09/2023.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {

    //MARK: IBOutlets
    
    @IBOutlet weak var vBackground: UIView!
    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        initializeUISettings()
    }
    
    func initializeUISettings() {
        vBackground.layer.cornerRadius = 15
        vBackground.clipsToBounds = true
    }
    
    func updateView(data: Movie?) {
        ivPoster.sd_setImage(with: URL(string: "\(imageBaseURL)\(data?.posterPath ?? "")"), placeholderImage: UIImage(named: "photo_placeholder"))
        lblName.text = data?.originalTitle ?? "---"
        if let date = Helper.shared.convertDateStrIntoDate(dateStr: data?.releaseDate ?? "") {
            lblDate.text = Helper.shared.convertDateIntoDateString(date: date)
        }
        else {
            lblDate.text = "---"
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
