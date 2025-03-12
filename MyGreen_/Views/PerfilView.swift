//
//  PerfilView.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 09/03/25.
//

import SwiftUI


struct PerfilView: View {
    @State private var nome: String = ""
    @State private var sobrenome: String = ""
    @State private var modoEscuroAtivo: Bool = false
    @State private var mostrarAlertaSucesso: Bool = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Perfil")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("FontGreenDark"))
                
                Spacer()
            }
            .padding(.top, 40)
            .padding(.horizontal)
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(Color("FontGreenDark"))
                .padding(.top, 10)
            
            TextField("Nome", text: $nome)
                .padding()
                .background(Color(.gray).opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)
            
            TextField("Sobrenome", text: $sobrenome)
                .padding()
                .background(Color(.gray).opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)
            
            Spacer()
                .frame(height: 40)
            
            HStack {
                Text("Modo Escuro")
                    .font(.headline)
                    .foregroundColor(modoEscuroAtivo ? .white : .primary)
                
                Spacer()
                
                ZStack {
                    Capsule()
                        .frame(width: 60, height: 30)
                        .foregroundColor(modoEscuroAtivo ? .green : .gray)
                    
                    Circle()
                        .frame(width: 26, height: 26)
                        .foregroundColor(.white)
                        .offset(x: modoEscuroAtivo ? 15 : -15)
                        .animation(.easeInOut(duration: 0.2), value: modoEscuroAtivo)
                }
                .onTapGesture {
                    modoEscuroAtivo.toggle()
                }
            }
            .padding()
            .background(Color(.gray).opacity(0.2))
            .cornerRadius(8)
            .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                salvarAlteracoes()
                mostrarAlertaSucesso = true
            }) {
                Text("Salvar as alterações")
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
                    title: Text("Sucesso"),
                    message: Text("Alterações realizadas com sucesso."),
                    dismissButton: .default(Text("OK")))
            }
        }
        .padding()
        .background(modoEscuroAtivo ? Color.black : Color.white)
        .edgesIgnoringSafeArea(.all)
        .preferredColorScheme(modoEscuroAtivo ? .dark : .light)
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

