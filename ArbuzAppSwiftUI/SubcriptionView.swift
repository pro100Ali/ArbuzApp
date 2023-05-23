//
//  SubcriptionView.swift
//  ArbuzAppSwiftUI
//
//  Created by Али  on 23.05.2023.
//

import SwiftUI

struct SubcriptionView: View {
    @State private var isSubscribed = false
//    @ObservedObject  var subscriptionDetails: SubscriptionModel
        @ObservedObject var subscriptionItems: SubscriptionModel
        @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            Text("\(subscriptionItems.phoneNumber)eweqew")
//            if subscriptions.isEmpty {
//                Text("You have no subscriptions")
//                    .font(.title)
//                    .foregroundColor(.gray)
//                    .padding()
//            } else {
//                List(subscriptions) { subscription in
//                    NavigationLink(destination: SubscriptionDetail(subscription: subscription)) {
//                        VStack(alignment: .leading) {
//                            Text(subscriptionModel.subscriptionPeriod)
//                                .font(.headline)
//                            Text(subscriptionModel.dayOfTheWeek)
//                                .font(.subheadline)
//                                .foregroundColor(.gray)
//                        }
//                    }
        }.onAppear {
            print(subscriptionItems.dayOfTheWeek)
        }
                .navigationTitle("Subscriptions")
            }
        }
//    }
//}



struct SubscriptionDetail: View {
    let subscription: SubscriptionModel
    
    var body: some View {
        VStack {
            Text(subscription.dayOfTheWeek)
                .font(.headline)
            Text(subscription.phoneNumber)
                .font(.subheadline)
                .foregroundColor(.gray)
            Spacer()
        }
        .padding()
        .navigationTitle(subscription.phoneNumber)
    }
}
