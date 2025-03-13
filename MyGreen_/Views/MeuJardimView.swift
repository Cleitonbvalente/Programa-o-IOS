//
//  MeuJardimView.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 04/01/25.
//

import SwiftUI

struct MeuJardimView: View {
    @EnvironmentObject var appSettings: AppSettings // Adicionado EnvironmentObject
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
                    .foregroundColor(appSettings.modoEscuroAtivo ? Color(hex: "32CD32") : Color("FontGreenDark")) // Ajuste de cor
                
                Spacer()
                
                Button(action: {
                    mostrarAdicionarPlantas = true
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(appSettings.modoEscuroAtivo ? Color(hex: "32CD32") : Color("FontGreenDark")) // Ajuste de cor
                        .padding(8)
                        .background(appSettings.modoEscuroAtivo ? Color.gray.opacity(0.2) : Color.white) // Ajuste de cor
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
            .background(appSettings.modoEscuroAtivo ? Color.gray.opacity(0.2) : Color(hex: "#F5F5DC")) // Ajuste de cor
            .cornerRadius(8)
            .padding(.horizontal)

            if plantasNoJardim.isEmpty {
                Spacer()
                Text("Nenhuma planta no jardim.")
                    .foregroundColor(appSettings.modoEscuroAtivo ? .white : .black) // Ajuste de cor
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
        .foregroundColor(appSettings.modoEscuroAtivo ? Color(hex: "32CD32") : Color("FontGreenDark")) // Ajuste de cor
        .sheet(isPresented: $mostrarAdicionarPlantas) {
            AdicionarPlantasView(plantasNoJardim: $plantasNoJardim, plantasDisponiveis: plantasDisponiveis)
                .environmentObject(appSettings) // Injeta AppSettings
        }
        .onAppear {
            plantasNoJardim = carregarPlantasNoJardim()
        }
        .onChange(of: plantasNoJardim) { valorAntigo, novoValor in
            salvarPlantasNoJardim(novoValor)
        }
        .preferredColorScheme(appSettings.modoEscuroAtivo ? .dark : .light) // Aplica o modo escuro
    }
}
