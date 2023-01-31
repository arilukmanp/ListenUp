//
//  UIViewControllerExtensions.swift
//  ListenUp
//
//  Created by Ari on 31/01/23.
//

import UIKit


// MARK: - Pop and Dismiss
extension UIViewController {
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}


// MARK: - Show Register
extension UIViewController {
    func showSignUpViewController() {
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "register") as! SignUpViewController
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
