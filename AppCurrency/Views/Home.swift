//
//  Home.swift
//  AppCurrency
//
//  Created by Montserrat Gomez on 02/08/24.
//

import SwiftUI

struct Home: View {
	@State var listCurrencies: ListCurrency?
	@State var convertResult: Convert?
	@State private var amount: Double = 1.0
	@State private var fromCurrency: String = "USD"
	@State private var toCurrency: String = "MXN"
	
	var body: some View {
		
		NavigationStack {
			VStack(alignment: .leading, spacing: 10){
				Text("Home")
					.font(.custom("NotoSansJP-Black", size: 28))
				
				///Card
				CardViewRight(listCurrencies: $listCurrencies, fromCurrency: $fromCurrency, amount: $amount)
					.offset(x: 30)
//					.onChange(of: amount){
//						print("DEBUG: amount cambiado")
//					}
					.onChange(of: fromCurrency){
						print("DEBUG: fromCurrency cambiado")
						Task{
							await callConvert()
						}
					}
					
				
				Image("convertir")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 40, height: 40, alignment: .center)
				
				CardViewLeft(listCurrencies: $listCurrencies, toCurrency: $toCurrency)
					.offset(x: -30)
					.onChange(of: toCurrency){
						print("DEBUG: tocurrency cambiado")
					}

				///Guardados
				
				Text("Guardados")
					.font(.callout)
				
				Spacer()
			}
			
		}
		.task {
			do {
				listCurrencies = try await getCurrencies()
			}
			catch {
				
			}
		}
		
		
		
		
	}
	func callConvert() async {
		// Validar amount
		let number = amount < 0.0 ? 1.0 : amount
		
		// Validar fromCurrency y toCurrency
		let fromC = fromCurrency.isEmpty ? "MXN" : fromCurrency
		let toC = toCurrency.isEmpty ? "CAD" : toCurrency
		
		do {
			convertResult = try await getConvert(from: fromC, to: toC, amount: number)
			print("Conversion successful: \(String(describing: convertResult))")
		} catch {
			print("Error converting currency: \(error.localizedDescription)")
		}
	}
}


#Preview {

	Home()

}

