//
//  MyCardView.swift
//  MynutrientPT
//
//  Created by 홍지수 on 9/12/24.
//

import SwiftUI

struct MyCardView: View {
    
    @Binding var presenter: NVFlipCardPresenter
    let shape = RoundedRectangle(cornerRadius: 10)
    
    var body: some View {
        ZStack {
            if presenter.isFlipped {
                // 앞면
                shape.fill()
                    .foregroundColor(.white)
                VStack {
                    // 카드 상단
                    HStack {
                        Image("one")
                        Image("two")
                        Image("three")
                        Spacer()
                        Button {
                            Text("")
                        } label: {
                            Image(systemName: "gearshape.fill")
                        }
                    }
                    
                    // 캐릭터
                    Image("jibang")
                        .resizable()
                        .frame(width: 100, height: 150)
                    
                    // 문구
                    ZStack {
                        RoundedRectangle(cornerRadius: 1)
                        Text("돼지야 그만머거")
                    }
                    
                    // 영양성분
                    HStack {
                        Text("탄수화물")
                    }
                }
            }
            else {
                // 뒷면
                ZStack {
                    shape.fill()
                        .foregroundColor(.yellow)
                    
                    List {
                        Text("돼지의 왕의 영양성분표").font(.title)
                        HStack {
                            Text("탄수화물")
                            Spacer()
                            Text("300 kcal")
                        }
                        HStack {
                            Text("탄수화물")
                            Spacer()
                            Text("300 kcal")
                        }
                        HStack {
                            Text("탄수화물")
                            Spacer()
                            Text("300 kcal")
                        }
                        HStack {
                            Text("탄수화물")
                            Spacer()
                            Text("300 kcal")
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    MyCardView(istouched: <#Binding<Bool>#>)
//}
