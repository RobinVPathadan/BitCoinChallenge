//
//  APIService.swift
//  CryptoMaster
//
//  Created by robin on 06/03/25.
//
import Foundation

private var cryptoViewModel = TopFiveCryptoViewModel()
class APIService {
    // Fetch and parse the cryptocurrency data with caching for 1 day
    class  func fetchCryptoCurrencyData(completion: @escaping ([Cryptocurrency]?) -> Void) {
        let urlString = cryptoViewModel.baseUrlString +  "/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=5&page=1"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10)
        request.addValue("public, max-age=86400", forHTTPHeaderField: "Cache-Control")
        let cache = URLCache(memoryCapacity: 10 * 1024 * 1024, diskCapacity: 50 * 1024 * 1024, diskPath: "cryptoCache")
        if let cachedResponse = cache.cachedResponse(for: request),
           let cachedData = try? JSONDecoder().decode([Cryptocurrency].self, from: cachedResponse.data) {
            print("Using cached data")
            completion(cachedData)
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let response = response, error == nil else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let cryptoList = try decoder.decode([Cryptocurrency].self, from: data)
                let cachedResponse = CachedURLResponse(response: response, data: data, userInfo: nil, storagePolicy: .allowed)
                cache.storeCachedResponse(cachedResponse, for: request)
                completion(cryptoList)
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }
        task.resume()
    }
}

