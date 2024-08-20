//
//  CardView.swift
//  AppCurrency
//
//  Created by Montserrat Gomez on 19/08/24.
//

import SwiftUI

struct CardView: View {
    var body: some View {
		VStack (alignment: .leading){
			Text("Moneda")
				.font(.custom("NotoSansJP-Black", size: 21))
				.foregroundStyle(.white)
				.padding(.top, 8)
			Spacer()
			HStack {
				Text("$123.00")
					.font(.custom("NotoSansJP-Black", size: 24))
				Spacer()
				Picker(selection: .constant(1), label: Text("Picker")) {
					Text("1").tag(1)
					Text("2").tag(2)
				}
				
			}
			.padding(.bottom, 8)
		}
		.frame(width: 350, height: 110, alignment: .center)
		.padding(8)
		.background(
			RoundedRectangle(cornerRadius: 25.0)
				.fill(Color.lilaPastel)
		)
    }
}

#Preview {
    CardView()
}
