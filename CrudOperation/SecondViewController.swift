//
//  SecondViewController.swift
//  CrudOperation
//
//  Created by enes öztürk on 5.04.2023.
//

import RealmSwift
import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var rollPickerView: UIPickerView!
    
    let roles = ["Designer", "Developer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rollPickerView.dataSource = self
        rollPickerView.delegate = self
    }
    
    @IBAction func addTapped(_ sender: UIButton) {
        var e = Employee()
        e.name = nameTextField.text!
        e.role = roles[rollPickerView.selectedRow(inComponent: 0)]
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(e)
            print("succesfully added")
        }
    }
}

extension SecondViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return roles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return roles[row]
    }
}
