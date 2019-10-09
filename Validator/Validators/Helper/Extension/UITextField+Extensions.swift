//
//  Extension.swift
//  Validators
//
//  Created by Sheraz Rasheed on 08/10/2019.
//  Copyright © 2019 IBITWAY Apps. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func validateText(validationType: ValidatorType) throws -> String {
        let validator = ValidateFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!)
    }
}
