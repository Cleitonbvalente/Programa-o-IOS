//
//  LocalizationManager.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 14/03/25.
//

import SwiftUI

import Foundation
import SwiftUI

class LocalizationManager: ObservableObject {
    static let shared = LocalizationManager()

    @Published var currentLanguage: String = "pt-BR" // Idioma padrão: Português do Brasil

    init() {}

    func setLanguage(_ language: String) {
        currentLanguage = language
        UserDefaults.standard.set([language], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }

    func localizedString(forKey key: String) -> String {
        // Verifica se o caminho do bundle existe
        guard let path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj") else {
            return key // Retorna a chave se o bundle não for encontrado
        }

        // Carrega o bundle
        guard let bundle = Bundle(path: path) else {
            return key // Retorna a chave se o bundle não puder ser carregado
        }

        // Retorna a string localizada ou a chave se não for encontrada
        return bundle.localizedString(forKey: key, value: nil, table: nil)
    }
}
