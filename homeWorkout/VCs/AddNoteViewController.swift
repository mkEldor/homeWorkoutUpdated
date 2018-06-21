//
//  AddNoteViewController.swift
//  homeWorkout
//
//  Created by Eldor Makkambaev on 23.04.2018.
//  Copyright © 2018 Eldor Makkambaev. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class AddNoteViewController: UIViewController {
    
    var note :[Note] = []
    private var dbRef: DatabaseReference!
    
    var auth: Auth!
    var database: Database!
    
    @IBOutlet weak var add_noteLabel: UITextField!
    @IBOutlet weak var add_noteText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        add_noteText.layer.borderWidth = 1
//        add_noteText.layer.borderColor = UIColor.black.cgColor
      //  add_noteLabel.layer.borderWidth = 1
        //add_noteLabel.layer.borderColor = UIColor.black.cgColor
        self.auth = Auth.auth()
        self.database = Database.database()
        dbRef = Database.database().reference()
        dbRef = dbRef?.child("notes")
        // Do any additional setup after loading the view.
    }

    @IBAction func add_pressed(_ sender: UIButton) {
        if add_noteText.text! != "" && add_noteLabel.text != ""{
            
//            let note = Note.init("", self.add_noteLabel.text!, self.add_noteText.text!)
            let note = Note.init("", add_noteLabel.text!, add_noteText.text)
            self.dbRef?.childByAutoId().setValue(note.toJSONFormat())
        
            
//            let selfData: [String: String] = [
//                "NOTE_NAME" : self.add_noteText.text!,
//                "NOTE_TEXT" : self.add_noteLabel.text!
//            ]
//            self.database.reference().childByAutoId().setValue(selfData)

            navigationController?.popViewController(animated: true)

        }
//        navigationController?.popViewController(animated: true)
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
    }*/
    

}
