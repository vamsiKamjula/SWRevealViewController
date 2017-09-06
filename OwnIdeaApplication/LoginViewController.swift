//
//  ViewController.swift
//  OwnIdeaApplication
//
//  Created by vamsi krishna reddy kamjula on 9/1/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            self.presentingHome()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if Auth.auth().currentUser == nil {
            self.emailTextField.text = nil
            self.passwordTextField.text = nil
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if let loginError = error {
                    let loginFailedAlert = UIAlertController.init(title: "User does not exists !!!", message: "Try Again", preferredStyle: .alert)
                    let alertCancelAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
                    loginFailedAlert.addAction(alertCancelAction)
                    self.present(loginFailedAlert, animated: true, completion: nil)
                    print(loginError.localizedDescription)
                    return
                }
                self.presentingHome()
            })
        }
    }
   
    @IBAction func createNewUserButtonTapped(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                if let newUserError = error {
                    let loginFailedAlert = UIAlertController.init(title: "Something went wrong !!!", message: "Try Again", preferredStyle: .alert)
                    let alertCancelAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
                    loginFailedAlert.addAction(alertCancelAction)
                    self.present(loginFailedAlert, animated: true, completion: nil)
                    print(newUserError.localizedDescription)
                    return
                }
                self.presentingHome()
            })
        }
    }
    
    func presentingHome() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let swRealViewController: SWRevealViewController = storyboard.instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
        self.present(swRealViewController, animated: true, completion: nil)
    }

}

