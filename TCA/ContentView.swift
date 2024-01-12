//
//  ContentView.swift
//  TCA
//
//  Created by 강치우 on 1/12/24.
//

import SwiftUI
import ComposableArchitecture

struct CounterState: Equatable {
    var count = 0
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
