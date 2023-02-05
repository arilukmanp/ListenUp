//
//  SignInViewController.swift
//  ListenUp
//
//  Created by Ari on 18/12/22.
//

import UIKit

class SignInViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var signinButton: UIButton!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    
    // MARK: - Helper
    func setup() {
        tfEmail.delegate = self
        tfPassword.delegate = self
        
        tfPassword.isSecureTextEntry = true
        signinButton.isEnabled = false
        
        tfEmail.attributedPlaceholder = NSAttributedString(string: "Email Address", attributes: [.foregroundColor: UIColor.gray])
        tfPassword.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [.foregroundColor: UIColor.gray])
    }
    
    func isEmailValid(_ email: String?) -> Bool {
        let value = email ?? tfEmail.text ?? ""
        return value.isValidEmail
    }
    
    func isPasswordValid(_ password: String?) -> Bool {
        let value = password ?? tfPassword.text ?? ""
        return value.isValidPassword
    }
    
    
    // MARK: - Action
    @IBAction func showPasswordButtonTapped(_ sender: Any) {
        let isSecuredText = tfPassword.isSecureTextEntry
        let eye = UIImage(systemName: "eye")
        let eyeSlash = UIImage(systemName: "eye.slash")
        
        tfPassword.isSecureTextEntry = !isSecuredText
        if let image = isSecuredText ? eyeSlash : eye {
            showPasswordButton.setImage(image, for: .normal)
        }
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        showMainViewController()
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        showSignUpViewController()
    }
}


// MARK: - Extension: Textfield Delegate
extension SignInViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var isEmailValid = false
        var isPasswordValid = false
        
        let input = NSString(string: textField.text ?? "").replacingCharacters(in: range, with: string)
        
        if textField == tfEmail {
            isEmailValid = self.isEmailValid(input)
            isPasswordValid = self.isPasswordValid(nil)
        } else {
            isPasswordValid = self.isPasswordValid(input)
            isEmailValid = self.isEmailValid(nil)
        }
        
        signinButton.isEnabled = isEmailValid && isPasswordValid
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == tfEmail {
            tfPassword.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return false
    }
}
