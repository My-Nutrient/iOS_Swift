//
//  CartView.swift
//  MynutrientPT
//
//  Created by 김동경 on 2024/09/12.
//

import SwiftUI

struct CartView: View {
    
    @State private var isVisibleContent: Bool = true
    @State private var query: String = ""
    @State private var selectedFood: String = "육류"
    @State private var isCartVisible: Bool = false
    
    let foodCategory: [String] = ["육류", "생선", "채소", "과일", "야채", "버섯, 콩"]
    var body: some View {
        NavigationStack {
            ScrollView {
                
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(foodCategory, id:\.self) { category in
                            Button {
                                withAnimation {
                                    selectedFood = category
                                }
                            } label: {
                                Text(category)
                                    .padding()
                                    .foregroundColor(.black)
                                    .background(selectedFood == category ? .blue : .clear)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .padding(3)
                            }
                        }
                    }
                    .padding()
                }
                
                ContentView2()
            }
            .searchable(text: $query)
        }
        .sheet(isPresented: $isVisibleContent) {
            
        }
        .navigationTitle("장바구니")
        .toolbar {
            ToolbarItem {
                Button {
                    
                } label: {
                    Image(systemName: "cart.circle")
                }
            }
        }
    }
}

struct CartCellView: View {
    
    let cart: Cart
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(cart.title)
            
            HStack {
                Text(cart.cal.description)
                    .font(.subheadline)
                
                Spacer()
                
                Text(cart.date.formattedTime)
                    .font(.subheadline)
            }
        }
        .padding()
        .background(.gray)
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}




struct ContentView2: View {
    @State private var query: String = ""
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(foodData, id: \.id) { food in
                FoodItem(item: food)
            }
        }
    }
}


struct FoodItem: View {
    let item: Food
    
    var body: some View {
        VStack {
            NavigationLink {
               FoodDetailView(food: item)
            } label: {
                AsyncImage(url: URL(string: item.imageUrl)) { image in
                    image.resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                } placeholder: {
                    ProgressView()
                }
            }
            
            Text(item.name)
        }
        .padding(.horizontal)
    }
}

#Preview {
    NavigationStack {
        CartView()
    }
}
