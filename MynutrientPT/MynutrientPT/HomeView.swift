//
//  HomeView.swift
//  MynutrientPT
//
//  Created by 홍지수 on 9/12/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var presenter: NVFlipCardPresenter
    
    var body: some View {
        MyCardView(presenter: $presenter)
            .rotation3DEffect(.degrees(presenter.isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
            .animation(.default, value: presenter.isFlipped)
    }
}


//#Preview {
//    HomeView()
//}
