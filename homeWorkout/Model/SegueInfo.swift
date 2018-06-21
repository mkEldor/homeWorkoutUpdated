//
//  SegueInfo.swift
//  homeWorkout
//
//  Created by Eldor Makkambayev on 16.06.2018.
//  Copyright © 2018 Eldor Makkambaev. All rights reserved.
//

import Foundation

struct SegueInfo {
    var curCellIndex: Int
    var isEditMode: Bool
    var label: String
    var mediaLabel: String
    var mediaID: String
    var repeatWeekdays: [Int]
    var enabled: Bool
    var snoozeEnabled: Bool
}
