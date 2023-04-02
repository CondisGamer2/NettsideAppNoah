
//  NettbutikkappApp.swift
//  Nettbutikkapp
//  Created by Noah on 14/03/2023.


import Foundation

struct ProduktMeta: Codable {
    var products: [Produkt]
}

struct Produkt: Codable, Identifiable{
    var id: Int
    var title: String
    var price: Double
    var description: String?
    var thumbnail: String?
    var stock: Double?
    var quantity: Int?
    var discountPercentage: Double?
    var rating: Double?
}


func lastInnProdukt(urlString: String) async throws -> [Produkt] {
    let url = URL(string: urlString)!
    let urlrequest = URLRequest(url:url)
    
    let (data, _) = try await URLSession.shared.data(for: urlrequest)
    let produkter = try JSONDecoder().decode(ProduktMeta.self, from: data)
    return produkter.products 
    }
