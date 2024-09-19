//
//  NutritionGraphView.swift
//  MynutrientPT
//
//  Created by 이다영 on 9/19/24.
//

import SwiftUI

struct NutritionGraphView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text("영양 성분 그래프")
                    .font(.headline)
                
                // 여기에 실제 그래프를 추가할 수 있다
                // 예시) 간단한 막대
                HStack(alignment: .bottom, spacing: 20) {
                    VStack {
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 30, height: 100)
                        Text("단백질")
                    }
                    VStack {
                        Rectangle()
                            .fill(Color.green)
                            .frame(width: 30, height: 150)
                        Text("탄수화물")
                    }
                    VStack {
                        Rectangle()
                            .fill(Color.red)
                            .frame(width: 30, height: 80)
                        Text("지방")
                    }
                }
                .padding()
            }
            .navigationBarTitle("영양 분석", displayMode: .inline)
            .navigationBarItems(trailing: Button("닫기") {
                isPresented = false
            })
        }
    }
}

struct NutritionGraphView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionGraphView(isPresented: .constant(true))
    }
}
