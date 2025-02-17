//
//  MeuJardimView.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 04/01/25.
//

import SwiftUI

import SwiftUI

struct MeuJardimView: View {
    @Binding var plantasNoJardim: [Planta]
    @State private var pesquisaTexto: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            // Título
            Text("Meu Jardim")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            // Campo de pesquisa
            TextField("Pesquisar minhas plantas...", text: $pesquisaTexto)
                .padding()
                .background(Color(.gray).opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)
            
            // Lista de plantas ou mensagem centralizada
            if plantasNoJardim.isEmpty {
                // Mensagem centralizada
                Spacer()
                Text("Nenhuma planta no jardim.")
                    .foregroundColor(.black)
                    .italic()
                Spacer()
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(plantasNoJardim.filter {
                            pesquisaTexto.isEmpty || $0.nome.localizedCaseInsensitiveContains(pesquisaTexto)
                        }) { planta in
                            NavigationLink(destination: DetalhesPlantaView(planta: planta, plantasNoJardim: $plantasNoJardim)) {
                                CartaoDePlantaView(
                                    plantasFavoritas: .constant([]), // Passando uma lista vazia de favoritos (ou a lista real, se necessário)
                                    plantasNoJardim: $plantasNoJardim,
                                    planta: planta
                                )
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Meu Jardim")
    }
}
struct MeuJardimView_Previews: PreviewProvider {
    static var previews: some View {
        MeuJardimView(plantasNoJardim: .constant([]))
    }
}


