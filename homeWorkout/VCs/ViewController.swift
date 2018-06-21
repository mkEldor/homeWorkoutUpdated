//
//  ViewController.swift
//  homeWorkout
//
//  Created by Eldor Makkambaev on 19.04.2018.
//  Copyright © 2018 Eldor Makkambaev. All rights reserved.
//

import UIKit

class ViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var trainings :[Trainings] = [
        Trainings.init(#imageLiteral(resourceName: "vse telo"), "ВСЁ ТЕЛО", "ВСЁ ТЕЛО"),
        Trainings.init(#imageLiteral(resourceName: "nizhnaya chast telo"), "НИЖНЯЯ ЧАСТЬ ТЕЛО", "НИЖНЯЯ ЧАСТЬ ТЕЛО"),
        Trainings.init(#imageLiteral(resourceName: "grud"), "ГРУДЬ", "ГРУДЬ"),
        Trainings.init(#imageLiteral(resourceName: "press"), "ПРЕСС", "ПРЕСС"),
        Trainings.init(#imageLiteral(resourceName: "ruki"), "РУКИ", "РУКИ"),
        Trainings.init(#imageLiteral(resourceName: "plechi i spina"), "ПЛЕЧИ И СПИНА", "ПЛЕЧИ И СПИНА"),
        Trainings.init(#imageLiteral(resourceName: "nog"), "НОГИ", "НОГИ")
    ]
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MainTableViewCell
        
        cell.training_name.text = trainings[indexPath.row].trainingName
        cell.training_imageLbl.text = trainings[indexPath.row].trainingImageLabel
        cell.training_image.image = trainings[indexPath.row].trainingImage
        cell.training_image.layer.cornerRadius = 10
        cell.training_image.layer.masksToBounds = true
        
        
        
        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue"{
            
            let destination = segue.destination as! ExerciseViewController
            destination.trainingName_text = trainings[(tableView.indexPathForSelectedRow?.row)!].trainingName
            destination.trainingImage_image = trainings[(tableView.indexPathForSelectedRow?.row)!].trainingImage
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Тренировки для Дома"
        addSlideMenuButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

