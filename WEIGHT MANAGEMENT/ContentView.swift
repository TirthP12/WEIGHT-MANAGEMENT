//
//  ContentView.swift
//  WEIGHT MANAGEMENT
//
//  Created by Tirth D. Patel on 10/24/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var fm = FirebaseManager()
    @State var input = ""
    @State var output = ""
    
    var body: some View {
        VStack {
            TextField("Enter data", text: $input)
            Button("Save") {
                fm.push(input, under: "data")
            }
            Text(output)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
