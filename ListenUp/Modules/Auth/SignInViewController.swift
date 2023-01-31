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

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    
    // MARK: - Helper
    func setupUI() {
        tfEmail.attributedPlaceholder = NSAttributedString(string: "Email Address", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        tfPassword.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
    }
    
    
    // MARK: - Action
    @IBAction func signInButtonTapped(_ sender: Any) {
        showMainViewController()
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        showSignUpViewController()
    }
}
