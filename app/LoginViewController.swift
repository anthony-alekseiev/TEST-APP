//
//  LoginViewController.swift
//  app
//
//  Created by Anton Aleksieiev on 05.05.2020.
//  Copyright © 2020 Anton Aleksieiev. All rights reserved.
//

import UIKit
import multi_api

class LoginViewController: UIViewController {
    
    var api: API = API.shared
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func didTouchLogin(_ sender: Any) {
        guard let email = emailTF.text, let password = passwordTf.text else {
            showAlert(title: "Error", message: "Enter email & password!")
            return
        }
        guard !email.isEmpty && !password.isEmpty else {
            showAlert(title: "Error", message: "Email & password should not be empty!")
            return
        }
        api.login(email: email, password: password, callback: {
            [weak self] (success, message) in
            if success {
                self?.showAlert(title: "Success", message: message)
            } else {
                self?.showAlert(title: "Error", message: message)
            }
        })
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertController.Style.alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            alert.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
    

}
