//
//  TopFiveCryptoViewModel.swift
//  CryptoMaster
//
//  Created by robin on 06/03/25.
//
import Foundation


class TopFiveCryptoViewModel: ObservableObject {
    @Published var cryptos: [Cryptocurrency] = []
    let baseUrlString = "https://api.coingecko.com"
    func fetchData() {
        APIService.fetchCryptoCurrencyData{ cryptoList in
            DispatchQueue.main.async{
                self.cryptos = cryptoList ?? []
            }
        }
    }
}

