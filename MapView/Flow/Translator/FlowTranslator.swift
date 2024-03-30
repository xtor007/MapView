//
//  FlowTranslator.swift
//  MapView
//
//  Created by Anatoliy Khramchenko on 30.03.2024.
//

import Foundation

class FlowTranslator {
    
    private let executor: FlowExecutor
    
    private let factory = FlowFactory()
    
    let mainMiewModel = MainViewModel()
    
    init(executor: FlowExecutor) {
        self.executor = executor
    }
    
    func startFlow() {
        showMain()
    }
    
    private func showMain() {
        let mainVC = factory.makeMainVC(mainMiewModel)
        executor.showVC(mainVC)
    }
    
}
