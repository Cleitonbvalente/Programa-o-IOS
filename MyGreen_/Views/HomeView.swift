//
//  ContentView.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 27/12/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var pesquisaTexto: String = ""
    @State private var plantasNoJardim: [Planta] = []
    @ObservedObject private var viewModel: HomeViewModel = .init()
    
    var myGreenLogo: some View {
        Image("MyGreen Logomarca")
            .resizable()
            .scaledToFit()
            .frame(width: 100)
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    myGreenLogo
                }
                
                VStack {
                    TextField("Pesquisar plantas...", text: $pesquisaTexto)
                        .padding()
                        .background(Color(.gray).opacity(0.2))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            
                        }) {
                            HStack {
                                Text("Filtros")
                                    .foregroundColor(Color("FontGreenDark"))
                                    .font(.custom("DotGothic16-Regular", size: 20))
                                Image(systemName: "line.horizontal.3.decrease.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24)
                                    .foregroundColor(Color("FontGreenDark"))
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 0), GridItem(.flexible())], spacing: 0) {
                        ForEach(viewModel.plantas) { planta in
                            NavigationLink(destination: DetalhesPlantaView(planta: planta, plantasNoJardim: $plantasNoJardim)) {
                                CartaoDePlantaView( plantasFavoritas: $viewModel.plantasFavoritas, planta: planta
                                )
                            }
                        }
                    }
                    .padding(8)
                }
                
                // TabBar
                HStack {
                    NavigationLink(destination: MeuJardimView(plantasNoJardim: $plantasNoJardim)) {
                        BotaoDeNavegacaoView(nomeIcone: "leaf", rotulo: "Meu jardim")
                    }
                    .foregroundColor(.black)
                    Spacer()
                    NavigationLink(destination: HomeView()) {
                        BotaoDeNavegacaoView(nomeIcone: "house", rotulo: "Início")
                            .foregroundColor(.black)
                    }
                    Spacer()
                    NavigationLink(destination: FavoritosView(plantasFavoritas: $viewModel.plantasFavoritas)) {
                        BotaoDeNavegacaoView(nomeIcone: "heart", rotulo: "Favoritos")
                            .foregroundColor(.black)
                    }
                }
                .padding()
                .background(Color(.gray).opacity(0.2))
            }
        }
    }
}

struct ConteudoView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
