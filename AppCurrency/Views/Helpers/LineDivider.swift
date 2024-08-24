//
//  LineDivider.swift
//  AppCurrency
//
//  Created by Montserrat Gomez on 22/08/24.
//

import SwiftUI

struct LineDivider: Shape{
	func path(in rect: CGRect) -> Path {
		Path { path in
			path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
			path.addLine(to: CGPoint(x: rect.minX, y: rect.maxX))
			path.closeSubpath()
		}
	}
}

struct LineDividerView: View {
    var body: some View {
		VStack{
			LineDivider()
				.stroke(Color.red , lineWidth: 9.0)
				.frame(width: 70, height: 70, alignment: .center)
				
		}
    }
}

#Preview {
    LineDividerView()
}
