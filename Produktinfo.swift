
//  NettbutikkappApp.swift
//  Nettbutikkapp
//  Created by Noah  on 14/03/2023.

import SwiftUI

struct Produktinfo: View {
    
    var produkt: Produkt
    
    var body: some View {
        VStack {
            Text(produkt.title)
                .font(.largeTitle)
                .foregroundColor(.orange)
                .fontWeight(.bold)
                .padding(.top)
            
            
                    AsyncImage(url: URL(string: produkt.thumbnail ?? "")) { image in
                    image.resizable()
                        
                    } placeholder: {
                    ProgressView()
                }
                
                .frame(width: 350, height: 350)
                .cornerRadius(15)
                .padding()
            
            
            
            VStack(alignment: .leading) {
                Text("Beskrivelse:")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                
                ScrollView {
                    Text(produkt.description ?? "Ingen verdi")
                        .font(.body)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                .frame(height: 100)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)

            }

            
            .padding(.horizontal)
            
            Spacer()
            
            HStack {
                Text("På lager:")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(produkt.stock ?? 0, format: .number)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .padding()
            
            HStack {
                Text("Pris:")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(produkt.price, format: .currency(code: "USD"))
                    .font(.title2)
                    .fontWeight(.bold)
                
            }
            .padding(.bottom)
        }
  

            .padding()
        }
    }
    
  

