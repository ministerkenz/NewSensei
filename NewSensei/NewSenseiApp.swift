//
//  NewSenseiApp.swift
//  NewSensei
//
//  Created by Kenzo Yubitani (student LM) on 3/4/25.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct NewSenseiApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var user = User()

    var body: some Scene {
        WindowGroup {
            AppRootView()
                .environmentObject(user)
        }
    }
}

struct AppRootView: View {
    @EnvironmentObject var user: User
    @State private var navigateToHome = false

    var body: some View {
        if navigateToHome {
            Home_Screen()
                .environmentObject(user)
        } else {
            SignUpView(navigateToHome: $navigateToHome)
                .environmentObject(user)
        }
    }
}
