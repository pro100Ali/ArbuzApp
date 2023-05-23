//
//  ContentView.swift
//  ArbuzAppSwiftUI
//
//  Created by Али  on 22.05.2023.
//

import SwiftUI



struct ContentView: View {
    
    let milkProducts: [Product] = [
        Product(name: "Milk", image: "moe",count: 1, isWeight: false, price: 500, amountInSclad: 4),
        Product(name: "Yogurt", image: "jogurt",count: 1, isWeight: false, price: 300, amountInSclad: 32),
        Product(name: "Cheese", image: "cheese",count: 1, isWeight: true, price: 200, amountInSclad: 21),
        
        
    ]
    
    let fruits: [Product] = [
        Product(name: "Apple", image: "apple1",count: 0.5, isWeight: true, price: 200, amountInSclad: 4),
        Product(name: "Banana", image: "banana",count: 0.5, isWeight: true, price: 210, amountInSclad: 4),
        Product(name: "Watermelon", image: "watermelon",count: 1, isWeight: true, price: 120, amountInSclad: 4),
        
        
    ]
    
    let seasonalVegetables: [Product] = [
        Product(name: "Carrot", image: "carrot", count: 0.3, isWeight: true, price: 120, amountInSclad: 5),
        Product(name: "Potato", image: "potato", count: 0.3, isWeight: true, price: 90, amountInSclad: 8),
        Product(name: "Cabbage", image: "cabbage", count: 1, isWeight: false, price: 120, amountInSclad: 9),
        
    ]
    @State private var basketItems: [BasketItem] = []
    @State private var isPresented = false
    
    @StateObject private var subscription = SubscriptionModel()

    

    
    var body: some View {
        
        TabView {
            ScrollView(.vertical) {
                HStack {
                    Image("arbuz").resizable().frame(width: 150, height: 40)
                    Spacer()
                    Text("Akkent 44").foregroundColor(.gray)
                }.padding()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Milk Products")
                        .font(.title)
                    productsHorizontalView(products: milkProducts)
                    
                    Text("Fruits")
                        .font(.title)
                    productsHorizontalView(products: fruits)
                    
                    Text("Seasonal Vegetables")
                        .font(.title)
                    productsHorizontalView(products: seasonalVegetables)
                }
                .padding()
                
            }
            .tabItem {
                Label("Main", systemImage: "house")
            }
            
            NavigationView {
                BasketView(basketItems: $basketItems)
                    .navigationTitle("Basket")
                
            }.tabItem {
                Label("Basket", systemImage: "square.grid.4x3.fill")
            }
            
            
            SubcriptionView(subscriptionItems: subscription)
            
            .tabItem {
                Label("Basket", systemImage: "pencil")
            }
            
        }
    
    }
    
    private func productsHorizontalView(products: [Product]) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(products) { product in
                    ProductView(product: product, basketItems: $basketItems)
                }
            }
        }
    }
    
    
}


struct ProductView: View {
    let product: Product
    @Binding var basketItems: [BasketItem]
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipped()
            Text(product.name)
            Text("\(product.price) tg")
            HStack {
                Button {
                    if let index = basketItems.firstIndex(where: { $0.product.id == product.id }) {
                        if basketItems[index].count > 1 {
                            basketItems[index].count -= 1
                        } else {
                            basketItems.remove(at: index)
                        }
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15).foregroundColor(.green).frame(width: 40, height: 25)
                        Image(systemName: "minus").foregroundColor(.white)

                    }
                }
                
                if product.isWeight { 
                    Text("\(getItemCount(for:product)) kg").frame(width: 50)
                }
                else {
                    Text(getItemCount(for:product)).frame(width: 30)
                    
                }
                Button {
                    if let index = basketItems.firstIndex(where: { $0.product.name == product.name }) {
                        if product.amountInSclad > basketItems[index].count {
                            basketItems[index].count += product.count
                        }
                        else {
                            showingAlert = true
                        }
                        
                    }
                    else {
                        basketItems.append(BasketItem(product: product, count: product.count ))
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15).foregroundColor(.green).frame(width: 40, height: 25)
                        Image(systemName: "plus").foregroundColor(.white)

                    }                }
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Out of Stock"),
                        message: Text("unfortunately the item is out of stock."),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
            
        }
        .padding()
    }
    private func getItemCount(for product: Product) -> String {
        if let index = basketItems.firstIndex(where: { $0.product.name == product.name }) {
            return "\(basketItems[index].count.rounded(toPlaces: 2))"
        }
        return "0"
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}








