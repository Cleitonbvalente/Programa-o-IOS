//
//  MyGreen_App.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 27/12/24.
//

import SwiftUI

import SwiftUI

@main
struct MyGreen_App: App {
    @StateObject private var appSettings = AppSettings()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            .environmentObject(appSettings)
            .preferredColorScheme(appSettings.modoEscuroAtivo ? .dark : .light)
        }
    }
}
