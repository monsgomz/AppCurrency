//
//  Home.swift
//  AppCurrency
//
//  Created by Montserrat Gomez on 02/08/24.
//

import SwiftUI

struct Home: View {
//	@State  var currencyList: List? // se guardan los valores
	@Environment(CallMethods.self) var methods
	
    var body: some View {
		
		NavigationStack {
			VStack(alignment: .leading, spacing: 10){
				/// Home
				
				Image("icono")
					.resizable()
					.scaledToFit()
					.frame(width: 35, height: 35, alignment: .center)
					.padding(.bottom)
				Text("Hola!")
					.font(.custom("Noto Sans JP Black", size: 25))
					.padding(.bottom)

				///Favoritos
				
				Text("Favoritos")
					.font(.custom("Noto Sans JP Thin", size: 16))
					.padding(.bottom)
				 
					ScrollView(.horizontal){
						HStack{
						FavoritosView()
						FavoritosView()
						FavoritosView()
						FavoritosView()
						FavoritosView()
						FavoritosView()
					}
				}
				
				/// Comunes
				Text("Algunas monedas: ")
					.font(.custom("Noto Sans JP Thin", size: 16))
				
				ScrollView{
					LazyVStack(spacing: 10){ //TODO: ponerle filtro cambiable
						ForEach(methods.currencyList?.currencies.prefix(10) .sorted(by: <) ?? [], id: \.key) { element in
							MonedaItem(monedaNombre: element.value, nombreCorto: element.key)
							
						}
						
					}
					
				}
				
			}
			.font(.custom("Noto Sans JP Regular", size: 16))
			.padding(10)
	//		.ignoresSafeArea()
			.overlay(alignment: .topTrailing){
				NavigationLink(destination: ConverterView()){
					ZStack{
						Circle()
							.fill(Color("purplePastel"))
							.frame(width: 220, height: 220)
							.offset(x:120 , y:-170)
						Image("convertir")
							.resizable()
							.scaledToFit()
							.frame(width: 40, height: 40)
							.offset(x:70 , y:-120)
					}
				}
						.environment(methods)
			}
			
		}
		.task {
			do {
				methods.fetchCurrencies()
			}
			
		}
		
		
    }
}

#Preview {
//	let methods = CallMethods()
//	methods.currencyList = List(success: true, currencies: ["USD": "Dollar", "EUR": "Euro"])
//	
	Home()
		.environment(CallMethods())
}
