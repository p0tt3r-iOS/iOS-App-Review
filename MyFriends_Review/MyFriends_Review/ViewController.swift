//
//  ViewController.swift
//  MyFriends_Review
//
//  Created by 하동훈 on 2021/03/15.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    let cellIdentifier = "Cell"
    var friends: [Friend] = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableview: UITableView!

    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: "friends") else {
            return
        }
        
        do {
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        tableview.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let friend = friends[indexPath.row]
        
        cell.textLabel?.text = friend.nameAndAge
        cell.detailTextLabel?.text = friend.fullAddress
        
        return cell
    }
    
    
}
