//
//  ViewController.swift
//  CrudOperation
//
//  Created by enes öztürk on 30.03.2023.
//

import RealmSwift
import UIKit

class ViewController: UIViewController {
    @IBOutlet var segmentedController: UISegmentedControl!

    @IBOutlet var tableView: UITableView!

    var employees: Results<Employee>?

    override func viewDidLoad() {
        super.viewDidLoad()

        segmentedController.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)

        tableView.delegate = self
        tableView.dataSource = self
        retrieveEmployees(role: "")
         print(Realm.Configuration.defaultConfiguration.fileURL)
    }

    @objc func segmentChanged() {
        switch segmentedController.selectedSegmentIndex {
        case 0:
            retrieveEmployees(role: "")
        case 1:
            retrieveEmployees(role: "Designer")
        case 2:
            retrieveEmployees(role: "Developer")
        default:
            retrieveEmployees(role: "")
        }
    }

    func retrieveEmployees(role: String) {
        let realm = try! Realm()
        if role == "" {
            employees = realm.objects(Employee.self)
        } else {
            employees = realm.objects(Employee.self).filter("role = %@", role)
        }
        let results = realm.objects(Employee.self).filter("role = %@", role)
        employees = results
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees == nil ? 0 : employees!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath)
        if employees != nil {
            cell.textLabel?.text = employees?[indexPath.row].name
        }
        return cell
    }
}
