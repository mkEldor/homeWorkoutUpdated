//
//  Note.swift
//  homeWorkout
//
//  Created by Eldor Makkambaev on 23.04.2018.
//  Copyright © 2018 Eldor Makkambaev. All rights reserved.
//

import Foundation
import Firebase

import UIKit
class Note {
    var id: String?
    var noteLabel: String
    var noteText: String
    init(_ id: String, _ noteLabel: String, _ noteText: String) {
        self.id = id
        self.noteLabel = noteLabel
        self.noteText = noteText
    }
    init(id: String, snapshot: DataSnapshot) {
        self.id = id
        let note = snapshot.value as! NSDictionary
        noteLabel = (note.value(forKey: "note_label") as? String)!
        noteText = (note.value(forKey: "note_text") as? String)!
    }
    var ID: String?{
        return id
    }
    var noteLbl: String? {
        get{
            return noteLabel
        }
        
    }
    var noteTxt :String?{
        get{
            return noteText
        }
    }
    func toJSONFormat()-> Any {
        return ["note_label": noteLabel,
                "note_text": noteText]
    }
}
