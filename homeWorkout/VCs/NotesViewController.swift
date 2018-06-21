//
//  NotesViewController.swift
//  homeWorkout
//
//  Created by Eldor Makkambaev on 23.04.2018.
//  Copyright © 2018 Eldor Makkambaev. All rights reserved.
//

import UIKit
import Firebase
class NotesViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var notes: [Note] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    var auth: Auth!
    var database: Database!
    private var dbRef: DatabaseReference?

    @IBOutlet weak var tableView: UITableView!
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        loadData()
//    }
    
//    private func loadData() {
//        database.reference().child("notes").observeSingleEvent(of: .value) { (snapshot) in
//            if let dictionary: [String : String] = snapshot.value as? [String : String] {
//                self.notes.append(Note.init(dictionary["NOTE_LABEL"]!, dictionary["NOTE_TEXT"]!))
////                self.imageViewer.image =
//            }
//
//        }
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell") as! NotesTableViewCell
        cell.noteView.layer.borderWidth = 2
        cell.noteView.layer.borderColor = UIColor.black.cgColor
        cell.noteView.layer.cornerRadius = 13
        cell.note_label.text = notes[indexPath.row].noteLbl
        cell.note_text.text = notes[indexPath.row].noteTxt
        //                self.imageViewer.image =

        return cell
    
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        tableView.reloadData()
        self.auth = Auth.auth()
        self.database = Database.database()
        dbRef = Database.database().reference()
        navigationItem.title = "Записи"
        
        dbRef?.child("notes").observe(.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String : String] {
                
                let note = Note(snapshot.key, dictionary["note_label"]!, dictionary["note_text"]!)
                self.notes.append(note)
                self.tableView.reloadData()
            }
        })
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120

        // Do any additional setup after loading the view.
    }
    
    

    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            //
            let note = notes[indexPath.row]
            dbRef?.child("notes").child(note.ID!).removeValue()
            
            self.notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
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
