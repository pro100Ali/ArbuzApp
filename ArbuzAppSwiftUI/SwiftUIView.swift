//
//  SwiftUIView.swift
//  ArbuzAppSwiftUI
//
//  Created by Али  on 23.05.2023.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    ForEach(0..<5) { i in
                        cardView(img: "apple")
                    }
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}


struct cardView:  View {
    var img = ""
    var body: some View {
        VStack {
            Image(img)
                .resizable().frame(width: 90, height: 60)
        }.frame(width:250,  height:400)
            .cornerRadius(20)
            .shadow(radius: 20)
            
    }
}
