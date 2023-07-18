//
//  ContentView.swift
//  ECommerce
//
//  Created by rahul kaushik on 16/07/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var networkManager = NetworkManager()
    @StateObject var cartManager = CartManager()
    
    private let adaptiveCol = [GridItem(.adaptive(minimum: 300))]
    
  
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveCol, spacing: 20) {
                    ForEach(networkManager.products, id: \.self) { product in
                        ZStack(alignment: .topTrailing) {
                            ZStack(alignment: .bottom) {
                                AsyncImage(url: URL(string: product.image)) { image in
                                    image
                                        .resizable()
                                        .cornerRadius(20)
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                VStack(alignment: .leading) {
                                    Text(product.title)
                                        .bold()
                                    Text("\(product.price)$")
                                        .font(.caption)
                                }
                                .padding()
                                .frame(width: 300, alignment: .leading)
                                .background(.ultraThinMaterial)

                            }
                            .frame(width: 300, height: 300)
                            .shadow(radius: 3)
                            Button {
                                cartManager.addToCart(product: product)
                            } label: {
                                Image(systemName: "plus")
                                    .bold()
                                    .padding(10)
                                    .foregroundColor(.white)
                                    .background(.red)
                                    .cornerRadius(50)
                                    .padding()
                            }

                        }
                        
                    }
                }
                .padding()
            }
            .navigationTitle("Ecommerce App")
            .toolbar {
                NavigationLink {
                    CartView()
                        .environmentObject(cartManager)
                } label: {
                    CartButton(numberOfProducts: cartManager.products.count)
                }

                
            }
           
        }
        .padding()
        .onAppear{
            self.networkManager.fetchData()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
