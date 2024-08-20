//
//  Home.swift
//  AppCurrency
//
//  Created by Montserrat Gomez on 02/08/24.
//

import SwiftUI

struct Home: View {
	@State var listCurrencies: ListCurrency?
	
	var body: some View {
		
		NavigationStack {
			VStack(alignment: .leading, spacing: 10){
				Text("Home")
					.font(.custom("NotoSansJP-Black", size: 28))
				
				///Card
				CardView(listCurrencies: $listCurrencies)
					.offset(x: 30)
				Image("convertir")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 40, height: 40, alignment: .center)
				CardView(listCurrencies: $listCurrencies)
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
