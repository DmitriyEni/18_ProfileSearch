//
//  SceneDelegate.swift
//  18_ProfileSerch
//
//  Created by Dmitriy Eni on 07.04.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        window?.rootViewController = UINavigationController(rootViewController: TableVC(nibName: String(describing: TableVC.self), bundle: nil))
        window?.makeKeyAndVisible()

    }
}

