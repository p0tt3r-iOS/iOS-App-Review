//
//  InfoViewController.swift
//  SimpleTable_Review
//
//  Created by 하동훈 on 2021/03/16.
//

import UIKit

class InfoViewController: UIViewController {
    
    var text: String? = nil

    @IBOutlet weak var initialLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialLabel.text = text
    }

}
