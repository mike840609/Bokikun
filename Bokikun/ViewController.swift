//
//  ViewController.swift
//  Bokikun
//
//  Created by 蔡鈞 on 16/12/2017.
//  Copyright © 2017 蔡鈞. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase



class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentUser = Auth.auth().currentUser {
            
            segueToMainView()
            
            print(currentUser.displayName!)
            print(currentUser.email!)
            
            // facebook_photo
            if let url = currentUser.photoURL{
                print(url)
            }
            
        }
    }
    
    
    @IBAction func facebookLogin(_ sender: Any) {
        
        let fbLoginManager = FBSDKLoginManager()
        
        fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                return
            }
            
            guard let accessToken = FBSDKAccessToken.current() else {
                print("Failed to get access token")
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            
            // Perform login by calling Firebase APIs
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                
                if let error = error {
                    
                    print("Login error: \(error.localizedDescription)")
                    
                    let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                    let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okayAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                    return
                }
                self.segueToMainView()
            })
        }   
    }
    
    
    func segueToMainView(){
        // Present the main view
        if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MainView") {
            UIApplication.shared.keyWindow?.rootViewController = viewController
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
}

