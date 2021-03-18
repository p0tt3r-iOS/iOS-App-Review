//
//  ViewController.swift
//  DatePicker_Review
//
//  Created by 하동훈 on 2021/03/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "eee MMM d h:mm a"
        return formatter
    }()
    
    @IBAction func didDatePickerChanged(_ sender: UIDatePicker) {
        print("Value changed")
        
        let date: Date = sender.date
        let dateString = dateFormatter.string(from: date)
        
        self.dateLabel.text = dateString
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }


}

