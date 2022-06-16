//
//  ConfigureDataSource.swift
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
                fallthrough
            case .sharedAlbums:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else { fatalError() }
                cell.configure(with: itemIdentifier)
                return cell
            case .mediatypes:
                fallthrough
            case .utilities:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.identifier, for: indexPath) as? ListCollectionViewCell else { fatalError() }
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
                fallthrough
            case .sharedAlbums:
                guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PhotoHeaderView.identifier, for: indexPath) as? PhotoHeaderView else { fatalError() }
                supplementaryView.label.text = Section.allCases[indexPath.section].rawValue
                return supplementaryView
            case .mediatypes:
                fallthrough
            case .utilities:
                guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ListHeaderView.identifier, for: indexPath) as? ListHeaderView else { fatalError() }
                supplementaryView.label.text = Section.allCases[indexPath.section].rawValue
                return supplementaryView
            }
        }

        let snapshot = snapshotForCurrentState()
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    func snapshotForCurrentState() -> NSDiffableDataSourceSnapshot<Section, CellModel> {
        var snapshot = NSDiffableDataSourceSnapshot<Section, CellModel>()
        snapshot.appendSections([Section.myAlbums, Section.sharedAlbums, Section.mediatypes, Section.utilities])

        let itemsForMyAlbumSection = ApiCell.getCellsForMyAlbumSection()
        snapshot.appendItems(itemsForMyAlbumSection, toSection: .myAlbums)

        let itemsForPeopleAndPlacesSection = ApiCell.getCellsForSharedAlbumsSection()
        snapshot.appendItems(itemsForPeopleAndPlacesSection, toSection: .sharedAlbums)

        let itemsForMediaTypesSection = ApiCell.getCellsForMediaTypesSection()
        snapshot.appendItems(itemsForMediaTypesSection, toSection: .mediatypes)

        let itemsForUtilitiesSection = ApiCell.getCellsForUtilitiesSection()
        snapshot.appendItems(itemsForUtilitiesSection, toSection: .utilities)

        return snapshot
    }
}
