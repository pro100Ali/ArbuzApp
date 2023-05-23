//
//  PresentedView.swift
//  ArbuzAppSwiftUI
//
//  Created by Али  on 23.05.2023.
//

import SwiftUI

struct PresentedView: View  {
    @State private var selectedSubscriptionDuration = 0
    @State private var selectedDayOfWeek = 0
    @State private var selectedDeliveryPeriod = 0
    @State private var deliveryAddress = ""
    @State private var customerPhoneNumber = ""
    
    @StateObject var subscriptionModel = SubscriptionModel()
    
    let daysOfWeek = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    let deliveryPeriods = ["Morning", "Afternoon", "Evening"]
    let subscriptionDuration = ["1 month", "2 month", "3 month"]
    var body: some View {
        VStack {
            VStack{
                Text("Delivery days").foregroundColor(.gray).frame(alignment: .leading)

                Picker("Day of Week", selection: $selectedDayOfWeek) {
                    ForEach(0..<daysOfWeek.count) { index in
                        Text(daysOfWeek[index])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
          
            
            VStack {
                Text("Delivery periods").foregroundColor(.gray).frame(alignment: .leading)
                Picker("Delivery Period", selection: $selectedDeliveryPeriod) {
                    ForEach(0..<deliveryPeriods.count) { index in
                        Text(deliveryPeriods[index])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
       
            
            TextField("Delivery Address", text: $deliveryAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Customer Phone Number", text: $customerPhoneNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            VStack {
                Text("Duration of subcription").foregroundColor(.gray).frame(alignment: .leading)
                Picker("Duration of subcription", selection: $selectedSubscriptionDuration) {
                    ForEach(0..<subscriptionDuration.count) { index in
                        Text(subscriptionDuration[index])
                    }
                }.pickerStyle(SegmentedPickerStyle())

              
            }
            Spacer()

            
            
            Button {
                subscriptionModel.subscribe(day: daysOfWeek[selectedDayOfWeek], period: deliveryPeriods[selectedDeliveryPeriod], addressHouse: deliveryAddress, number: customerPhoneNumber)
 
                print(subscriptionModel.dayOfTheWeek)
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16).foregroundColor(.green).frame(height: 60)
                    Text("Subscribe").foregroundColor(.white)
                }
            }
            
        }
        .padding()
    }
}

struct PresentedView_Previews: PreviewProvider {
    static var previews: some View {
        PresentedView()
    }
}
