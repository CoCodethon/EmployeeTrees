//
//  Employee.swift
//  EmployeeTrees
//
//  Created by Benjamin Green on 31/07/2021.
//

import Foundation
enum EmployeeType {
    case teamLeader
    case loanWolf
}

struct Employee {
    let firstName : String
    let lastName : String
    var type : EmployeeType
    var underlings : [Employee]
    func getUnderlings() -> [Employee] {
        if (underlings.count == 0) {
            print("\(firstName) \(lastName) is a loan wolf")
        } else {
            for underling in underlings {
                print("\(underling.firstName) \(underling.lastName) : \(underling.type)")
            }
        }
        return underlings
    }
    mutating func addUnderling(_ employee : Employee) {
        underlings.append(employee)
    }
    mutating func removeUnderling(_ employee : Employee) {
        //This should probably be a guard block
        if let x = underlings.firstIndex(where: { $0.firstName == employee.firstName &&
            $0.lastName == employee.lastName }) {
            underlings.remove(at: x)
        }
    }
//    func getSuperior(_ x : Self) -> Employee {
//        Not implemented
//    }
}
