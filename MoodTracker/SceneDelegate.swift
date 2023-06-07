//
//  SceneDelegate.swift
//  MoodTracker
//
//  Created by Aruzhan Zhakhan on 18.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        let navController = UINavigationController(rootViewController: TabBarController())
        window?.rootViewController = navController

    }

    

}

