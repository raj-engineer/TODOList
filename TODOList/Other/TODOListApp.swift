//
//  TODOListApp.swift
//  TODOList
//
//  Created by Rajesh Rajesh on 25/06/23.
//
import FirebaseCore
import SwiftUI

@main
struct TODOListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
