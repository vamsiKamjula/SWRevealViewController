//
//  ProfileViewController.swift
//  
//
//  Created by vamsi krishna reddy kamjula on 9/1/17.
//
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        profileImageView.layer.borderWidth = 1
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor.black.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
    }
}
