
//  NettbutikkappApp.swift
//  Nettbutikkapp
//  Created by Noah on 14/03/2023.

import SwiftUI

struct BrukerListe: View {
    
    @State private var brukere: [Bruker] = []

    init() {
        let navBarAppearance = UINavigationBar.appearance()
        let titleFont = UIFont(name: "HelveticaNeue-Bold", size: 36)!
        let titleAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.purple, .font: titleFont]
        let largeTitleFont = UIFont(name: "HelveticaNeue-Bold", size: 36)!
        let largeTitleAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.purple, .font: largeTitleFont]
        navBarAppearance.titleTextAttributes = titleAttributes
        navBarAppearance.largeTitleTextAttributes = largeTitleAttributes
    }
    
    var body: some View {
        NavigationView {
            List(brukere) { bruker in
                Section {
                    NavigationLink(destination: MainView(brukerinfo: bruker)) {
                        Text(bruker.username)
                            .font(.title3)
                            .foregroundColor(.orange)
                            .bold()
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(
            LinearGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]),
            startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            
            .navigationBarTitle("Velg en Bruker", displayMode: .inline)
            
        }
        .task {
            print("Før")
            await updateBrukere()
            print("Etter")
        }
    }
    
    func updateBrukere() async {
        do {
            brukere = try await lastInnBruker(urlString: "https://dummyjson.com/users")
        } catch {
            print(error)
        }
    }
}

