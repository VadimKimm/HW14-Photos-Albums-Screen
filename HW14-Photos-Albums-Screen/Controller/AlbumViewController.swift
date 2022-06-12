//
//  AlbumViewController.swift
//  HW14-Photos-Albums-Screen
//
//  Created by Vadim Kim on 12.06.2022.
//

import UIKit
import SnapKit

class AlbumViewController: UIViewController {

    enum Section: String, CaseIterable {
        case myAlbums = "My Albums"
    }

    static let sectionHeaderElementKind = "section-header-element-kind"
    
    var collectionView: UICollectionView! = nil
    var dataSource: UICollectionViewDiffableDataSource<Section, CellModel>! = nil
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()

        configureCollectionView()

        setupHierarchy()
        setupLayout()
        setupView()

    }

    // MARK: - Settings -

    private func setupHierarchy() {
        view.addSubview(collectionView)
    }

    private func setupLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setupView() {
        title = "Albums"
        view.backgroundColor = UIColor.systemBackground
        setupNavigationController()
        collectionView.backgroundColor = .green
    }

    // MARK: - Private functions -

    private func setupNavigationController() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClick))
        navigationItem.setLeftBarButton(addButton, animated: false)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
    }

    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewLayout())
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.dataSource = dataSource
    }

    @objc private func addButtonClick() {
        print("Add button tapped")
    }
}
