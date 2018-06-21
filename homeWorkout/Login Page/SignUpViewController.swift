//
//  SignUpViewController.swift
//  homeWorkout
//
//  Created by Eldor Makkambayev on 14.06.2018.
//  Copyright © 2018 Eldor Makkambaev. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTF.layer.borderColor = UIColor.white.cgColor
        nameTF.layer.borderWidth = 1
        nameTF.layer.cornerRadius = 25
        nameTF.clipsToBounds = true
        
        phoneTF.layer.borderColor = UIColor.white.cgColor
        phoneTF.layer.borderWidth = 1
        phoneTF.layer.cornerRadius = 25
        phoneTF.clipsToBounds = true

        emailTF.layer.borderColor = UIColor.white.cgColor
        emailTF.layer.borderWidth = 1
        emailTF.layer.cornerRadius = 25
        emailTF.clipsToBounds = true
        
        passwordTF.layer.borderColor = UIColor.white.cgColor
        passwordTF.layer.borderWidth = 1
        passwordTF.layer.cornerRadius = 25
        passwordTF.clipsToBounds = true

        view.setGradientBackground(colorOne: Colors.orange, colorTwo: Colors.darkOrange)

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
