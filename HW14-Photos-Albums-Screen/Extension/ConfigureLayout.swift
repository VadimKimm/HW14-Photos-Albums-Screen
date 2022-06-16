//
//  ConfigureLayout.swift
//  HW14-Photos-Albums-Screen
//
//  Created by Vadim Kim on 16.06.2022.
//

import UIKit

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
            case .mediatypes:
                fallthrough
            case .utilities:
                return self.createListSectionLayout()
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

        let containerGroupSize = NSCollectionLayoutSize(widthDimension:
                                                            determineIsWideMode() ? .fractionalWidth(0.47) : .fractionalWidth(0.95),
                                                        heightDimension:
                                                            determineIsWideMode() ? .fractionalWidth(0.6) : .fractionalWidth(1.2))
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

        let groupSize = NSCollectionLayoutSize(widthDimension: determineIsWideMode() ? .fractionalWidth(0.47) : .fractionalWidth(0.95),
                                               heightDimension: determineIsWideMode() ? .fractionalWidth(0.3) : .fractionalWidth(0.6))

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

    private func createListSectionLayout() -> NSCollectionLayoutSection {

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: determineIsWideMode() ? .fractionalWidth(0.075) : .fractionalWidth(0.13))

        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        let headerSection = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                        elementKind: AlbumViewController.sectionHeaderElementKind,
                                                                        alignment: .topLeading)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 30, trailing: 0)
        section.boundarySupplementaryItems = [headerSection]

        return section
    }
}

extension AlbumViewController {

    private func determineIsWideMode() -> Bool {
        let isWide = UIScreen.main.bounds.width > 450
        return isWide
    }
}

