//
//  ArbuzAppSwiftUIApp.swift
//  ArbuzAppSwiftUI
//
//  Created by Али  on 22.05.2023.
//

import SwiftUI

@main
struct ArbuzAppSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(subscriptionItems: SubscriptionModel.init())
        }
    }
}
