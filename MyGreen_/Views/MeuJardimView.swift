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
    @State private var mostrarAdicionarPlantas = false

    var plantasDisponiveis: [Planta]

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Meu Jardim")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Spacer()
                
                Button(action: {
                    mostrarAdicionarPlantas = true
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color("FontGreenDark"))
                        .padding(8)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 2)
                }
            }
            .padding(.horizontal)

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
                            NavigationLink(destination: PlantaRegadaView(planta: planta, plantasNoJardim: $plantasNoJardim)) {
                                CartaoDePlantaView(
                                    plantasFavoritas: .constant([]),
                                    plantasNoJardim: $plantasNoJardim,
                                    planta: planta,
                                    isMeuJardim: true
                                )
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Meu Jardim")
        .foregroundColor(Color("FontGreenDark"))
        .sheet(isPresented: $mostrarAdicionarPlantas) {
            AdicionarPlantasView(plantasNoJardim: $plantasNoJardim, plantasDisponiveis: plantasDisponiveis)
        }
        .onAppear {
            plantasNoJardim = carregarPlantasNoJardim()
        }
        .onChange(of: plantasNoJardim) { valorAntigo, novoValor in
                            salvarPlantasNoJardim(novoValor)
                        }
    }
}
