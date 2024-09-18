//
//  HomeView.swift
//  MynutrientPT
//
//  Created by 홍지수 on 9/12/24.
//
//
import SwiftUI

struct HomeView: View {
    @StateObject var presenter = NVFlipCardPresenter()
    
    var body: some View {
        
        VStack {
            Spacer()
            
            // 카드
            MyCardView(presenter: presenter)
                .rotation3DEffect(.degrees(presenter.isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                .animation(.default, value: presenter.isFlipped)
            Spacer()
            
            // 삼시세끼
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("아침")
                })
                .frame(width: 70, height: 70)
                .background(.gray)
                .cornerRadius(10)
                .foregroundColor(.white)
                
                Button(action: {
                    
                }, label: {
                    Text("점심")
                })
                .frame(width: 70, height: 70)
                .background(.gray)
                .cornerRadius(10)
                .foregroundColor(.white)
                
                Button(action: {
                    
                }, label: {
                    Text("저녁")
                })
                .frame(width: 70, height: 70)
                .background(.gray)
                .cornerRadius(10)
                .foregroundColor(.white)
                
                Button(action: {
                    
                }, label: {
                    Text("간식")
                })
                .frame(width: 70, height: 70)
                .background(.gray)
                .cornerRadius(10)
                .foregroundColor(.white)
            }
            
            Spacer()
            
        }
    }
}


//#Preview {
//    HomeView()
//}
