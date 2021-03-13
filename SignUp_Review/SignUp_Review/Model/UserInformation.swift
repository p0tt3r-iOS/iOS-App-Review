//
//  UserInformation.swift
//  SignUp_Review
//
//  Created by 하동훈 on 2021/03/12.
//

import UIKit

class UserInformation {
    static var shared: UserInformation = UserInformation()
    
    var username: String? = nil {
        willSet {
            guard let new: String = newValue else {
                print("진행하던 내용이 삭제됩니다.")
                return
            }
            print("ID: \(new)가 저장됩니다.")
        }
    }
    
    var password: String? = nil {
        willSet {
            guard let new: String = newValue else { return }
            print("PW: \(new)가 저장됩니다.")
        }
    }
    
    var confirmPassword: String? = nil {
        willSet {
            guard let new: String = newValue else { return }
            print("CF PW: \(new)가 저장됩니다.")
        }
    }
    
    var bio: String? = nil {
        willSet {
            guard let new: String = newValue else { return }
            print("Bio: \(new)가 저장됩니다.")
        }
    }
    
    var birth: String? = nil {
        willSet {
            guard let new: String = newValue else { return }
            print("Birth: \(new)가 저장됩니다.")
        }
    }
    var phoneNumber: String? = nil {
        willSet {
            guard let new: String = newValue else { return }
            print("PhoneNumber: \(new)가 저장됩니다.")
        }
    }
    var userImage: UIImage? = nil {
        willSet {
            guard let _: UIImage = newValue else { return }
            print("이미지가 추가되었습니다.")
        }
    }
    
    func reset() {
        UserInformation.shared = UserInformation()
    }
    
    func isValid() -> Bool {
        guard let username = self.username, username.count > 0 else { return false }
        guard let password = self.password, let confirmPassword = confirmPassword else { return false }
        if password != confirmPassword { return false }
        else { return true }
    }
    
    
}
