//
//  SubcriptionModel.swift
//  ArbuzAppSwiftUI
//
//  Created by Али  on 23.05.2023.
//

import Foundation


class SubscriptionModel: ObservableObject, Identifiable {
    @Published var isSubscribed = false
    @Published var dayOfTheWeek = ""
    @Published var subscriptionPeriod = ""
    @Published var address = ""
    @Published var phoneNumber = ""
    
    func subscribe(day: String, period: String, addressHouse: String, number: String) {
        isSubscribed = true
        dayOfTheWeek = day
        subscriptionPeriod = period
        address = addressHouse
        phoneNumber = number
    }
    
    func unsubscribe() {
        // Perform unsubscribe logic
        isSubscribed = false
        
        // Clear the subscription details
        dayOfTheWeek = ""
        subscriptionPeriod = ""
        address = ""
        phoneNumber = ""
    }
}
