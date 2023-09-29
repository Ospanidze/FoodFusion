//
//  BasketView.swift
//  FoodFusion
//
//  Created by Айдар Оспанов on 17.08.2023.
//

import SwiftUI

struct BasketView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(order.items, id: \.dish.id) { item in
                            BasketRowView(order: order, dishItem: item)
                                .padding()
                                .contextMenu {
                                    Button("Remove") {
                                        let index = order.getIndex(item)
                                        order.deleteItems(at: index)
                                    }
                                }
                        }
                        
//                        .onDelete(perform: order.deleteItems)
                    }
                }
                
                BlueButtonView(action: {}, title: "Оплатить \(order.totalPrice) ₽")
            }
            .navigationBarItems(
                leading: LeftNavView(imageName: "house", cityName: "Astana", date: "12 aug, 2023"),
                trailing: Image(systemName: "gearshape.fill")
            )
            .padding(.bottom)
            
            if order.items.isEmpty {
                EmptyState(
                    imageName: "order",
                    message: "You have no items in your order.\nPlease add an appetizer!"
                )
            }
        }
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}
