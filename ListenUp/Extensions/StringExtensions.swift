//
//  StringExtensions.swift
//  ListenUp
//
//  Created by Ari on 05/02/23.
//

import Foundation


// MARK: - Validate Email
extension String {
    var isValidEmail: Bool {
        let pattern = #"^\S+@\S+\.\S+$"#
        let predicate = NSPredicate(format: "SELF MATCHES %@ ", pattern)
        return predicate.evaluate(with: self)
    }
}


// MARK: - Validate Password
extension String {
    var isValidPassword: Bool {
        // At least one lowercase letter + one digit + one capital letter + 8 characters
        let pattern = #"(?=.*[a-z])"# + #"(?=.*[0-9])"# + #"(?=.*[A-Z])"# + #".{8,}"#
//        + one special character
//        + #"(?=.*[ !$%&?._-])"#
        let predicate = NSPredicate(format: "SELF MATCHES %@ ", pattern)
        return predicate.evaluate(with: self)
    }
}
