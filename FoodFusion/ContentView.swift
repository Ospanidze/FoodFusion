//
//  RootView.swift
//  FoodFusion
//
//  Created by Айдар Оспанов on 17.08.2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
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
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}

struct ContentView: View {
    
    @EnvironmentObject private var order: Order
    
    @State private var activeTab: Tab = .main
    @State private var tabShapePosition: CGPoint = .zero
    
    @Namespace private var animation
    
    var body: some View {
        VStack {
            TabView(selection: $activeTab) {
                NavigationView {
                    HomeView()
                }
                .tag(Tab.main)
                
                NavigationView {
                    ResearchView()
                }
                .tag(Tab.research)
                
                NavigationView {
                    BasketView()
                }
                .tag(Tab.basket)
                
                NavigationView {
                    AccountView()
                }
                .tag(Tab.account)
            }
            
            customTabBar()
        }
    }
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @ViewBuilder
    private func customTabBar(_ tint: Color = Color(.systemBlue), _ inactiveTint: Color = .blue) -> some View {
        HStack(alignment: .bottom) {
            ForEach(Tab.allCases, id: \.rawValue) {
                TabItem(
                    activeTab: $activeTab,
                    position: $tabShapePosition,
                    tint: tint,
                    inactiveTint: inactiveTint,
                    tab: $0,
                    animation: animation,
                    number: order.items.count
                )
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background {
            TabShape(midPoint: tabShapePosition.x)
                .fill(.white)
                .ignoresSafeArea()
                .shadow(color: tint.opacity(0.2), radius: 5, x: 0, y: -5)
                .blur(radius: 2)
                .padding(.top, 25)
            
            
        }
        .animation(.interactiveSpring(response: 0.6,
                                      dampingFraction: 0.7,
                                      blendDuration: 0.7),
                   value: activeTab)
    }
}

struct TabItem: View {
    
    @Binding var activeTab: Tab
    @Binding var position: CGPoint
    let tint: Color
    let inactiveTint: Color
    let tab: Tab
    let animation: Namespace.ID
    
    let number: Int
    
    @State private var tabPosition: CGPoint = .zero
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                Image(systemName: tab.image)
                    .font(.title)
                    .frame(width: activeTab == tab ? 58 : 35,
                           height: activeTab == tab ? 58 : 35)
                    .foregroundColor(activeTab == tab ? .white : tint)
                    .background {
                        if activeTab == tab {
                            Circle()
                                .fill(tint)
                                .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                        }
                    }
                
                if tab == .basket {
                    if number != 0 {
                        ZStack {
                            Circle()
                                .frame(width: activeTab == tab ? 24 : 20)
                                .foregroundColor(.red)
                            Text("\(number)")
                                .foregroundColor(.white)
                                .frame(alignment: .center)
                        }
                        .offset(x: 5)
                    }
                }
                
            }
            
            Text(tab.rawValue)
                .font(.caption)
                .foregroundColor(activeTab == tab ? tint : .gray)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .viewPosition { rect in
            tabPosition.x = rect.midX
            
            if activeTab == tab {
                position.x = rect.midX
            }
        }
        .onTapGesture {
            activeTab = tab
            
            //withAnimation(.interactiveSpring())
            
            withAnimation(.interactiveSpring(response: 0.6,
                                             dampingFraction: 0.7,
                                             blendDuration: 0.7)) {
                position.x = tabPosition.x
            }
        }
    }
    
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//TabView {
//    NavigationView {
//        HomeView()
//    }
//    .tabItem {
//        Label(
//            Tab.main.rawValue,
//            systemImage: Tab.main.image
//        )
//    }
//    NavigationView {
//        ResearchView()
//    }
//    .tabItem {
//        Image(systemName: Tab.research.image)
//        Text(Tab.research.rawValue)
//    }
//    NavigationView {
//        BasketView()
//    }
//    .tabItem {
//        Image(systemName: Tab.basket.image)
//        Text(Tab.basket.rawValue)
//    }
//    .badge(order.items.count)
//    NavigationView {
//        AccountView()
//    }
//    .tabItem {
//        Image(systemName: Tab.account.image)
//        Text(Tab.account.rawValue)
//    }
//}
