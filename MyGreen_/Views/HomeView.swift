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
        TabView {
            
            NavigationView {
                MeuJardimView(plantasNoJardim: $plantasNoJardim)
            }
            .tabItem {
                Image(systemName: "leaf")
                Text("Meu Jardim")
            }
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
                                        .font(.custom("San Francisco", size: 20))
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
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 0) {
                            ForEach(viewModel.plantas) { planta in
                                NavigationLink(destination: DetalhesPlantaView(planta: planta, plantasNoJardim: $plantasNoJardim)) {
                                    CartaoDePlantaView(plantasFavoritas: $viewModel.plantasFavoritas, planta: planta)
                                }
                            }
                        }
                        .padding(8)
                    }
                }
            }
            .tabItem {
                Image(systemName: "house")
                Text("Início")
            }
            
            NavigationView {
                FavoritosView(plantasFavoritas: $viewModel.plantasFavoritas)
            }
            .tabItem {
                Image(systemName: "heart")
                Text("Favoritos")
            }
        }
        .accentColor(Color("FontGreenDark"))
    }
}


struct ConteudoView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
