//
//  CartView.swift
//  ECommerce
//
//  Created by rahul kaushik on 18/07/23.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager : CartManager
    var body: some View {
        ScrollView{
            if (cartManager.products.count) > 0 {
                ForEach(cartManager.products, id: \.id) {product in
                    ProductRow(product: product)
                    
                }
                HStack {
                    Text ("Your cart total is")
                    Spacer()
                    Text("$\(cartManager.total)")
                        .bold()
                    
                }
                .padding()
            }
            else {
                Text ("Your cart is empty")
            }
        }
               .navigationTitle(Text("My Cart"))
               .padding (.top)
            
    }
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
