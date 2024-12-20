import SwiftUI

class GerenciadorDePlantas: ObservableObject {
    @Published var plantas: [String] = []
    
    func adicionarPlanta(_ planta: String) {
        plantas.append(planta)
    }
}
