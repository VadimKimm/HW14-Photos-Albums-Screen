//
//  PhotoCollectionViewCell.swift
//  HW14-Photos-Albums-Screen
//
//  Created by Vadim Kim on 12.06.2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    //MARK: - Cell objects -

    static let identifier = "PhotoCollectionViewCell"

    private let iconImageContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.layer.cornerRadius = 4
        return view
    }()

    private let iconImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()

    private let albumNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 1
        return label
    }()

    private let albumCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemGray
        label.numberOfLines = 1
        return label
    }()


    //MARK: - Setting up CollectionViewCell -

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.clipsToBounds = true
        contentView.addSubview(iconImageContainer)
        iconImageContainer.addSubview(iconImageView)
        contentView.addSubview(albumNameLabel)
        contentView.addSubview(albumCountLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        iconImageContainer.snp.makeConstraints { make in
            make.height.equalTo(contentView.safeAreaLayoutGuide).offset(-45)
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(contentView.snp.right)
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide).offset(-45)
        }

        iconImageView.snp.makeConstraints { make in
            make.centerY.equalTo(iconImageContainer.snp.centerY)
            make.centerX.equalTo(iconImageContainer.snp.centerX)
        }

        albumNameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).offset(-18)
            make.left.equalTo(contentView.snp.left)
        }

        albumCountLabel.snp.makeConstraints { make in
            make.bottom.equalTo(albumNameLabel.snp.bottom).offset(20)
            make.left.equalTo(contentView.snp.left)
        }
    }
}

extension PhotoCollectionViewCell {
    func configure(with model: CellModel) {
        iconImageView.image = UIImage(named: model.imageName)
        albumNameLabel.text = model.labelName
        albumCountLabel.text = model.labelCount
    }
}

