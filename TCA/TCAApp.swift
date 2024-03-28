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
    static let store = Store(initialState: ContactsFeature.State()) {
        ContactsFeature()
            ._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            ContactsView(store: MyApp.store)
        }
    }
}
