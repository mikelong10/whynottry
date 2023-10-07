//
//  ContentView.swift
//  WhyNotTry
//
//  Created by Michael Long on 10/7/23.
//

import SwiftUI

struct ContentView: View {
    var activities = ["Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket", "Curling", "Fencing", "Golf", "Hiking", "Lacrosse", "Rugby", "Squash"]
    var colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red]

    @State private var selected = "Rugby"
    @State private var id = 1
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Why not try...")
                .font(.largeTitle.bold())
            
            Spacer()
        
            VStack {
                Circle()
                    .fill(colors.randomElement() ?? .blue)
                    .overlay(
                        Image(systemName: "figure.\(selected.lowercased())")
                            .font(.system(size: 144))
                            .foregroundColor(.white)
                    )
                Text("\(selected)!")
                    .font(.title)
            }
            .padding()
            .transition(.slide)
            .id(id)
            
            Spacer()
            
            Button("Try again") {
                withAnimation(.easeInOut(duration: 1)) {
                    selected = activities.randomElement() ?? "Rugby"
                    id += 1
                }
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
