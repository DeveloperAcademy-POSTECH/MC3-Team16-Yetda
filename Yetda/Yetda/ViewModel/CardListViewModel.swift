//
//  CardListViewModel.swift
//  Yetda
//
//  Created by 이채민 on 2022/07/18.
//

import Foundation
import SwiftUI
import RxSwift
import RxCocoa

class CardListViewModel: ObservableObject {
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Present.id, ascending: true)],
        animation: .default)
    
    private var presentData: FetchedResults<Present>
    
    let presentList = BehaviorRelay<[Present]>(value: [])
    
    func getPresentList() {
        var temp: [Present] = []
        for i in 0..<presentData.count {
            temp.append(presentData[i])
        }
        presentList.accept(temp)
    }
    
    func getPresentAt(_ index: IndexPath) -> Present? {
        
        let present = presentList.value[index.item]
        return present
        
    }
    
    func didSelect(_ index: IndexPath) {
        // TODO: 카드 눌렀을 때 디테일 뷰로 정보 넘겨줌
//        let controller = CardDetailViewController()
//        guard let present = getPresentAt(index) else {return}
//        controller.cardId = present.id
//        controller.cardSelected = present
    }
}
