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


// MARK: - Show Main
extension UIViewController {
    func showMainViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "main") as! MainViewController
        
        let window: UIWindow?
        
        if #available(iOS 15.0, *) {
            window = UIApplication.shared.connectedScenes.compactMap { ($0 as? UIWindowScene)?.keyWindow }.first
        } else {
            window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        }
        
        window?.rootViewController = viewController
    }
}


// MARK: - Show Episodes
extension UIViewController {
    func showEpisodesViewController(podcast: Podcast) {
        let storyboard = UIStoryboard(name: "Episode", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "episode") as! EpisodesViewController
        viewController.podcast = podcast
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
