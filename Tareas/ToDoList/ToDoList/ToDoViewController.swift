//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by Igor Dito on 02/11/18.
//  Copyright © 2018 Aketzally Toledo. All rights reserved.
//


import UIKit

class ToDoViewController: UITableViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var dueDatePickerView: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    func updateSaveButtonState(){
        let text = titleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        updateSaveButtonState()
    }
    
    @IBAction func texEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func returnPressed (_ sender: UITextField){
        titleTextField.resignFirstResponder()
    }
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton){
        isCompleteButton.isSelected = !isCompleteButton.isSelected
    }
}
