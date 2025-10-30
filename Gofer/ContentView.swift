//
//  ContentView.swift
//  Gofer
//
//  Created by Abhishek Velekar on 30/10/25.
//

import SwiftUI
import FactoryKit

struct ContentView: View {
    @Injected(\.testModel) var testModel: Test
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!" + String(testModel.id))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

