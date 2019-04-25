//
//  ViewController.swift
//  provab
//
//  Created by PRoVMac on 25/04/19.
//  Copyright © 2019 strlabz. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var questionsTable: UITableView!
    
    var questionsList: [NSManagedObject] = []
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Questions")
       
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                questionsList.append(data)
            }
        } catch {
            print("Failed")
        }
        questionsTable.reloadData()
    }

    // Tableview delegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionsList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionTableViewCell", for: indexPath) as! questionTableViewCell
       
        let question = questionsList[indexPath.row]
        cell.question.text = (question.value(forKey: "question") as! String)
        cell.option1.text = question.value(forKey: "option1") as? String
        cell.option2.text = question.value(forKey: "option2") as? String
        cell.option3.text = (question.value(forKey: "option3") as! String)
        
    
        if question.value(forKey: "buttontype") as? String == "radio" {
            cell.opt1.setImage(UIImage(named: "radioInactive"), for: .normal)
            cell.opt2.setImage(UIImage(named: "radioInactive"), for: .normal)
            cell.opt3.setImage(UIImage(named: "radioInactive"), for: .normal)
        }
        else {
            cell.opt1.setImage(UIImage(named: "checkBox"), for: .normal)
            cell.opt2.setImage(UIImage(named: "checkBox"), for: .normal)
            cell.opt3.setImage(UIImage(named: "checkBox"), for: .normal)
        }
        return cell
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    }

