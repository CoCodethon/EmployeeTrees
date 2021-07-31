//
//  TreeModel.swift
//  EmployeeTrees
//
//  Created by Richard Hyman on 31/07/2021.
//

import Foundation
import SwiftUI

final class TreeModel : ObservableObject {
    @Published var employees = [Employee]()
    
    init() {
        // dummy data init
        employees.append(Employee(firstName: "Greg", lastName: "Case", roleLevel: 1, jobTitle: "CEO", phone: "07565819633", email: "fake.email@aon.com", underlings: [Employee]()))
    }
}
