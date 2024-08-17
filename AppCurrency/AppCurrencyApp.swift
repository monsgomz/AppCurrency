//
//  AppCurrencyApp.swift
//  AppCurrency
//
//  Created by Montserrat Gomez on 02/08/24.
//

import SwiftUI

@main
struct AppCurrencyApp: App {
	@State private var methods = CallMethods()
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environment(methods)
        }
    }
}
