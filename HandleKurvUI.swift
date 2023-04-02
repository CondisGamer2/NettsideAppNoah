
//  NettbutikkappApp.swift
//  Nettbutikkapp
//  Created by Noah on 14/03/2023.

import SwiftUI

struct HandleKurvUI: View {
    
    @State private var kurver: [Kurven] = []
    
    @State private var kurv: Kurven? = nil
    
    @State private var feilLastingAvData = true
    
    let bruker: Bruker
    
    var Totalsum: Double {
           guard let kurv = kurv else {
               return 0
           }
                return kurv.products.reduce(0) { sum, produkt in
               let price = produkt.price * Double(produkt.quantity ?? 0)
               let discount = price * (Double(produkt.discountPercentage ?? 0) / 100.0)
               return sum + (price - discount)
           }
       }
    var body: some View {
        VStack {
            Text("HandleKurven din")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .font(.system(size: 18))
                .foregroundColor(.primary)
            
            
            
            if let kurv = kurv {
                List(kurv.products) { produkt in
                    HStack(alignment: .center) {
                        VStack(alignment: .leading) {
                            Text(produkt.title)
                                .font(.headline)
                            
                            Text(String(produkt.quantity ?? 0))
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            if let discount = produkt.discountPercentage {
                                Text("Discount: \(discount)%")
                                    .font(.subheadline)
                                    .foregroundColor(.red)
                                
                                
                            }
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text(produkt.price, format: .currency(code: "USD"))
                                .font(.headline)
                            
                            if let discount = produkt.discountPercentage {
                                Text(String(discount))
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .strikethrough()

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
                
                
                VStack {
                    HStack(alignment: .center) {
                        Text("Total summen:")
                            .font(.headline)
                        Text("$\(Totalsum, specifier: "%.2f")")
                            .font(.headline)
                            .foregroundColor(.red)
                    }
                    .padding(.bottom, 100)
                }
            }
            else {
                VStack{
                    Spacer()
                    Text("Du har ingenting i HandleKruven din desverre")
                        .foregroundColor(.red)
                    Spacer()
                }
                .task {
                    do {
                        kurver = try await lastInnHandleKurv(urlString: "https://dummyjson.com/carts/user/\(bruker.id)")
                        kurv = kurver.first
                        feilLastingAvData = false
                    } catch {
                        print(error)
                        feilLastingAvData = false
                    }
                }
                
                Spacer()
            }
        }
    }
}

