//
//  CardViewLeft.swift
//  AppCurrency
//
//  Created by Montserrat Gomez on 19/08/24.
//

import SwiftUI

struct CardViewLeft: View {
	
	@Binding var listCurrencies: ListCurrency?
	@Binding var toCurrency: String
	@Binding var convertResult : Convert?
	
    var body: some View {
		HStack (){
			Rectangle()
				.fill(Color.purplePastel)
				.frame(width: 55, height: 100, alignment: .center)
				
			VStack(alignment: .leading){
				Text("Moneda")
					.font(.custom("NotoSansJP-Black", size: 21))
					.foregroundStyle(.white)
					.padding(.top, 8)
				Spacer()
				HStack(alignment: .center){

					Picker(selection: $toCurrency, label: Text("Picker")) {
						ForEach(listCurrencies?.currencies.sorted(by: <) ?? [], id: \.key){ element in
							Text(element.key).tag(element.key)
						}
					}
					.pickerStyle(.menu)
					.frame(width: 115, alignment: .center)
					.background(
						RoundedRectangle(cornerRadius: 25.0)
							.stroke(.white, lineWidth: 1)
						
					)
					Spacer()
					Text("$123.00")
						.font(.custom("NotoSansJP-Black", size: 24))
						.padding(.trailing, 8)
					
				}
			}
			.padding(.bottom, 8)
		}
		.frame(width: 350, height: 105, alignment: .center)
		.padding(10)
		.padding(.leading, 8)
		.background(
			RoundedRectangle(cornerRadius: 25.0)
				.fill(Color.purplePastel)
		)
    }
}

#Preview {
	@State var currencies: ListCurrency? = ListCurrency(success: true, currencies: ["MXN": "Moneda Mexicana", "CAN": "Canada"])
	@State var toCurrency: String = "MXN"
	@State var convertResult: Convert?
	return CardViewLeft(listCurrencies: $currencies, toCurrency: $toCurrency, convertResult: convertResult)
}
