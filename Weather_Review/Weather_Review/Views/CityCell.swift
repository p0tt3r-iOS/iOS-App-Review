//
//  cityCell.swift
//  Weather_Review
//
//  Created by 하동훈 on 2021/03/13.
//

import UIKit

class CityCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var stateImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var probabilityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
