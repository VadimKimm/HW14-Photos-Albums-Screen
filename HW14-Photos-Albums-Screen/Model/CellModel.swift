//
//  CellModel.swift
//  HW14-Photos-Albums-Screen
//
//  Created by Vadim Kim on 12.06.2022.
//

import Foundation

struct CellModel: Hashable {
    let imageName: String
    let labelName: String
    let labelCount: String
    var isLast: Bool = false
}
