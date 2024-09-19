//
//  MyCardView.swift
//  MynutrientPT
//
//  Created by 홍지수 on 9/12/24.
//

import SwiftUI

struct MyCardView: View {
    @ObservedObject var presenter: NVFlipCardPresenter
//    @Binding var presenter: NVFlipCardPresenter
    let shape = RoundedRectangle(cornerRadius: 10)
    @State private var progress: Double = 1.0
    var foodDetail: FoodNutrientStore = FoodNutrientStore()
    
    var body: some View {
        ZStack {
            if presenter.isFlipped != true {
                // 앞면
                VStack {
                    // 카드 상단
                    HStack {
                        Image("one")
                            .resizable()
                            .frame(width: 20, height: 20,alignment: .center)
                        Image("two")
                            .resizable()
                            .frame(width: 20, height: 20,alignment: .center)
                        Image("three")
                            .resizable()
                            .frame(width: 20, height: 20,alignment: .center)
                        Spacer()
                        Button {
                            MyPage()
//                            Text("")
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .frame(width: 20, height: 20,alignment: .center)
                        }
                    }
                    .padding(30)
                    
                    // 캐릭터
                    Image("jibang")
                        .resizable()
                        .frame(width: 100, height: 130)
                        .padding()
                    
                    // 문구
                    ZStack {
                        //RoundedRectangle(cornerRadius: 1)
                        Text("돼지야 그만머거")
                            .font(.headline)
                            .bold()
                    }
                    
                    // 영양성분
                    HStack {
                        Text("탄수화물").font(.caption2)
                        ProgressView(value: progress, total: 100)
                            .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .progressViewStyle(LinearProgressViewStyle())
                        Text("00%").font(.caption2)
                    }
                    .padding()
                    HStack {
                        Text("단백질").font(.caption2)
                        ProgressView(value: progress, total: 100)
                            .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .progressViewStyle(LinearProgressViewStyle())
                        Text("00%").font(.caption2)
                    }
                    .padding()
                    HStack {
                        Text("지방").font(.caption2)
                        ProgressView(value: progress, total: 100)
                            .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .progressViewStyle(LinearProgressViewStyle())
                        Text("00%").font(.caption2)
                    }
                    .padding()
                }
                .frame(width: 300, height: 500)
                .background(Color.green)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 10)
                .padding(30)
            }
            
            
            
            
            else {
                // 뒷면
                ZStack {
                    
                    VStack {
                        Text("돼지의 왕의 영양성분표").font(.title).bold()
                        
                        // tableView
                        Table(foodDetail.foods) {
                            TableColumn("foodName", value: \.foodName)
                            TableColumn("kcal", value: \.kcal)
                            //TableColumn("E-Mail Address", value: \.nutrients)
                        }
                        .padding()
                        .font(.subheadline)
                    }
                    .frame(width: 300, height: 500)
                    .background(Color.green)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 10)
                }
            }
        }
        .onTapGesture {
                    presenter.flipButtonTapped()
        }
        .rotation3DEffect(.degrees(presenter.isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
        .animation(.default, value: presenter.isFlipped)
        
    }
}

//#Preview {
//    MyCardView(istouched: <#Binding<Bool>#>)
//}
