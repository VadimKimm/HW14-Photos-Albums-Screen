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


    static func getCellsForSharedAlbumsSection() -> [CellModel] {
        return [
            CellModel(imageName: "image9", labelName: "People", labelCount: "132"),
            CellModel(imageName: "image10", labelName: "Places", labelCount: "21"),
            CellModel(imageName: "image11", labelName: "Random Pictures", labelCount: "14"),
            CellModel(imageName: "image12", labelName: "Doge", labelCount: "243")
        ]
    }

    static func getCellsForMediaTypesSection() -> [CellModel] {
        return [
            CellModel(imageName: "video", labelName: "Videos", labelCount: "191"),
            CellModel(imageName: "person.crop.square", labelName: "Selfies", labelCount: "82"),
            CellModel(imageName: "camera", labelName: "Live Photos", labelCount: "84"),
            CellModel(imageName: "cube", labelName: "Portrait", labelCount: "49"),
            CellModel(imageName: "dot.squareshape.split.2x2", labelName: "Panoramas", labelCount: "2"),
            CellModel(imageName: "dial.min", labelName: "Slo-mo", labelCount: "3"),
            CellModel(imageName: "square.stack.3d.down.forward", labelName: "Bursts", labelCount: "10"),
            CellModel(imageName: "camera.viewfinder", labelName: "Screenshots", labelCount: "444"),
            CellModel(imageName: "smallcircle.filled.circle", labelName: "Screen recordings", labelCount: "17"),
            CellModel(imageName: "square.stack.3d.forward.dottedline", labelName: "Animated", labelCount: "1", isLast: true)
        ]
    }
}
