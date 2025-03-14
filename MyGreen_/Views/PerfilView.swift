
//
//  PerfilView.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 09/03/25.
//

import SwiftUI


struct PerfilView: View {
    @EnvironmentObject var appSettings: AppSettings
    @State private var nome: String = ""
    @State private var sobrenome: String = ""
    @State private var mostrarAlertaSucesso: Bool = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("perfil.profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(appSettings.modoEscuroAtivo ? Color(hex: "32CD32") : Color("FontGreenDark"))
                
                Spacer()
            }
            .padding(.top, 40)
            .padding(.horizontal)
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(appSettings.modoEscuroAtivo ? Color(hex: "32CD32") : Color("FontGreenDark"))
                .padding(.top, 10)
            
            TextField("perfil.name", text: $nome)
                .padding()
                .background(appSettings.modoEscuroAtivo ? Color.gray.opacity(0.2) : Color(.gray).opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)
            
            TextField("perfil.lastName", text: $sobrenome)
                .padding()
                .background(appSettings.modoEscuroAtivo ? Color.gray.opacity(0.2) : Color(.gray).opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)
            
            Spacer()
                .frame(height: 40)
            
            HStack {
                Text("perfil.darkMode")
                    .font(.headline)
                    .foregroundColor(appSettings.modoEscuroAtivo ? .white : .primary)
                
                Spacer()
                
                ZStack {
                    Capsule()
                        .frame(width: 60, height: 30)
                        .foregroundColor(appSettings.modoEscuroAtivo ? .green : .gray)
                    
                    Circle()
                        .frame(width: 26, height: 26)
                        .foregroundColor(.white)
                        .offset(x: appSettings.modoEscuroAtivo ? 15 : -15)
                        .animation(.easeInOut(duration: 0.2), value: appSettings.modoEscuroAtivo)
                }
                .onTapGesture {
                    appSettings.modoEscuroAtivo.toggle()
                }
            }
            .padding()
            .background(appSettings.modoEscuroAtivo ? Color.gray.opacity(0.2) : Color(.gray).opacity(0.2))
            .cornerRadius(8)
            .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                salvarAlteracoes()
                mostrarAlertaSucesso = true
            }) {
                Text("perfil.saveChanges")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color("FontGreenDark"))
                    .cornerRadius(12)
                    .padding(.horizontal)
            }
            .padding(.bottom, 20)
            .alert(isPresented: $mostrarAlertaSucesso) {
                Alert(
                    title: Text("perfil.success"),
                    message: Text("perfil.changesMadeSuccessfully"),
                    dismissButton: .default(Text("OK")))
            }
        }
        .padding()
        .background(appSettings.modoEscuroAtivo ? Color.black : Color.white)
        .edgesIgnoringSafeArea(.all)
    }

    private func salvarAlteracoes() {
        print("Nome: \(nome)")
        print("Sobrenome: \(sobrenome)")
    }
}

struct PerfilView_Previews: PreviewProvider {
    static var previews: some View {
        PerfilView()
    }
}
