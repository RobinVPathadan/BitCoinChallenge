//
//  CryptoDetailView.swift
//  CryptoMaster
//
//  Created by robin on 06/03/25.
//
import SwiftUI

struct CryptoDetailView: View {
    let crypto: Cryptocurrency
    
    var body: some View {
        VStack {
            Text(crypto.name)
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .navigationTitle(crypto.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

