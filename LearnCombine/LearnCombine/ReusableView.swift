//
//  ReusableView.swift
//  LearnCombine
//
//  Created by Tom Manuel on 01/02/23.
//

import SwiftUI

class MyVM: ObservableObject {
    @Published var name: String = "Tom"
    
    func updateState() {
        name += name
    }
}

struct ReusableView: View {
    
    @StateObject var vm: MyVM
    @EnvironmentObject var myTheme: Theme
    
    init(vm: MyVM) {
        _vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        VStack {
            Text(vm.name)
                .foregroundColor(myTheme.color)
            Button("Subview State Changer") {
                vm.updateState()
            }
        }
        .padding()
    }
}

struct ReusableView_Previews: PreviewProvider {
    static var previews: some View {
        ReusableView(vm: MyVM())
    }
}
