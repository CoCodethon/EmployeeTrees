//
//  ContentView.swift
//  EmployeeTrees
//
//  Created by Benjamin Green on 31/07/2021.
//

import SwiftUI

struct ContentView: View {
    let tree : [Employee] = [Employee(firstName: "El", lastName: "Supremo", type: EmployeeType.teamLeader, underlings: [])]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                
            }
            .navigationBarTitle("Top-level Employees", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    NavigationLink(
                        destination: InsertView(),
                        label: {
                            Image(systemName: "cross.fill")
                        })
                }
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    NavigationLink(
                        destination: SearchView(),
                        label: {
                            Image(systemName: "magnifyingglass")
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
