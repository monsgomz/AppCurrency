//
//  CardView.swift
//  AppCurrency
//
//  Created by Montserrat Gomez on 19/08/24.
//

import SwiftUI

struct CardViewRight: View {
	@Binding var listCurrencies: ListCurrency?
	@Binding var fromCurrency: String
	@Binding var amount: Double

    var body: some View {
		
		VStack (alignment: .leading){
			Text("Moneda")
				.font(.custom("NotoSansJP-Black", size: 21))
				.foregroundStyle(.white)
				.padding(.top, 8)
			
			Spacer()
			
			HStack(alignment: .center, spacing: 0){
				Text("$")
					.font(.custom("NotoSansJP-Black", size: 24))
				
				TextField("amount", value: $amount, format: .number)
					.keyboardType(.numberPad)
					.font(.custom("NotoSansJP-Black", size: 24))
					
				Spacer()
				Picker(selection: $fromCurrency, label: Text("Picker")) {
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
				.padding(.trailing, 58)

				
			}
			.padding(.bottom, 8)
		}
		.frame(width: 350, height: 105, alignment: .center)
		.padding(10)
		.padding(.leading, 8)
		.background(
			RoundedRectangle(cornerRadius: 25.0)
				.fill(Color.lilaPastel)
		)
    }
}

#Preview {
	@State var currencies: ListCurrency? = ListCurrency(success: true, currencies: ["MXN": "Moneda Mexicana"])
	@State var fromCurrency: String = "MXN"
	@State var amount: Double = 1.0
	return CardViewRight(listCurrencies: $currencies, fromCurrency: $fromCurrency, amount: $amount)
}
