//
//  modelCurrency.swift
//  AppCurrency
//
//  Created by Montserrat Gomez on 05/08/24.
//

import Foundation

typealias Coin = [String: String]


struct CoinSelected: Codable {
	var date: String
	var ada: [String: Double]
}

enum CoinErrors : Error {
	case invalidURL
	case invalidResponse
	case invalidData
}
