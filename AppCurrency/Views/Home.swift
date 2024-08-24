//
//  Home.swift
//  AppCurrency
//
//  Created by Montserrat Gomez on 02/08/24.
//TODO: Guardar en UserDefaults

import SwiftUI

struct Home: View {
	
	//MARK: Propiedades
	
	@State var listCurrencies: ListCurrency?
	@State var convertResult: Convert?
	
	@State private var amount: Double = 1.0
	@State private var fromCurrency: String = "USD"
	@State private var toCurrency: String = "MXN"
	@State var result: String = "0.0"
	
	@State var offsetX: CGFloat = UIScreen.main.bounds.midX - 235
	
	@State var savedConversions: [ResultConversion] = []
	
	let defaults = UserDefaults.standard
	let resultKey = "CONVERT-RESUTL"
	
	
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
					
				HStack(alignment: .center){
					Spacer()
					Image("convertir")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(width: 40, height: 40, alignment: .center)
					Spacer()
				}
				.padding(5)
				
				CardViewLeft(listCurrencies: $listCurrencies, toCurrency: $toCurrency, convertResult: $result)
					.offset(x: offsetX)
					.onChange(of: toCurrency){
						print("DEBUG: fromCurrency cambiado")
						Task{
							await callConvert()
						}
					}

				//MARK: Guardados
				
				Text("Guardados")
					.font(.callout)
				
				List(savedConversions){ element in
					RowItem(numero1: String(element.amount), moneda1: element.fromCurrency, numero2: element.toCurrency, moneda2: element.result)
				}
				.overlay{
					if savedConversions.isEmpty{
						ContentUnavailableView {
							Label("No hay elementos", systemImage: "australiandollarsign.circle")
								.labelStyle(.iconOnly)
						} description: {
							Text("Guarda tu conversión favorita")
						}
					}
					
				}

				
				
			}
			.gesture(drag)
			
		}
		.task {
			do {
				listCurrencies = try await getCurrencies()
			}
			catch {
				
			}
		}
		.onAppear{
			loadConversions()
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
			result = String(format: "%.2f", convertion)
			
			
			
			print("Conversion successful: \(String(describing: convertResult))")
		} catch {
			print("Error converting currency: \(error.localizedDescription)")
		}
	}
	
	var drag: some Gesture {
		DragGesture()
			.onChanged { value in
				print("DEBUG: empezo arrastre")
				withAnimation(.spring){
					offsetX = value.translation.width
					
					
					
				}
				
				
			}
			.onEnded { value in
				print("DEBUG: Termino")
				withAnimation(.spring){
					offsetX = -55
				
					let newResult = ResultConversion(id: UUID(), amount: amount, fromCurrency: fromCurrency, toCurrency: toCurrency, result: result)
					
					savedConversions.append(newResult)
					
					do {
						let encodedData = try JSONEncoder().encode(savedConversions)
						defaults.set(encodedData, forKey: resultKey)
					} catch {
						print("Error encoding data: \(error.localizedDescription)")
					}
					
					
				}
			}
		
	}
	
	func loadConversions() {
		if let savedData = defaults.data(forKey: resultKey) {
			do {
				savedConversions = try JSONDecoder().decode([ResultConversion].self, from: savedData)
			} catch {
				print("Error decoding data: \(error.localizedDescription)")
			}
		}
	}
	
	
	
}


#Preview {

	Home()

}

