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
                ForEach(tree.employees) { employee in
                    NavigationLink(
                        destination: BranchView(),
                        label: {
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
                        })
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
