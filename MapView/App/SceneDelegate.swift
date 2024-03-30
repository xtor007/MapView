//
//  SceneDelegate.swift
//  MapView
//
//  Created by Anatoliy Khramchenko on 30.03.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var translator: FlowTranslator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        setupAndStartTranslator()
        window?.makeKeyAndVisible()
    }
    
    private func setupAndStartTranslator() {
        translator = FlowTranslator(executor: self)
        translator?.startFlow()
    }

}

extension SceneDelegate: FlowExecutor {
    func showVC(_ vc: UIViewController) {
        window?.rootViewController = vc
    }
}
