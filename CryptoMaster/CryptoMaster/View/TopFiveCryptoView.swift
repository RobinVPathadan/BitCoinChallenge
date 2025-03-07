//
//  ContentView.swift
//  CryptoMaster
//
//  Created by robin on 06/03/25.
//

import SwiftUI

struct TopFiveCryptoView: View {
    @StateObject private var cryptoViewModel = TopFiveCryptoViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Crypto")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading)
                
                Text("Account Value")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.leading)
                
                Text("$11,542.21")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading)
                
                HStack {
                    Button(action: {}) {
                        Text("↑ Send")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: 140)
                            .background(Color.black)
                            .cornerRadius(50)
                    }
                    Button(action: {}) {
                        Text("↓ Receive")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: 140)
                            .background(Color.black)
                            .cornerRadius(50)
                    }
                }
                .padding(.horizontal)
                
                List(cryptoViewModel.cryptos) { crypto in
                    NavigationLink(destination: CryptoDetailView(crypto: crypto)){
                        CryptoRowView(crypto: crypto)
                    }
                }
                .onAppear {
                    cryptoViewModel.fetchData()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    TopFiveCryptoView()
}
