//
//  ProductRow.swift
//  ECommerce
//
//  Created by rahul kaushik on 18/07/23.
//

import SwiftUI

struct ProductRow: View {
    @EnvironmentObject var cartManager : CartManager
    
    
    var product : Product
    var body: some View {
          HStack(spacing: 20) {
              AsyncImage(url: URL(string: product.image)) { img in
                  img
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                      .frame(width: 50)
              } placeholder: {
                  ProgressView()
              }

              
              VStack(alignment: .leading, spacing: 10) {
                  Text(product.title)
                      .bold()

                  Text("$\(product.price)")
              }
              
              Spacer()

              Image(systemName: "trash")
                  .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                  .onTapGesture {
                      cartManager.removeFromCart(product: product)
                  }
          }
          .padding(.horizontal)
          .frame(maxWidth: .infinity, alignment: .leading)
      }
}

struct ProductRow_Previews: PreviewProvider {
    @EnvironmentObject var networkManager : NetworkManager
    static var previews: some View {
        ProductRow(product: Product(id:0, title: "", image: "", price: 0))
            .environmentObject(CartManager())
            .environmentObject(NetworkManager())
    }
}
