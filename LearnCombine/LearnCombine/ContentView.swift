//
//  ContentView.swift
//  LearnCombine
//
//  Created by Tom Chakkalackal on 30/01/23.
//

import SwiftUI
import Combine

/**
View should contain
 1. One header label named Welcome.
 2. Two textfields - with placeholders username and password.
 3. One SignIn Button.
 - SignIn button should be disabled while either of the textfields are empty.
 - SignIn button should be enabled while both textfields are non empty.
 - On pressing SignIn button, both textfields should be validated.
 - Username textfield should be validated for - nonEmpty, valid email.
 - Password textfield should be validated for - minimum length 8.
 - Incase of a validation error an alert should be shown.
 - Incase of a sucessful validation a success alert should be shown.
 */

struct ContentView: View {
    @ObservedObject private var viewModel: ContentViewVM
    
    init(model: ContentViewVM) {
        viewModel = ContentViewVM()
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 20
        ) {
            Text("Welcome!")
            TextField("Username", text: $viewModel.userName)
                .textFieldStyle(.roundedBorder)
                .frame(height: 60)
            TextField("Password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)
                .frame(height: 60)
            Button(action: {
                viewModel.signInButtonAction()
            }) {
                Text("Sign In")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.system(size: 18))
            }
            .frame(height: 45)
            .border(Color.black)
            .disabled(viewModel.userName.isEmpty || viewModel.password.isEmpty)
            .alert(isPresented: $viewModel.isAlertPresented) { () -> Alert in
                Alert(title: Text("Hey There"), message: Text(viewModel.signInMessage ?? "No message"), primaryButton: .default(Text("Okay"), action: {
                    print("Okay Click")
                }), secondaryButton: .default(Text("Dismiss")))
            }
        }
        .padding(.init(top: 100, leading: 45, bottom: 30, trailing: 45))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: ContentViewVM())
    }
}
