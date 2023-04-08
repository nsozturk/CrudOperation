//
//  Employee.swift
//  CrudOperation
//
//  Created by enes öztürk on 5.04.2023.
//

import Foundation
import RealmSwift

class Employee: Object {
    @objc dynamic var employeeId = UUID().uuidString
    @objc dynamic var name = ""
    @objc dynamic var role = ""

    override static func primaryKey() -> String? {
        return "employeeId"
    }

    override class func indexedProperties() -> [String] {
        return ["role"]
    }
}
