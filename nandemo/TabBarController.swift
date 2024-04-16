//
//  TabBarController.swift
//  nandemo
//
//  Created by 坂本龍哉 on 2024/04/16.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTab()
        
        print("TabBarController viewDidLoad")
    }

    func setupTab() {
        let firstViewController = FirstViewController()
        firstViewController.tabBarItem = UITabBarItem(title: "tab1", image: .none, tag: 0)

        let secondViewController = SecondViewController()
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)

        viewControllers = [firstViewController, secondViewController]
    }

}

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
    }
}

final class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
    }
}
