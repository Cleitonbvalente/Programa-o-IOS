//
//  TermosDePrivacidadeView.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 14/03/25.
//

import SwiftUI

import SwiftUI

struct TermosDePrivacidadeView: View {
    @Binding var termosAceitos: Bool

    var body: some View {
        ZStack {
            // Fundo gradiente
            LinearGradient(
                gradient: Gradient(colors: [Color("BackgroundGradientStart"), Color("BackgroundGradientEnd")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                // Ícone de privacidade
                Image(systemName: "lock.shield.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                // Título
                Text("Termos de Privacidade")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 10)
                
                // Subtítulo
                Text("Por favor, leia e aceite os termos para continuar.")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                // Caixa de termos
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("""
                        1. Coletamos dados para melhorar sua experiência.
                        2. Não compartilhamos seus dados com terceiros.
                        3. Você pode solicitar a exclusão dos seus dados a qualquer momento.
                        """)
                        .font(.body)
                        .foregroundColor(.white)
                        .padding()
                    }
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                }
                
                // Botão de aceitar
                Button(action: {
                    termosAceitos = true
                    UserDefaults.standard.set(true, forKey: "termosAceitos")
                }) {
                    HStack {
                        Text("Aceitar Termos")
                            .font(.headline)
                            .foregroundColor(.white)
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color.blue.opacity(0.8))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                }
            }
        }
    }
}
