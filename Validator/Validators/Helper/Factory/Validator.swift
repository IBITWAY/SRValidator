//
//  Validator.swift
//  Validators
//
//  Created by Sheraz Rasheed on 08/10/2019.
//  Copyright © 2019 IBITWAY Apps. All rights reserved.
//

import Foundation

enum ValidatorType {
    case email
    case age
    case userName
    case password
}

struct ValidationConstant {
    
    static let kEmptyEmail = "Please Enter Email"
    static let kValidEmail = "Please Enter Valid Email"

    static let kEmptyAge  = "Please Enter Age"
    static let kAgeNumber = "Invalid age number!"
    static let kValidAge  = "You have to be over 18 years old to user our app :)"
    
    static let kEmptyUserName    = "Please Enter UserName"
    static let kLessUserName    = "Username must contain more than three characters"
    static let kWrongUserName    = "Username shoudn't conain more than 18 characters"
    static let kInvalidUserName  = "Invalid username, username should not contain whitespaces, numbers or special characters"
    
    static let kEmptyPassword    = "Please Enter Password"
    static let kWrongPassword    = "Password must have at least 6 characters"

}

class ValidationError: Error {
    
    var message: String = ""
    
    init(_ message: String) {
        self.message = message
    }
}

protocol ValidatorConvertible {
    func validated(_ value: String) throws ->String
}

enum ValidateFactory {    
    static func validatorFor(type:ValidatorType)->ValidatorConvertible {
        switch type {
        case .email:
            return EmailValidator()
        case .age:
            return AgeValidator()
        case .userName:
            return UserNameValidator()
        case .password:
            return PasswordValidator()
        }
    }
}

struct PasswordValidator: ValidatorConvertible {
    
    func validated(_ value: String) throws -> String {
        
        guard value != "" else {
            throw ValidationError(ValidationConstant.kEmptyPassword)
        }
        
        guard value.count >= 6 else {
            throw ValidationError(ValidationConstant.kWrongPassword)
        }
        
        return value
    }
}

struct UserNameValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        
        guard value != "" else {
            throw ValidationError(ValidationConstant.kEmptyUserName)
        }
        
        guard value.count > 3 else {
            throw ValidationError(ValidationConstant.kLessUserName)
        }
        
        guard value.count < 18 else {
            throw ValidationError(ValidationConstant.kWrongUserName)
        }

        do {
            if try NSRegularExpression(pattern: "^[a-z]{1,18}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError(ValidationConstant.kInvalidUserName)
            }
        }catch {
            throw ValidationError(ValidationConstant.kInvalidUserName)
        }
        
        return value
    }
}

struct AgeValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        
        let age = Int(value) ?? 0
        
        guard value != "" else {throw ValidationError(ValidationConstant.kEmptyAge)}
        guard age >= 18 else {throw ValidationError(ValidationConstant.kValidAge)}

        return value
    }
}

struct EmailValidator:ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        
        guard value != "" else {throw ValidationError(ValidationConstant.kEmptyEmail)}
        
        do {
            if try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError(ValidationConstant.kValidEmail)
            }
        }catch {
            throw ValidationError(ValidationConstant.kValidEmail)
        }
        return value
    }
}
