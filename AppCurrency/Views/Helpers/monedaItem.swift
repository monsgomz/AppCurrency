//
//  monedaItem.swift
//  AppCurrency
//
//  Created by Montserrat Gomez on 05/08/24.
//

import SwiftUI

struct monedaItem: View {
    var body: some View {
		HStack(alignment: .center, spacing: 15){
			Image(systemName: "dollarsign.arrow.circlepath")
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: 30, height: 30)
//				.foregroundStyle(Color.white)
			Text("Nombre moneda")
			Spacer()
			
		}
		.padding(10)
		.frame(width: UIScreen.main.bounds.width - 20, height: 60)
		.background{
			RoundedRectangle(cornerRadius: 25.0)
				.fill(Color("purplePastel"))
				
			
		}
    }
}

#Preview {
    monedaItem()
}
