//
//  CurrencyMV.swift
//  AppCurrency
//
//  Created by Montserrat Gomez on 05/08/24.
//

/* 
 iOS 9.0 and macOS 10.11 and later use App Transport Security (ATS) for all HTTP connections made with URLSession.
 
 API KEY f28408ce4118652a78e6a6b50cf25443
 https://api.exchangerate.host/live?access_key=
 
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
class CallMethods {
	var currencyList = [ListCurrency]()
	
}


func getCurrencies() async throws -> ListCurrency {
	/*
	 - Creating URL
	 - Fetching
	 - Decode
	 */
	
	///creating URL
	let endpoint = "https://api.exchangerate.host/list?access_key=f28408ce4118652a78e6a6b50cf25443"
	
	guard let url = URL(string: endpoint) else {
		print("DEBUG: invalid url")
		throw errors.invalidURL
	}
	
	///decodign
	do {
		///Fetching
		let (data, response) = try await URLSession.shared.data(from: url)
		
		///check the response
		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
			print("Invalid response")
			throw errors.invalidResponse
		}
		
		 let decoder = JSONDecoder()
		return try decoder.decode(ListCurrency.self, from: data)
		
	} catch {
		throw errors.invalidData
	}
	
}

// get conversion
func getConvert(from: String, to: String, amount: Double) async throws -> Convert {
	
	///creating URL
	
	var urlComponents = URLComponents()
	urlComponents.scheme = "https"
	urlComponents.host = "api.exchangerate.host"
	urlComponents.path = "/convert"
	urlComponents.queryItems = [
	URLQueryItem(name: "from", value: from),
	URLQueryItem(name: "to", value: to),
	URLQueryItem(name: "amount", value: String(amount)),
	URLQueryItem(name: "access_key", value: "f28408ce4118652a78e6a6b50cf25443")
	]
	
//	let endpoint = "https://api.exchangerate.host/convert?from=CAD&to=MXN&amount=234&access_key=f28408ce4118652a78e6a6b50cf25443"
//	

	guard let url = urlComponents.url else {
		print("DEBUG: INVALID URL")
		throw errors.invalidURL
	}
	
	print(url)
	///decoding
	
	do {
		///Fetching
		let (data, response) = try await URLSession.shared.data(from: url)
		
		///check the response
		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
			print("Invalid response")
			throw errors.invalidResponse
		}
		
		let decoder = JSONDecoder()
		return try decoder.decode(Convert.self, from: data)
		
	} catch {
		throw errors.invalidData
	}
	
	
	
	
}

