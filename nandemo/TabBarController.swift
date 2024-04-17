//
//  TabBarController.swift
//  nandemo
//
//  Created by 坂本龍哉 on 2024/04/16.
//

import UIKit

final class TopPresenter {
    func willAppear() {
        print("presenter willAppear")
    }
}

final class TabBarControllerFactory {
    static func create() -> TabBarController {
        let vc = TabBarController()
        vc.presenter = TopPresenter()
        return vc
    }
}

final class TabBarController: UITabBarController {
    
    fileprivate var presenter: TopPresenter?
    
    private let baseView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBaseView()
        setupTab()
        
        print("TabBarController viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        presenter!.willAppear()
        
        let overlayView = OverlayView(frame: CGRect(x: 0, y: -tabBar.frame.height, width: UIScreen.main.bounds.width, height: 50))
        overlayView.backgroundColor = .black
        tabBar.addSubview(overlayView)
        viewDidLayoutSubviews()
    }
    
    func setupBaseView() {
        baseView.backgroundColor = .white
        baseView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(baseView)
        baseView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        baseView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.viewDidLayoutSubviews()
    }

    func setupTab() {
        let firstViewController = FirstViewController()
        firstViewController.tabBarItem = UITabBarItem(title: "tab1", image: .none, tag: 0)

        let secondViewController = SecondViewController()
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)

        viewControllers = [firstViewController, secondViewController]
        
        tabBar.backgroundColor = .white
    }

}

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("FirstViewController viewDidLoad")
        view.backgroundColor = .red
    }
}

final class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondViewController viewDidLoad")
        view.backgroundColor = .blue
    }
}
