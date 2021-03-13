//
//  ViewController.swift
//  Weather_Review
//
//  Created by 하동훈 on 2021/03/13.
//

import UIKit

class CountryViewController: UIViewController {

    // MARK: - Properties
    let cellIdentifier = "countryCell"
    var weatherModel = WeatherModel.shared
    var weatherManager = WeatherManager()
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        weatherManager.parseCountryJSON()
        tableView.reloadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
}


// MARK: - UITableViewDataSource, Delegate
extension CountryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherModel.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let country = weatherModel.countries[indexPath.row]
        cell.textLabel?.text = country.koreanName
        cell.imageView?.image = UIImage(named: "flag_" + country.assetName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let country = tableView.cellForRow(at: indexPath)?.textLabel?.text else { return }
        weatherModel.setCountry(of: country)
    }
    
    
}

