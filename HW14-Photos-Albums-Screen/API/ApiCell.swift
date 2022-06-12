//
//  ApiCell.swift
//  HW14-Photos-Albums-Screen
//
//  Created by Vadim Kim on 12.06.2022.
//

import Foundation

struct ApiCell {

    static func getCellsForMyAlbumSection() -> [CellModel] {
        return [
            CellModel(imageName: "image1", labelName: "Recents", labelCount: "2 649"),
            CellModel(imageName: "image2", labelName: "Favourites", labelCount: "30"),
            CellModel(imageName: "image3", labelName: "Network", labelCount: "23"),
            CellModel(imageName: "image4", labelName: "IWatch", labelCount: "65"),
            CellModel(imageName: "image5", labelName: "Instagram", labelCount: "10"),
            CellModel(imageName: "image6", labelName: "Scannable", labelCount: "98"),
            CellModel(imageName: "image7", labelName: "WHOOSH", labelCount: "1"),
            CellModel(imageName: "image8", labelName: "Flowers", labelCount: "12"),
        ]
    }
}
