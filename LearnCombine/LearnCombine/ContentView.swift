//
//  ContentView.swift
//  LearnCombine
//
//  Created by Tom Chakkalackal on 30/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var printMyName: String = "Tom"
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(printMyName)
            Button("Change my name", action: {
                printMyName = "Mot"
            })
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
