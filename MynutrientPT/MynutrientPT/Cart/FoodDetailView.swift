//
//  FoodDetailView.swift
//  MynutrientPT
//
//  Created by 김동경 on 2024/09/12.
//

import SwiftUI

struct FoodDetailView: View {
    
    let food: Food
    @State private var isHeart: Bool = true
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: food.imageUrl)) { image in
                image.resizable()
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
            } placeholder: {
                ProgressView()
            }
            
            HStack {
                Text(food.name)
                    .font(.title2)
                    .padding()
                
                Spacer()
                
                Button {
                    isHeart.toggle()
                } label: {
                    Image(systemName: isHeart ? "heart.fill" : "heart")
                        .tint(.red)
                        .padding()
                }
                
                
            }
            
            Text("효능 어쩌구 저쩌구")
                .padding()
            

            
            Spacer()
        }
       
        
    }
}

#Preview {
    NavigationStack {
        FoodDetailView(food: foodData[0])
    }
}
