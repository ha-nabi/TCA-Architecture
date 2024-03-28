//
//  TCAApp.swift
//  TCA
//
//  Created by 강치우 on 1/12/24.
//

import ComposableArchitecture
import SwiftUI


@main
struct MyApp: App {
    static let store = Store(initialState: AppFeature.State()) {
        AppFeature()
            ._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            AppView(store: MyApp.store)
        }
    }
}
