//
//  MainTabBarController.swift
//  HW14-Photos-Albums-Screen
//
//  Created by Vadim Kim on 12.06.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    private var libraryVC: UIViewController!
    private var forYouVC: UIViewController!
    private var albumVC: UIViewController!
    private var searchVC: UIViewController!
    private var navigationAlbumController: UINavigationController!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        setupView()
    }

    // MARK: - Settings -

    private func setupHierarchy() {
        libraryVC = createViewController(title: "Library", imageName: "photo.fill.on.rectangle.fill", tag: 0)
        forYouVC = createViewController(title: "For You", imageName: "heart.text.square.fill", tag: 1)
        albumVC = AlbumViewController()
        albumVC.tabBarItem = UITabBarItem(title: "Albums", image: UIImage(systemName: "rectangle.stack.fill"), tag: 2)
        searchVC = createViewController(title: "Search", imageName: "magnifyingglass", tag: 3)

        navigationAlbumController = UINavigationController(rootViewController: albumVC)

        self.setViewControllers([libraryVC,
                                 forYouVC,
                                 navigationAlbumController,
                                 searchVC
                                ], animated: true)
    }

    private func setupLayout() {

    }

    private func setupView() {
        view.backgroundColor = UIColor.systemBackground
        setupTabBarAppearance()
    }

    // MARK: - Private functions -

    private func setupTabBarAppearance() {
        if #available(iOS 15, *) {
              let tabBarAppearance = UITabBarAppearance()
              tabBarAppearance.configureWithDefaultBackground()
              UITabBar.appearance().standardAppearance = tabBarAppearance
              UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
    }

    private func createViewController(title: String, imageName: String, tag: Int) -> UIViewController {
        let vc = UIViewController()
        vc.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: imageName), tag: tag)
        vc.view.backgroundColor = .systemBackground

        return vc
    }
}
