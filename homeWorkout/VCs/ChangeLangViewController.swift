//
//  ChangeLangViewController.swift
//  homeWorkout
//
//  Created by Eldor Makkambaev on 24.04.2018.
//  Copyright © 2018 Eldor Makkambaev. All rights reserved.
//

import UIKit

class ChangeLangViewController: BaseViewController {
    
    var restartTitle = String()
    var restart = String()

    @IBOutlet weak var ru_btn: UIButton!
    @IBOutlet weak var en_btn: UIButton!
    @IBOutlet weak var tr_btn: UIButton!
    
    @IBAction func russian_lang(_ sender: UIButton) {
        self.changeToLanguage("ru-RU")
        restartTitle = "Требуется перезагрузка приложения"
        restart = "Чтобы изменить язык, приложение должно быть закрыто и повторно открыто вами"
        
    }
    @IBAction func english_lang(_ sender: UIButton) {
        self.changeToLanguage("en-US")
        restartTitle = "App the required"
        restart = "To change the language, the application must be closed and re-opened by you"
    }
    @IBAction func turkish_lang(_ sender: UIButton) {
        self.changeToLanguage("tr-TR")
        restartTitle = "Uygulama gerekli"
        restart = "Dili değiştirmek için uygulama kapatılmalı ve yeniden açılmalıdır."
    }
    
    private func changeToLanguage(_ langCode: String){
        if Bundle.main.preferredLocalizations.first != langCode{
            let confirmAlertCtrl = UIAlertController(title: restartTitle, message : restart, preferredStyle: .alert)
            
            let confirmAction = UIAlertAction(title: NSLocalizedString("Close now", comment: ""), style: .destructive){_ in
                UserDefaults.standard.set([langCode], forKey: "AppleLanguages")
                UserDefaults.standard.synchronize()
                exit(EXIT_SUCCESS)
            }
            confirmAlertCtrl.addAction(confirmAction)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            confirmAlertCtrl.addAction(cancelAction)
            present(confirmAlertCtrl, animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
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
