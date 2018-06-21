//
//  SignInViewController.swift
//  homeWorkout
//
//  Created by Eldor Makkambayev on 20.05.2018.
//  Copyright © 2018 Eldor Makkambaev. All rights reserved.
//

import UIKit
@IBDesignable

class SignInViewController: UIViewController {
    
    @IBOutlet weak var email_tf: UITextField!
    @IBOutlet weak var password_tf: UITextField!
    @IBOutlet weak var logIn_btn: UIButton!
    @IBOutlet weak var register_btn: UIButton!
    

//    @IBOutlet weak var viewOne: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        viewOne.layer.cornerRadius = 5
//        viewOne.layer.borderWidth = 2
//        viewOne.layer.borderColor = UIColor.white.cgColor
//
//        viewOne.layer.shadowColor = UIColor.black.cgColor
//        viewOne.layer.shadowOffset = .zero
//        viewOne.layer.shadowOpacity = 0
//        viewOne.layer.shadowRadius = 15.0
//        viewOne.layer.shadowPath = UIBezierPath(rect: viewOne.bounds).cgPath
//        viewOne.layer.shouldRasterize = true
//        viewOne.clipsToBounds = true
        
        email_tf.layer.borderColor = UIColor.white.cgColor
        email_tf.layer.borderWidth = 1
        email_tf.layer.cornerRadius = 25
        email_tf.clipsToBounds = true
        
        password_tf.layer.borderColor = UIColor.white.cgColor
        password_tf.layer.borderWidth = 1
        password_tf.layer.cornerRadius = 25
        password_tf.clipsToBounds = true
        
        logIn_btn.layer.cornerRadius = 25
        logIn_btn.clipsToBounds = true
        
        
        view.setGradientBackground(colorOne: Colors.orange, colorTwo: Colors.darkOrange)
        

                
//        register_btn.layer.cornerRadius = 15
//        register_btn.layer.borderWidth = 1
//        register_btn.layer.borderColor = UIColor.white.cgColor
//        register_btn.clipsToBounds = true
        

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
