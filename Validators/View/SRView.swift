//
//  SRView.swift
//  Validators
//
//  Created by Sheraz Rasheed on 07/10/2019.
//  Copyright © 2019 IBITWAY Apps. All rights reserved.
//

import Foundation
import UIKit

class SRView: UIView {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var projectIdTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var departmentTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    func validate() {
        
        do {
            let email = try self.emailTextField.validateText(validationType: ValidatorType.email)
            let userName = try self.usernameTextField.validateText(validationType: ValidatorType.userName)
            let age = try self.ageTextField.validateText(validationType: ValidatorType.age)
            let password = try self.passwordTextField.validateText(validationType: ValidatorType.password)
        }catch (let error){
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            appdelegate.showAlert(for: (error as! ValidationError).message)
        }
    }
}
