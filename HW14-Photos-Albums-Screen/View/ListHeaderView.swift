//
//  ListHeaderView.swift
//  HW14-Photos-Albums-Screen
//
//  Created by Vadim Kim on 12.06.2022.
//

import UIKit

class ListHeaderView: UICollectionReusableView {

    //MARK: - View objects -

    static let identifier = "ListHeaderView"

    private let separatorLine: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.heightAnchor.constraint(equalToConstant: 0.2).isActive = true
        line.backgroundColor = UIColor.systemGray3
        return line
    }()

    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 21, weight: .bold)
        label.numberOfLines = 1
        return label
    }()

    //MARK: - Setting up View -

    override init(frame: CGRect) {
        super.init(frame: frame)

        clipsToBounds = true
        addSubview(separatorLine)
        addSubview(label)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        separatorLine.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalToSuperview()
        }

        label.translatesAutoresizingMaskIntoConstraints = false
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.top.equalTo(separatorLine.snp.bottom)
            make.left.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

