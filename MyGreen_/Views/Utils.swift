//
//  Utils.swift
//  MyGreen_
//
//  Created by iredefbmac_30 on 07/03/25.
//

import Foundation


func salvarPlantasFavoritas(_ plantas: [Planta]) {
    if let encoded = try? JSONEncoder().encode(plantas) {
        UserDefaults.standard.set(encoded, forKey: "plantasFavoritas")
    }
}

func carregarPlantasFavoritas() -> [Planta] {
    if let data = UserDefaults.standard.data(forKey: "plantasFavoritas"),
       let plantas = try? JSONDecoder().decode([Planta].self, from: data) {
        return plantas
    }
    return []
}

func salvarPlantasNoJardim(_ plantas: [Planta]) {
    if let encoded = try? JSONEncoder().encode(plantas) {
        UserDefaults.standard.set(encoded, forKey: "plantasNoJardim")
    }
}

func carregarPlantasNoJardim() -> [Planta] {
    if let data = UserDefaults.standard.data(forKey: "plantasNoJardim"),
       let plantas = try? JSONDecoder().decode([Planta].self, from: data) {
        return plantas
    }
    return []
}
