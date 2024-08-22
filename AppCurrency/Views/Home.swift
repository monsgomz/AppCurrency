//
//  Home.swift
//  AppCurrency
//
//  Created by Montserrat Gomez on 02/08/24.
//TODO: Añadir el resultado en un campo

import SwiftUI

struct Home: View {
	
	//MARK: Propiedades
	
	@State var listCurrencies: ListCurrency?
	@State var convertResult: Convert?
	@State private var amount: Double = 1.0
	@State private var fromCurrency: String = "USD"
	@State private var toCurrency: String = "MXN"
	@State var result: String = "0.0"
	
	var body: some View {
		
		NavigationStack {
			VStack(alignment: .leading, spacing: 10){
				Text("Home")
					.font(.custom("NotoSansJP-Black", size: 28))
				
				//MARK: Cards
				
				CardViewRight(listCurrencies: $listCurrencies, fromCurrency: $fromCurrency, amount: $amount)
					.offset(x: 30)
					.onChange(of: amount){
						print("DEBUG: fromCurrency cambiado")
						Task{
							await callConvert()
						}
					}
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
				
				Image(systemName: "star.fill")
				
				CardViewLeft(listCurrencies: $listCurrencies, toCurrency: $toCurrency, convertResult: $result)
					.offset(x: -30)
					.onChange(of: toCurrency){
						print("DEBUG: fromCurrency cambiado")
						Task{
							await callConvert()
						}
					}

				//MARK: Guardados
				
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
	
	/// funcion para llamar a la API para convertir
	/// Resutl: Optional(AppCurrency.Convert(success: true, query: AppCurrency.Query(from: "CAD", to: "MXN", amount: 200.5), info: AppCurrency.Info(timestamp: 1724358676, quote: 14.324547), result: 2872.071674))
	func callConvert() async {
		// Validar amount
		let number = amount < 0.0 ? 1.0 : amount
		
		// Validar fromCurrency y toCurrency
		let fromC = fromCurrency.isEmpty ? "MXN" : fromCurrency
		let toC = toCurrency.isEmpty ? "CAD" : toCurrency
		
		do {
			convertResult = try await getConvert(from: fromC, to: toC, amount: number)
			var convertion = convertResult?.result ?? 0.0
			convertion = convertion.rounded()
			result = String(format: "%.2f", convertion)
			
			
			
			print("Conversion successful: \(String(describing: convertResult))")
		} catch {
			print("Error converting currency: \(error.localizedDescription)")
		}
	}
}


#Preview {

	Home()

}

