//
//  protocol.swift
//  MynutrientPT
//
//  Created by 홍지수 on 9/12/24.
//

import Foundation

// @Observable 교체 불가능?
protocol NVFlipCardPresenterProtocol: ObservableObject {
    var isFlipped: Bool { get }
    func flipButtonTapped()
}

class NVFlipCardPresenter: NVFlipCardPresenterProtocol {
    @Published var isFlipped: Bool = false

    func flipButtonTapped() {
        isFlipped.toggle()
    }
}
