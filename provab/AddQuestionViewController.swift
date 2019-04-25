//
//  AddQuestionViewController.swift
//  provab
//
//  Created by PRoVMac on 25/04/19.
//  Copyright © 2019 strlabz. All rights reserved.
//

import UIKit
import CoreData



class AddQuestionViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var question: UITextField!
    
    @IBOutlet weak var option1: UITextField!
    
    @IBOutlet weak var option2: UITextField!
    
    @IBOutlet weak var option3: UITextField!
    
    var buttonType:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // Validates the empty data and then submit the values
    func validations() {
        if buttonType == "" {
            print("no button type")
        }
        else if question.text == ""{
           print("no data type")
        }
        else if option1.text == ""{
            print("no data type")
        }
        else if option2.text == ""{
            print("no data type")
        }
        else if option3.text == ""{
            print("no data type")
        }
        else {
            submit()
        }
    }
    
    // storing the data in coredata
    func submit(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Questions", in: context)
        let newQuestions = NSManagedObject(entity: entity!, insertInto: context)
    
         newQuestions.setValue(question.text, forKey: "question")
         newQuestions.setValue(option1.text,  forKey: "option1")
         newQuestions.setValue(option2.text,  forKey: "option2")
         newQuestions.setValue(option3.text,  forKey: "option3")
         newQuestions.setValue(buttonType,  forKey: "buttontype")
       
        do {
            try context.save()
            print("saveddd")
        } catch {
            print("Failed saving")
        }
    }

    // Button Actions
    
    @IBAction func submitAction(_ sender: Any) {
        validations()
    }
    
    @IBAction func radio(_ sender: Any) {
      buttonType = "radio"
    }
    
    @IBAction func checkBo(_ sender: Any) {
        buttonType = "checkbox"
    }
    
    // Textfield delegate methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == question {
            option1.becomeFirstResponder()
        }
        else if textField == option1 {
            option2.becomeFirstResponder()
        }
        else if textField == option2 {
            option3.becomeFirstResponder()
        }
        else {
        self.view.endEditing(true)
        }
        return false
    }
}
