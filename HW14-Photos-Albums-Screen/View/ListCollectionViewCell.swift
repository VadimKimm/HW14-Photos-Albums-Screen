//
//  ListCollectionViewCell.swift
//  HW14-Photos-Albums-Screen
//
//  Created by Vadim Kim on 12.06.2022.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {

    //MARK: - Cell objects -

    static let identifier = "ListCollectionViewCell"

    private let iconImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.tintColor = .systemBlue
        return image
    }()

    private let cellNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .systemBlue
        label.numberOfLines = 1
        return label
    }()

    private let cellCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .systemGray
        label.numberOfLines = 1
        return label
    }()

    private let arrowImageView: UIImageView = {
        let image = UIImageView()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 13, weight: UIImage.SymbolWeight.medium)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "chevron.right", withConfiguration: imageConfig)
        image.contentMode = .scaleAspectFit
        image.tintColor = .systemGray
        image.clipsToBounds = true
        return image
    }()

    private let separatorLine: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.heightAnchor.constraint(equalToConstant: 0.2).isActive = true
        line.backgroundColor = UIColor.systemGray3
        return line
    }()


    //MARK: - Setting up CollectionViewCell -

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.clipsToBounds = true
        contentView.addSubview(iconImageView)
        contentView.addSubview(cellNameLabel)
        contentView.addSubview(cellCountLabel)
        contentView.addSubview(arrowImageView)
        contentView.addSubview(separatorLine)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        iconImageView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.snp.centerY)
            make.centerX.equalTo(contentView.snp.left).offset(15)
        }

        cellNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.snp.centerY)
            make.left.equalTo(iconImageView.snp.right).offset(15)
        }

        arrowImageView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.snp.centerY)
            make.right.equalTo(contentView.snp.right).offset(-15)
        }

        cellCountLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.snp.centerY)
            make.right.equalTo(arrowImageView.snp.left).offset(-10)
        }

        separatorLine.snp.makeConstraints { make in
            make.width.equalTo(contentView.snp.width)
            make.left.equalTo(cellNameLabel.snp.left)
            make.bottom.equalTo(cellNameLabel.snp.bottom).offset(10)
        }
    }
}

extension ListCollectionViewCell {
    func configure(with model: CellModel) {
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 22, weight: .light)
        iconImageView.image = UIImage(systemName: model.imageName, withConfiguration: imageConfig)
        cellNameLabel.text = model.labelName
        cellCountLabel.text = model.labelCount

        if model.isLast {
            separatorLine.isHidden = true
        }
    }
}

