//
//  CardView.swift
//  AppCurrency
//
//  Created by Montserrat Gomez on 19/08/24.
//

import SwiftUI

struct CardView: View {
	@Binding var listCurrencies: ListCurrency?
	@State var selectedCurrency: String = ""
	
    var body: some View {
		
		VStack (alignment: .leading){
			Text("Moneda")
				.font(.custom("NotoSansJP-Black", size: 21))
				.foregroundStyle(.white)
				.padding(.top, 8)
			Spacer()
			HStack(alignment: .center){
				Text("$123.00")
					.font(.custom("NotoSansJP-Black", size: 24))
				Spacer()
				Picker(selection: .constant(1), label: Text("Picker")) {
					ForEach(listCurrencies?.currencies.sorted(by: <) ?? [], id: \.key){ element in
						Text(element.key).tag(element.key)
					}
				}
				.pickerStyle(.menu)
				.background(
					RoundedRectangle(cornerRadius: 25.0)
						.stroke(.white, lineWidth: 1)
						
				)
				Spacer()
				
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
	return CardView(listCurrencies: $currencies)
}
