//
//  ThirdViewController.swift
//  SignUp_Review
//
//  Created by 하동훈 on 2021/03/12.
//

import UIKit

class ThirdViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Properties
    var userInformation = UserInformation.shared
    
    let dataFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
    }
    
    // MARK: - Methods
    func dismissToRoot() {
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - IBActions
    @IBAction func phonenumberTextFieldChanged(_ sender: UITextField) {
        userInformation.phoneNumber = sender.text
    }
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        userInformation.birth = dataFormatter.string(from: sender.date)
    }
    @IBAction func cancelPressed(_ sender: UIButton) {
        userInformation.reset()
        dismissToRoot()
    }
    @IBAction func backPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func signUpPressed(_ sender: UIButton) {
        dismissToRoot()
    }
    
    
}
