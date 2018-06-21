//
//  Persistable.swift
//  homeWorkout
//
//  Created by Eldor Makkambayev on 16.06.2018.
//  Copyright © 2018 Eldor Makkambaev. All rights reserved.
//

import Foundation

protocol Persistable{
    var ud: UserDefaults {get}
    var persistKey : String {get}
    func persist()
    func unpersist()
}
