//
//  FavoritosView.swift
//  AppCurrency
//
//  Created by Montserrat Gomez on 02/08/24.
//

import SwiftUI

struct FavoritosView: View {
	
	struct lineRectangle: Shape {
		func path(in rect: CGRect) -> Path {
			Path { path in
				path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
				path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
				path.closeSubpath()
			}
		}
	}
	
	var body: some View {
		ZStack(alignment: .center){
			RoundedRectangle(cornerRadius: 45.0)
				.fill(Color("yellowPastel"))
				.frame(width: 130, height: 160, alignment: .center)
			lineRectangle()
				.stroke(lineWidth: 2.0)
				.stroke(Color.white)
				.fill(Color.white)
				.frame(width: 130, height: 160, alignment: .center)
			
		}
		.overlay(alignment: .topLeading) {
			Text("$1\nEURO")
				.font(.custom("Noto Sans JP Black", size: 14))
				.padding([.top, .leading], 25)
		}
		.overlay(alignment: .bottomTrailing) {
			Text("MXN\n$20.40")
				.font(.custom("Noto Sans JP Black", size: 14))
				.padding([.bottom, .trailing], 25)

		}
		
		
	}
}

#Preview {
	FavoritosView()
}
