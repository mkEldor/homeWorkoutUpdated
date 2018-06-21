//
//  MainTableViewCell.swift
//  homeWorkout
//
//  Created by Eldor Makkambaev on 19.04.2018.
//  Copyright © 2018 Eldor Makkambaev. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var training_name: UILabel!
    @IBOutlet weak var training_image: UIImageView!
    @IBOutlet weak var training_imageLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
