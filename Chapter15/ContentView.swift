//
//  ContentView.swift
//  Chapter14
//
//  Created by Mike Panitz on 4/18/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            DisclosureGroupView()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Disclosure")
                }
            OutlineGroupView()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Indent")
                }
            ExercisesView()
                .tabItem {
                    Image(systemName: "3.square")
                    Text("Exercises")
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
