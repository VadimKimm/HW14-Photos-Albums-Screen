//
//  ExtensionAlbumViewController.swift
//  HW14-Photos-Albums-Screen
//
//  Created by Vadim Kim on 12.06.2022.
//

import UIKit

// MARK: - Configure DataSource -

extension AlbumViewController {

    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, CellModel>(collectionView: collectionView)
        { collectionView, indexPath, itemIdentifier in

            let sectionType = Section.allCases[indexPath.section]
            switch sectionType {
            case .myAlbums:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else { fatalError() }
                cell.configure(with: itemIdentifier)
                return cell
            }
        }

        dataSource.supplementaryViewProvider = { (collectionView: UICollectionView,
                                                  kind: String,
                                                  indexPath: IndexPath) -> UICollectionReusableView? in

            let sectionType = Section.allCases[indexPath.section]
            switch sectionType {
            case .myAlbums:
                guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PhotoHeaderView.identifier, for: indexPath) as? PhotoHeaderView else { fatalError() }
                supplementaryView.label.text = Section.allCases[indexPath.section].rawValue
                return supplementaryView
            }
        }

        let snapshot = snapshotForCurrentState()
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    func snapshotForCurrentState() -> NSDiffableDataSourceSnapshot<Section, CellModel> {
        var snapshot = NSDiffableDataSourceSnapshot<Section, CellModel>()
        snapshot.appendSections([Section.myAlbums])

        let itemsForMyAlbumSection = ApiCell.getCellsForMyAlbumSection()
        snapshot.appendItems(itemsForMyAlbumSection, toSection: .myAlbums)


        return snapshot
    }
}

// MARK: - Configure layout -

extension AlbumViewController {

    func createLayout() -> UICollectionViewLayout {

        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvirnment) -> NSCollectionLayoutSection? in
            let sectionType = Section.allCases[sectionIndex]

            switch sectionType {
            case .myAlbums:
                return self.createMyAlbumsSectionLayout()
            case .sharedAlbums:
                return self.createSharedAlbumsSectionLayout()
            }
        }

        let config = UICollectionViewCompositionalLayoutConfiguration()
        layout.configuration = config
        return layout
    }

    private func createMyAlbumsSectionLayout() -> NSCollectionLayoutSection {

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let subGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
        subGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)

        let containerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .fractionalWidth(1.2))
        let containerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: containerGroupSize, subitem: subGroup, count: 2)

        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(52))
        let headerSection = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                        elementKind: AlbumViewController.sectionHeaderElementKind,
                                                                        alignment: .topLeading)

        let section = NSCollectionLayoutSection(group: containerGroup)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 10, trailing: 0)
        section.boundarySupplementaryItems = [headerSection]
        section.orthogonalScrollingBehavior = .groupPaging

        return section
    }

    private func createSharedAlbumsSectionLayout() -> NSCollectionLayoutSection {

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 10)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .fractionalWidth(0.6))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)

        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(52))
        let headerSection = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                        elementKind: AlbumViewController.sectionHeaderElementKind,
                                                                        alignment: .topLeading)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 10, trailing: 0)
        section.boundarySupplementaryItems = [headerSection]
        section.orthogonalScrollingBehavior = .groupPaging

        return section
    }
}
