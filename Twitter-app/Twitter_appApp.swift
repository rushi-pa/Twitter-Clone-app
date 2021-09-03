//
//  Twitter_appApp.swift
//  Twitter-app
//
//  Created by Rushi Patel on 2021-08-10.
//

import SwiftUI
import Firebase
@main
struct Twitter_appApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
           // Log_inView()
           ContentView().environmentObject(AuthViewModel())
        }
    }
}
