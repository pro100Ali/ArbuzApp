//
//  BasketView.swift
//  ArbuzAppSwiftUI
//
//  Created by Али  on 23.05.2023.
//

import SwiftUI

struct BasketView: View {
    @Binding var basketItems: [BasketItem]
    @State private var isPresented = false
    
    var body: some View {
        if basketItems.isEmpty {
            Text("Your basket is empty.")
                .font(.title)
                .foregroundColor(.gray)
                .padding()
        } else {
            VStack(spacing: 10) {
                ForEach(basketItems) { item in
                    HStack {
                        Image(item.product.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipped()
                        Text(item.product.name)
                        Spacer()
                        
                        Text("Count: \(String(format: "%.2f", item.count))")
                        
                        Text("Total cost: \((item.product.price * Int(item.count)))")
                    }
                }
                Spacer()
                
                Button {
                    isPresented.toggle()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16).foregroundColor(.green).frame(height: 60)
                        Text("Subscribe").foregroundColor(.white)
                    }
                }.sheet(isPresented: $isPresented) {
                    PresentedView()
                }
            }
            .padding()
            .listStyle(InsetGroupedListStyle())
        }
        
    }
    
    
}

//struct BasketView_Previews: PreviewProvider {
//    static var previews: some View {
//        BasketView()
//    }
//}
