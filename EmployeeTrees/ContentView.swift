//
//  ContentView.swift
//  EmployeeTrees
//
//  Created by Benjamin Green on 31/07/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var tree : TreeModel
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                ScrollView(.horizontal) {
                    ForEach(tree.employees) { employee in
                        EmployeeDetailView(employee: tree.employees[0])
                    }
                }//Horizontal SV
                Text("Underlings")
                    .font(.largeTitle)
                ScrollView(.horizontal) {
                    ForEach(tree.employees[0].underlings, id: \.self) { employee in
                        NavigationLink(destination: ContentView()) {
                            EmployeeDetailView(employee: employee)
                        }
                    }
                }
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
            .environmentObject(TreeModel())
            .preferredColorScheme(.dark)
    }
}
