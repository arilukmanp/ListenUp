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
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self)
    }
}


// MARK: - Validate Password
extension String {
    var isValidPassword: Bool {
        // At least 8 characters + one capital letter + one lowercase letter + one digit
        let pattern = #"(?=.{8,})"# + #"(?=.*[A-Z])"# + #"(?=.*[a-z])"# + #"(?=.*\d)"#
//        + one special character
//        + #"(?=.*[ !$%&?._-])"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self)
    }
}
