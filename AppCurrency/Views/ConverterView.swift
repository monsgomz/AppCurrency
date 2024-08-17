//
//  ConverterView.swift
//  AppCurrency
//
//  Created by Montserrat Gomez on 05/08/24.
//

import SwiftUI

struct ConverterView: View {
	@State var showSheet: Bool = false
	
    var body: some View {
		VStack(alignment: .leading){
			Text("Convertir")
				.font(.custom("Noto Sans JP Black", size: 25))
			Spacer()
		}
		.overlay{
			ContentUnavailableView("No hay datos a convertir", systemImage: "archivebox", description: Text("Agrega una nueva conversión"))
				.frame(width: 400, height: 300, alignment: .center)
		}
		.overlay(alignment: .topTrailing){
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
				.onTapGesture {
					showSheet.toggle()
					
					print("clic: \(showSheet)")
				}
			
		}
		.sheet(isPresented: $showSheet, content: {
			Text("Sheet")
		})
    }
}

#Preview {
	ConverterView(showSheet: false)
}
