//
//  Exercise.swift
//  homeWorkout
//
//  Created by Eldor Makkambaev on 19.04.2018.
//  Copyright © 2018 Eldor Makkambaev. All rights reserved.
//

import Foundation
import UIKit
class Exercise {
    var exerciseName :String!
    var approachLabel: String!
    init( _ exerciseName: String, _ approachLabel: String) {
        self.exerciseName = exerciseName
        self.approachLabel = approachLabel
    }
    var exerciseNm: String? {
        get{
            return exerciseName
        }
        
    }
    var approachLbl: String? {
        get{
            return approachLabel
        }
        
    }
}
