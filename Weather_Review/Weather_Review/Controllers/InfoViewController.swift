//
//  InfoViewController.swift
//  Weather_Review
//
//  Created by 하동훈 on 2021/03/13.
//

import UIKit

class InfoViewController: UIViewController {
    
    // MARK: - Properties
    let weatherModel = WeatherModel.shared
    
    // MARK: - IBOutlets
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var probabilityLabel: UILabel!
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let state = weatherModel.city?.state else { return }
        weatherImageView.image = weatherModel.getImage(of: state)
        weatherLabel.text = weatherModel.getWeatherString(of: state)
        degreeLabel.text = weatherModel.city?.degree
        probabilityLabel.text = weatherModel.city?.probabilityString
        print("info set")
    }
}
