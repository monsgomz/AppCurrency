//
//  Home.swift
//  AppCurrency
//
//  Created by Montserrat Gomez on 02/08/24.
//TODO: poner los state de listas qui y hacer llamada de api convert

import SwiftUI

struct Home: View {
	@State var listCurrencies: ListCurrency?
	@State var convertResult: Convert?
	@State var selectedCurrencyL: String = "MXN"
	@State private var amount: Double = 1.0
	@State private var fromCurrency: String = ""
	@State private var toCurrency: String = ""
	
	var body: some View {
		
		NavigationStack {
			VStack(alignment: .leading, spacing: 10){
				Text("Home")
					.font(.custom("NotoSansJP-Black", size: 28))
				
				///Card
				CardViewRight(listCurrencies: $listCurrencies, fromCurrency: $fromCurrency, amount: $amount)
					.offset(x: 30)
					.onChange(of: amount){
						print("DEBUG: amount cambiado")
					}
					
				
				Image("convertir")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 40, height: 40, alignment: .center)
				
				CardViewLeft(listCurrencies: $listCurrencies, toCurrency: $toCurrency)
					.offset(x: -30)
				

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
}

#Preview {

	Home()

}

func callConvert() {
	
}
