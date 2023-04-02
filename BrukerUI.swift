
//  NettbutikkappApp.swift
//  Nettbutikkapp
//  Created by Noah on 14/03/2023.

    import SwiftUI

    struct BrukerUI: View {
        
    var brukerinfo: Bruker
        
        var body: some View {
            VStack{
                Section{
                    
                    Text("BrukerInfo")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .font(.system(size: 18))
                        .foregroundColor(.red)
                    
                    
                    HStack {
                        Text("Fornavn:")
                        Text(brukerinfo.firstName)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.orange)
                                    .shadow(radius: 5))
                    }
                    
                    HStack {
                        Text("Etternavn:")
                        Text(brukerinfo.lastName)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.orange)
                                    .shadow(radius: 5))
                    }
                    
                    HStack {
                        Text("Brukernavn:")
                        Text(brukerinfo.username)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.orange)
                                    .shadow(radius: 5))
                    }
                    
                    HStack {
                        Text("Passord:")
                        Text(brukerinfo.password)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.orange)
                                    .shadow(radius: 5))
                    }
                    
                    HStack {
                        Text("Email:")
                        Text(brukerinfo.email)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.orange)
                                    .shadow(radius: 5))
                        
                    }
                    HStack {
                        Text("telefonnummer:")
                        Text(brukerinfo.phone)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.orange)
                                    .shadow(radius: 20))
                    }
                }
            }
            
            .padding()
            
            .background(
                RoundedRectangle(cornerRadius: 20)
                .fill(
                LinearGradient(
                gradient: Gradient(colors: [Color.blue, Color.orange]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing))
                
                .shadow(radius: 5))

        }
    }


