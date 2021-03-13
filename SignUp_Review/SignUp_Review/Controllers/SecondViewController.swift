//
//  SecondViewController.swift
//  SignUp_Review
//
//  Created by 하동훈 on 2021/03/12.
//

import UIKit

class SecondViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Properties
    var userInformation = UserInformation.shared
    
    lazy var imagePicker: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bioView: UITextView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bioView.delegate = self
        
        self.hideKeyboardWhenTappedAround()
        
        // 텍스트뷰 가장자리 만들기
        bioView.layer.borderWidth = 0.5
        bioView.layer.borderColor = UIColor.opaqueSeparator.cgColor
        bioView.layer.cornerRadius = 2
        
        // 텍스트뷰 플레이스홀더 작성
        bioView.text = "Add a bio"
        bioView.textColor = UIColor.lightGray
    }

    // MARK: - Methods
    func dismissModal() {
        userInformation.reset()
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - IBActions
    @IBAction func idTextFieldChanged(_ sender: UITextField) {
        userInformation.username = sender.text
    }
    @IBAction func passwordTextFieldChanged(_ sender: UITextField) {
        userInformation.password = sender.text
    }
    @IBAction func confirmTextFieldChanged(_ sender: UITextField) {
        userInformation.confirmPassword = sender.text
    }
    @IBAction func imagePickPressed(_ sender: UIButton) {
        self.present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func cancelPressed(_ sender: UIButton) {
        dismissModal()
    }
    @IBAction func nextPressed(_ sender: UIButton) {
        if userInformation.isValid() {
            performSegue(withIdentifier: "goToNext", sender: sender)
        } else {
            let message = "아이디 또는 비밀번호를 확인하여 주세요."
            let alert = UIAlertController(title: "경고", message: message, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "확인", style: .default) { _ in return }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}
// MARK: - Bio TextView Delegate
extension SecondViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if bioView.textColor == UIColor.lightGray {
            bioView.text = ""
            bioView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        userInformation.bio = textView.text
    }
}

// MARK: - UIImagePicker & UINavigationControllerDelegate
extension SecondViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = originalImage
        }
        userInformation.userImage = self.imageView.image
        self.dismiss(animated: true, completion: nil)
    }

}
