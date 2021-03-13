//
//  CityViewController.swift
//  Weather_Review
//
//  Created by 하동훈 on 2021/03/13.
//

import UIKit

class CityViewController: UIViewController {
    // MARK: - Properties
    let cellIdentifier = "cityCell"
    var weatherModel = WeatherModel.shared
    var weatherManager = WeatherManager()
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        weatherManager.parseCityJSON()
        tableView.reloadData()
    }
    
    // MARK: - Methods
    
    
    // MARK: - IBActions
}

// MARK: - UITableViewDataSource, Delegate
extension CityViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let row = weatherModel.cities?.count else { return 0 }
        return row
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CityCell
        
        guard let city = weatherModel.cities?[indexPath.row] else { return cell }
        
        cell.stateImageView?.image = weatherModel.getImage(of: city.state)
        cell.cityNameLabel?.text = city.cityName
        cell.degreeLabel?.text = city.degree
        cell.probabilityLabel?.text = city.probabilityString
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as! CityCell? else { return }
        guard let city = cell.cityNameLabel.text else { return }
        weatherModel.setCity(of: city)
    }
    
    
}
