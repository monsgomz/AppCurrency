//
//  modelCurrency.swift
//  AppCurrency
//
//  Created by Montserrat Gomez on 05/08/24.
//

import Foundation

//MARK: list https://api.exchangerate.host/list?access_key=f28408ce4118652a78e6a6b50cf25443
struct ListCurrency: Codable {
	var success: Bool
//	var terms, privacy: String
	var currencies: [String: String]
}

//MARK: live
struct Live: Codable {
	var success: Bool
//	var terms, privacy: String
	var timestamp: Int
	var source: String
	var quotes: [String: Double]
}

//MARK: convert https://api.exchangerate.host/convert?from=EUR&to=GBP&amount=100&access_key=f28408ce4118652a78e6a6b50cf25443
struct Convert: Codable {
	var success: Bool
//	var terms, privacy: String
	var query: Query
	var info: Info
	var result: Double
}

struct Info: Codable {
	var timestamp: Int
	var quote: Double
}

struct Query: Codable {
	var from, to: String
	var amount: Int
}

//MARK: timeframe https://api.exchangerate.host/timeframe?currencies=USD,GBP,EUR&start_date=2010-03-01&end_date=2010-04-01&access_key=f28408ce4118652a78e6a6b50cf25443
struct Timeframe: Codable {
	var success: Bool
//	var terms, privacy: String
	var timeframe: Bool
	var startDate, endDate, source: String
	var quotes: [String: [String: Double]]
	
	enum CodingKeys: String, CodingKey {
		case success, timeframe
		case startDate = "start_date"
		case endDate = "end_date"
		case source, quotes
	}
}

enum errors: Error {
	case invalidURL
	case invalidResponse
	case invalidData
}
