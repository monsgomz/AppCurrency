//
//  ConverterView.swift
//  AppCurrency
//
//  Created by Montserrat Gomez on 05/08/24.
//

import SwiftUI

struct ConverterView: View {
    var body: some View {
		VStack(alignment: .leading){
			Text("Convertir")
				.font(.custom("Noto Sans JP Black", size: 25))
			Spacer()
		}
		.overlay{
			ContentUnavailableView("No hay monedas a convertir", systemImage: "archivebox", description: Text("Agrega una nueva conversión"))
				.frame(width: 400, height: 300, alignment: .center)
		}
		.overlay(alignment: .topTrailing){
			NavigationLink(destination: ConverterView()){
				ZStack{
					Circle()
						.fill(Color("purplePastel"))
						.frame(width: 220, height: 220)
						.offset(x:240 , y:-170)
					Image(systemName: "plus")
						.resizable()
						.scaledToFit()
						.foregroundStyle(.black)
						.frame(width: 40, height: 40)
						.offset(x:200 , y:-120)
				}
			}
		}
    }
}

#Preview {
    ConverterView()
}
