//
//  MeuJardimView.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 04/01/25.
//

import SwiftUI

struct MeuJardimView: View {
    @Binding var plantasNoJardim: [Planta]
    @State private var pesquisaTexto: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Meu Jardim")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            

            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Pesquisar minhas plantas...", text: $pesquisaTexto)
            }
            .padding()
            .background(Color(hex: "#F5F5DC"))
            .cornerRadius(8)
            .padding(.horizontal)
            
            if plantasNoJardim.isEmpty {
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
                            CartaoDePlantaView(
                                plantasFavoritas: .constant([]),
                                plantasNoJardim: $plantasNoJardim,
                                planta: planta,
                                isMeuJardim: true
                            )
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Meu Jardim")
    }
}
