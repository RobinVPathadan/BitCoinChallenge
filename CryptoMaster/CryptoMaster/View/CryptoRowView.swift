//
//  CryptoRowView.swift
//  CryptoMaster
//
//  Created by robin on 06/03/25.
//
import SwiftUI

struct CryptoRowView: View {
    let crypto: Cryptocurrency
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: crypto.image)) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView() // Shows a loading indicator
            }
            .frame(width: 40, height: 40)
            
            VStack(alignment: .leading) {
                Text(crypto.name)
                    .font(.headline)
                Text("$" + String(crypto.current_price))
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("" + String(crypto.high_24h))
                    .font(.subheadline)
                    .foregroundColor(.black)
                Text("" + String(crypto.low_24h))
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white)
        .padding(.horizontal)
    }
}

