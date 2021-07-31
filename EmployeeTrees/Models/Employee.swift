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

struct Employee : Identifiable, Hashable {
    var id = UUID()
    let firstName : String
    let lastName : String
    var manager : UUID?
    var roleLevel : Int // Aon Role Level, ARL, an int between 1 and 9 to denote rank, 9 being junior and 1 being senior.
    var jobTitle : String
    var phone : String
    var email : String
    var underlings : [Employee] // should be optional but I CBA with compiler errors rn
    
    // added for convenience
    var fullName : String {
        firstName + " " + lastName
    }
    
    // considering deprecating as this functionality is baked into grabbing the array directly
    func getUnderlings() -> [Employee] {
        if (underlings.count == 0) {
            print("\(fullName) has no line reports")
        } else {
            for underling in underlings {
                print("\(fullName) with \(underlings.count) line reports")
            }
        }
        return underlings
    }
    
    // This method adds a new underling, and sets that new underling's manager to the current instance's id
    // This will allow us to move back up the tree without needing a function
    mutating func addUnderling(_ employee : Employee) {
        var newUnderling = employee
        newUnderling.manager = self.id
        underlings.append(newUnderling)
    }
    
    mutating func removeUnderling(_ employee : Employee) {
        //This should probably be a guard block
        if let x = underlings.firstIndex(where: { $0.firstName == employee.firstName &&
                                            $0.lastName == employee.lastName }) {
            underlings.remove(at: x)
        }
    }
}
