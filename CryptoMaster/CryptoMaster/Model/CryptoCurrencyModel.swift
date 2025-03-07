//
//  CryptoCurrencyModel.swift
//  CryptoMaster
//
//  Created by robin on 06/03/25.
//
// Define a structure to store cryptocurrency data
struct Cryptocurrency: Decodable, Identifiable {
    //let id = UUID()
    let id: String
    let name: String
    let current_price: Double
    let image: String
    let high_24h: Double
    let low_24h: Double
    let last_updated: String
}

