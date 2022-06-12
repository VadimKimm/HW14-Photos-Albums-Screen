//
//  AlbumViewController.swift
//  HW14-Photos-Albums-Screen
//
//  Created by Vadim Kim on 12.06.2022.
//

import UIKit
import SnapKit

class AlbumViewController: UIViewController {

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHierarchy()
        setupLayout()
        setupView()

    }

    // MARK: - Settings -

    private func setupHierarchy() {
    }

    private func setupLayout() {
    }

    private func setupView() {
        title = "Albums"
        view.backgroundColor = UIColor.red
        setupNavigationController()
    }

    // MARK: - Private functions -

    private func setupNavigationController() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClick))
        navigationItem.setLeftBarButton(addButton, animated: false)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
    }

    @objc private func addButtonClick() {
        print("Add button tapped")
    }
}
