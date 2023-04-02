
//  NettbutikkappApp.swift
//  Nettbutikkapp
//  Created by Noah on 14/03/2023.


import SwiftUI

struct Produktliste: View {
    
    @State private var produkter: [Produkt] = []
    
    
    var body: some View {
        VStack{
            
            //Overskrift for Listen
            Text("Produkter")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .font(.system(size: 18))
                .foregroundColor(.primary)
            
            List(produkter) { produkt in
       
                Section {
                    
                    NavigationLink(destination: Produktinfo(produkt: produkt)) {
                        HStack {
                            
                            //Hente bilde fra API
                            AsyncImage(url: URL(string: produkt.thumbnail ?? "0")) { image in
                            image.resizable()
                           
                                
                                
                            } placeholder: {
                                
                                ProgressView()
    
                            }
                            
                            
                            //Størrelse på bilde i Listen med produkter
                            .frame(width: 50, height: 50)
                            .cornerRadius(5)
                            
                            VStack(alignment: .leading) {
                                Text(produkt.title)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.blue)
                                    .lineLimit(2)
                                
                                Text(produkt.description ?? "no value")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .lineLimit(2)
                                
                                
                                
                                HStack {
                                    Label("\(produkt.stock ?? 0, format: .number)", systemImage: "poweroff")
                                        .foregroundColor(.secondary)
                                    Spacer()
                                    
                                    Text(produkt.price, format: .currency(code: "USD"))
                                        .font(.headline)
                                        .foregroundColor(.accentColor)
                                }
                                
                        
                            }
                            .padding(.vertical, 4)
                            
                        }
                    }
                
                }
            }
            
            .scrollContentBackground(.hidden)
            .background(
                RoundedRectangle(cornerRadius: 20)
                .fill(
                LinearGradient(
                gradient: Gradient(colors: [Color.blue, Color.orange]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing))
                
                .shadow(radius: 5)
                                    )
            
            .task {
                print("1")
                await oppdater()
                print("2")
            }
        }
    }
        
        func oppdater() async {
            do {
                produkter = try await lastInnProdukt(urlString: "https://dummyjson.com/products")
            }
            catch {
                print(error.localizedDescription)
            }
            do {
                
            }
        }
    }
    

