//
//  TabBarController.swift
//  nandemo
//
//  Created by 坂本龍哉 on 2024/04/16.
//

import UIKit

final class TopPresenter {
    func willAppear() {
    }
}

final class TabBarControllerFactory {
    static func create() -> TabBarController {
        let vc = TabBarController()
        vc.presenter = TopPresenter()
        return vc
    }
}

extension TabBarController : OverlayViewDelegate {
    func onTap() {
        print(#function)
        navigationController?.pushViewController(ThirdViewController(), animated: true)

    }
    
    func segue() {
        print(#function)
        guard let vc = viewControllers?.first?.children.first as? UIViewController else { return }
        vc.navigationController?.pushViewController(ThirdViewController(), animated: true)

    }
}

final class TabBarController: UITabBarController {
    
    fileprivate var presenter: TopPresenter?
    
    private let baseView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBaseView()
        setupTab()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.willAppear()
        
        let overlayView = OverlayView(frame: CGRect(x: 0, y: -tabBar.frame.height, width: UIScreen.main.bounds.width, height: 50))
        overlayView.setUp(delegagte: self)
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
        let firstNavigationController = UINavigationController(rootViewController: firstViewController)
        firstNavigationController.tabBarItem = UITabBarItem(title: "tab1", image: .none, tag: 0)
        
        print(firstViewController.navigationController)
        print(firstNavigationController.navigationController)

        let secondViewController = SecondViewController()
        let secondNavigationController = UINavigationController(rootViewController: secondViewController)
        secondNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)

        viewControllers = [firstNavigationController, secondNavigationController]
        
        tabBar.backgroundColor = .white
    }

}

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let button = UIButton()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    @objc private func buttonClicked() {
        navigationController?.pushViewController(ThirdViewController(), animated: true)
    }
}

final class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}

final class ThirdViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
}
