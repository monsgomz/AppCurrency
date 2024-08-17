//
//  SheetView.swift
//  AppCurrency
//
//  Created by Montserrat Gomez on 13/08/24.
//

import SwiftUI

struct SheetView: View {
	@State var showButton: Bool
	@State var selectedOptionIndex: String
	@Environment(CallMethods.self) var methods
	
    var body: some View {
		 var list = methods.currencyList?.currencies
		
		VStack{
			
			VStack{
				Button {
					//accion
				} label: {
					HStack {
						Text("texto")
						Spacer()
						Image(systemName: "chevron.down")
						//añadir rotacion
						
					}
				}
				
				//menu
				
				if(showButton) {
					ScrollView {
						LazyVStack {
							ForEach(list?.sorted(by: <) ?? [], id: \.key) { element in
								Button(action: {
									withAnimation {
										selectedOptionIndex = element.key
										showButton.toggle()
									}
									
								}, label: {
									HStack {
										Text(list?[selectedOptionIndex] ?? "")
										Spacer()
										if (element.key == selectedOptionIndex) {
											Image(systemName: "checkmark.circle.fill")
											
										}
									}
								})
								
								
							}
						}
					}
					
				}
			}
								   

		}
    }
}

#Preview {
//	let methods = CallMethods()
//	methods.currencyList = List(success: true, currencies: ["USD": "Dollar", "EUR": "Euro"])
	SheetView(showButton: false, selectedOptionIndex: "MXN")
		.environment(CallMethods())
}
