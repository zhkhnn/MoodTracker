//
//  TabBarController.swift
//  MoodTracker
//
//  Created by Aruzhan Zhakhan on 26.11.2022.
//

import UIKit
import SnapKit
class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBars()
        navigationItem.title = "Mood tracker"
    }
    private func generateTabBars(){
        viewControllers = [generateVC(viewController: ViewController(), title: "Main", image: UIImage(systemName: "house.fill")), generateVC(viewController: TrackerViewController(), title: "Tracker", image: UIImage(systemName: "person.fill")), generateVC(viewController: SettingsViewController(), title: "Settings", image: UIImage(systemName: "gearshape"))]
    }
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?)->UIViewController{
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        UITabBar.appearance().backgroundColor = UIColor(red:191, green:191, blue:191, alpha:1)
        UITabBar.appearance().tintColor = UIColor(red: 0, green: 0.3569, blue: 0.1843, alpha: 1.0)
        return viewController
    }
    
}
