
//  NettbutikkappApp.swift
//  Nettbutikkapp
//  Created by Noah on 14/03/2023.


import SwiftUI

import Foundation

struct MainView: View {
    
    var brukerinfo: Bruker
    
    @State private var brukere: [Bruker] = []

    var body: some View {
     
       
        TabView {
            
            Produktliste()
                .tabItem {
                    Label("Produkter", systemImage: "list.dash")
                            }
            
            HandleKurvUI(bruker: brukerinfo)
                .tabItem {
                    Label("Handlekurv", systemImage: "cart.badge.questionmark")
                            }
            
            BrukerUI(brukerinfo: brukerinfo)
                .tabItem {
                        Label("Brukerinfo", systemImage: "person.crop.circle")
                            }
    }
        
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
               .font(.system(size: 24, weight: .bold)) // adjust font size here
        
        
        .background(LinearGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
      
    }
}
