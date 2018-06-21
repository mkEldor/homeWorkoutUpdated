//
//  MenuViewController.swift
//  homeWorkout
//
//  Created by Eldor Makkambaev on 19.04.2018.
//  Copyright © 2018 Eldor Makkambaev. All rights reserved.
//

import UIKit
import Firebase

protocol SlideMenuDelegte {
    func slideMenuItemSelectedAtIndex(_ index :Int32)
}


class MenuViewController: UIViewController {
    

    @IBOutlet weak var buttonCloseMenuOverlay: UIButton!
    var btnMenu :UIButton!
    var delegate :SlideMenuDelegte?
    
    var auth: Auth!
    var database: Database!
    private var dbRef: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.auth = Auth.auth()
        self.database = Database.database()
        dbRef = Database.database().reference()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnCloseMenuTapped(_ sender: UIButton) {
        
        btnMenu.tag = 0
        btnMenu.isHidden = false
        if (self.delegate != nil){
            var index = Int32(sender.tag)
            if (sender == self.buttonCloseMenuOverlay){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        UIView.animate(withDuration: 0.3, animations: {() -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: {(finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
        })
    }
    
    @IBAction func btn_planTrenirovok(_ sender: UIButton) {
        
        let mainStoryboard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func btn_note(_ sender: UIButton) {
        let mainStoryboard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = mainStoryboard.instantiateViewController(withIdentifier: "NotesViewController") as! NotesViewController
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
    
    @IBAction func btn_lang(_ sender: UIButton) {
        let mainStoryboard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = mainStoryboard.instantiateViewController(withIdentifier: "ChangeLangViewController") as! ChangeLangViewController
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
    
    @IBAction func btn_alarm(_ sender: UIButton) {
        let mainStoryboard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = mainStoryboard.instantiateViewController(withIdentifier: "AlarmsViewController") as! MainAlarmViewController
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
    
    @IBAction func btn_reset(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Вы уверены?", message: "Все напоминания и записки будут удалены", preferredStyle: UIAlertControllerStyle.alert)
        
        
        let yesAction = UIAlertAction(title: "Да", style: .default) { (_ ) in
            
            
            let mainStoryboard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let VC = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.navigationController?.pushViewController(VC, animated: true)
            
            self.dbRef?.child("notes").removeValue()

            
            }
        
        
        let cancelAction = UIAlertAction(title: "Нет", style: UIAlertActionStyle.default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        
        alertController.addAction(yesAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    
        
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
