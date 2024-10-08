//
//  RowItem.swift
//  AppCurrency
//
//  Created by Montserrat Gomez on 22/08/24.
//

import SwiftUI

struct RowItem: View {
	
	var numero1: String
	var moneda1: String
	var numero2: String
	var moneda2: String
	
    var body: some View {
		
		HStack(spacing: 0){
			
			Text("$\(numero1)")
				.font(.custom("NotoSansJP-Black", size: 18))
				.padding(.leading, 10)
			Text("\(moneda1)")
				.font(.custom("NotoSansJP-Black", size: 18))
				.padding(.leading, 8)
			
			Spacer()
			Text("=")
			Spacer()
			
				.font(.custom("NotoSansJP-Black", size: 18))
			Text("$\(numero2)")
				.font(.custom("NotoSansJP-Black", size: 18))
				.padding(.trailing, 8)
			Text("\(moneda2)")
				.font(.custom("NotoSansJP-Black", size: 18))
				.padding(.trailing, 10)
		}
		.frame(width: 350, height: 30, alignment: .center)
		.padding(8)
		.background(
		RoundedRectangle(cornerRadius: 15.0)
			.fill(.greenPastel)
		)
    }
}

#Preview {
	RowItem(numero1: "1", moneda1: "MXN", numero2: "2", moneda2: "CAD")
}
