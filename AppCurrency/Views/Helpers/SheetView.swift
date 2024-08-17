//
//  SheetView.swift
//  AppCurrency
//
//  Created by Montserrat Gomez on 13/08/24.
//

import SwiftUI

struct SheetView: View {
	
	@Environment(CallMethods.self) var methods
	@State private var selectedFruit: String = "MXN"
	
	var body: some View {
		VStack {
			Menu(content: {
				Picker("Moneda", selection: $selectedFruit) {
					ForEach(methods.currencyList?.currencies.sorted(by: <) ?? [], id: \.key) { element in
						Text(element.value)
					}
				}
			}, label: {
				(Text("\(selectedFruit)  ") + Text(Image(systemName: "chevron.up")))
			})
			.padding(.all, 16)
			.foregroundStyle(Color.white)
			.background(RoundedRectangle(cornerRadius: 16).fill(Color.black))
			
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
		.background(Color(UIColor.lightGray).opacity(0.4))

	}
}
#Preview {
//	let methods = CallMethods()
//	methods.currencyList = List(success: true, currencies: ["USD": "Dollar", "EUR": "Euro"])
	SheetView()
		.environment(CallMethods())
//
}
