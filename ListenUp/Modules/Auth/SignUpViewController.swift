//
//  SignUpViewController.swift
//  ListenUp
//
//  Created by Ari on 18/12/22.
//

import UIKit

class SignUpViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    

    // MARK: - Helper
    func setupUI() {
        tfName.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        tfEmail.attributedPlaceholder = NSAttributedString(string: "Email Address", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        tfPassword.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
