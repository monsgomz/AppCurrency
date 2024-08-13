//
//  CurrencyMV.swift
//  AppCurrency
//
//  Created by Montserrat Gomez on 05/08/24.
//

/* API KEY f28408ce4118652a78e6a6b50cf25443
 http://api.exchangerate.host/live?access_key=
 GET:
 - lista: /list
 - live: /live informacion reciente
 - historical: https://api.exchangerate.host/historical?date=YYYY-MM-DD para una fecha en especifico
 - convert: https://api.exchangerate.host/convert?from=EUR&to=GBP&amount=100 convertir
 -timeframe: https://api.exchangerate.host/timeframe?start_date=2015-01-01&end_date=2015-05-01 en un periodo de tiempo
 - change: https://api.exchangerate.host/change?currencies=USD,EUR cambiar los parametros
 
*/

import Foundation

@Observable
class CurrencyMV {
	var currencies = [Coin]()

}


func getCurrencies() async throws -> Coin {
	
	let endpoint = "https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/currencies.json"
	
	guard let url = URL(string: endpoint) else {
		print("DEBUG: invalid url")
		throw CoinErrors.invalidURL
	}
	
	let (data, response) = try await URLSession.shared.data(from: url)
	
	///check the response
	guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
		print("Invalid response")
		throw CoinErrors.invalidResponse
	}
	
	do {
		 let decoder = JSONDecoder()
		return try decoder.decode(Coin.self, from: data)
		
	} catch {
		throw CoinErrors.invalidData
	}
	
}

