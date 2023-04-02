
//  NettbutikkappApp.swift
//  Nettbutikkapp
//  Created by Noah on 14/03/2023.

import Foundation

struct BrukerMeta: Codable {
    var users: [Bruker]
}

struct Bruker: Codable, Identifiable{
    var id: Int
    var firstName: String
    var lastName: String
    var phone: String
    var username: String
    var password: String
    var email: String
}

func lastInnBruker(urlString: String) async throws -> [Bruker]{
    let url = URL(string: urlString)!
    let urlrequest = URLRequest(url:url)
    
    let (data, _) = try await URLSession.shared.data(for: urlrequest)
    print(data)
    let svar = try JSONDecoder().decode(BrukerMeta.self, from: data)
    let brukere = svar.users
    return brukere
    }
