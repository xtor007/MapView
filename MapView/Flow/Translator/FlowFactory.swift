//
//  FlowFactory.swift
//  MapView
//
//  Created by Anatoliy Khramchenko on 30.03.2024.
//

import SwiftUI

class FlowFactory {
    
    func makeMainVC(_ viewModel: MainViewModel) -> UIViewController {
        let controller = UIHostingController(rootView: MainView(viewModel: viewModel))
        return controller
    }
    
}
