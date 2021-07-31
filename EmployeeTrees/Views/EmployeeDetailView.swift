//
//  EmployeeDetailView.swift
//  EmployeeTrees
//
//  Created by Benjamin Green on 31/07/2021.
//

import SwiftUI

struct EmployeeDetailView: View {
    //@EnvironmentObject var tree : TreeModel
    //    @ObservedObject var employeeData : Employee
    @State var employee : Employee
    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .frame(width: 65, height: 65)
                .font(.system(size: 53))
            Text(employee.fullName)
                .bold()
                .font(.system(size: 32))
            Spacer()
        }
        .padding()
    }
}

struct EmployeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let treeTest = TreeModel()
        EmployeeDetailView(employee: treeTest.employees[0])
            .preferredColorScheme(.dark)
    }
}
