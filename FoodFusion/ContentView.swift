//
//  RootView.swift
//  FoodFusion
//
//  Created by Айдар Оспанов on 17.08.2023.
//

import SwiftUI

enum Tab: String {
    case main = "Главная"
    case research = "Поиск"
    case basket = "Корзина"
    case account = "Аккаунт"
    
    var image: String {
        switch self {
        case .main:
            return "house"
        case .research:
            return "magnifyingglass"
        case .basket:
            return "cart"
        case .account:
            return "person.circle"
        }
    }
}

struct ContentView: View {
    
    @EnvironmentObject private var order: Order
    
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
            }
            .tabItem {
                Label(
                    Tab.main.rawValue,
                    systemImage: Tab.main.image
                )
            }
            NavigationView {
                ResearchView()
            }
            .tabItem {
                Image(systemName: Tab.research.image)
                Text(Tab.research.rawValue)
            }
            NavigationView {
                BasketView()
            }
            .tabItem {
                Image(systemName: Tab.basket.image)
                Text(Tab.basket.rawValue)
            }
            .badge(order.items.count)
            NavigationView {
                AccountView()
            }
            .tabItem {
                Image(systemName: Tab.account.image)
                Text(Tab.account.rawValue)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
