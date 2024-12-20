import SwiftUI

@main
struct MyGreenApp: App {
    @StateObject private var gerenciadorDePlantas = GerenciadorDePlantas()
    
    var body: some Scene {
        WindowGroup {
            ConteudoView()
                .environmentObject(gerenciadorDePlantas)
        }
    }
}
