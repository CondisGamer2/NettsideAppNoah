//
//  HandleKurvAPI.swift
//  Nettbutikkapp
//
//  Created by Noah on 20/03/2023.
//

import Foundation

struct HandleKurvMeta: Codable{
    var carts: [Kurven]
}

struct Kurven: Codable, Identifiable{
    var id: Int
    var userId: Int
    var products: [Produkt]
}

func lastInnHandleKurv(urlString: String) async throws -> [Kurven] {
    let url = URL(string: urlString)!
    let urlrequest = URLRequest(url:url)
    
    let (data, _) = try await URLSession.shared.data(for: urlrequest)
    let cart = try JSONDecoder().decode(HandleKurvMeta.self, from: data)
    return cart.carts
    }

