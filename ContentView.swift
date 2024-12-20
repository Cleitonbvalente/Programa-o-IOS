import SwiftUI

struct ConteudoView: View {
    @EnvironmentObject var gerenciadorDePlantas: GerenciadorDePlantas
    @State private var novoNomePlanta: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(gerenciadorDePlantas.plantas, id: \.self) { planta in
                        Text(planta)
                    }
                }
                
                HStack {
                    TextField("Digite o nome da planta", text: $novoNomePlanta)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button(action: {
                        if !novoNomePlanta.isEmpty {
                            gerenciadorDePlantas.adicionarPlanta(novoNomePlanta)
                            novoNomePlanta = ""
                        }
                    }) {
                        Text("Adicionar")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
            .navigationTitle("Meu Jardim")
        }
    }
}
