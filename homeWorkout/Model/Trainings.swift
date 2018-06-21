//
//  Trainings.swift
//  homeWorkout
//
//  Created by Eldor Makkambaev on 19.04.2018.
//  Copyright © 2018 Eldor Makkambaev. All rights reserved.
//

import Foundation
import UIKit
class Trainings {
    var trainingName :String!
    var trainingImageLabel: String!
    var trainingImage :UIImage!
    init( _ trainingImage: UIImage,  _ trainingName: String, _ trainingImageLabel: String) {
        self.trainingImage = trainingImage
        self.trainingName = trainingName
        self.trainingImageLabel = trainingImageLabel
    }
    var trainingImg: UIImage? {
        get{
            return trainingImage
        }
        
    }
    var trainingLbl: String? {
        get{
            return trainingName
        }
        
    }
    var trainingImageLbl: String? {
        get{
            return trainingImageLabel
        }
        
    }
}
