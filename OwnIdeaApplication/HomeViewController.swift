//
//  HomeViewController.swift
//  OwnIdeaApplication
//
//  Created by vamsi krishna reddy kamjula on 9/1/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

     
    @IBOutlet weak var menuButton: UIBarButtonItem!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presentingSideMenus()
        
    }

    func presentingSideMenus() {
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 270
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            dismiss(animated: true, completion: nil)
        } catch let signoutError {
            print(signoutError.localizedDescription)
        }
    }
}
