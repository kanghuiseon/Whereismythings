//
//  MainMapModel.swift
//  Whereismythings
//
//  Created by 강희선 on 2021/01/13.
//

import Foundation
import UIKit
struct MainMapModel{
    var id: Int
    var stuffPerson: String
    var flag: Bool
    var gotTime: String?
    var stuffName: String
    var stuffCharacteristic: String?
    var stuffLatitudePosition: String
    var stuffLongitudePosition: String
    var stuffKoreanPosition: String
    var stuffImage: UIImage?
    var stuffs: [MainMapModel] = []
    init(id: Int, gotTime: String?, stuffPerson: String, flag: Bool, stuffName: String, stuffCharacteristic: String?, stuffLatitudePosition: String,
         stuffLongitudePosition: String, stuffKoreanPosition: String, stuffImage: UIImage?) {
        self.id = id
        self.stuffPerson = stuffPerson
        self.flag = flag
        self.stuffName = stuffName
        self.stuffCharacteristic = stuffCharacteristic
        self.stuffLatitudePosition = stuffLatitudePosition
        self.stuffLongitudePosition = stuffLongitudePosition
        self.stuffKoreanPosition = stuffKoreanPosition
        guard let image = stuffImage else { return }
        self.stuffImage = image
    }
    
//    static func addStuffs() -> [MainMapModel]{
//        stuffs.append(MainMapModel(id: 1, gotTime: nil, stuffPerson: "익명1", flag: true, stuffName: "인형", stuffCharacteristic: "새제품", stuffLatitudePosition: "37.5630725", stuffLongitudePosition: "127.0366688", stuffKoreanPosition: "성동구청", stuffImage: #imageLiteral(resourceName: "doll")))
//        stuffs.append(MainMapModel(id: 2, gotTime: nil, stuffPerson: "익명2", flag: true, stuffName: "에어팟", stuffCharacteristic: "한쪽", stuffLatitudePosition: "37.5112348", stuffLongitudePosition: "127.0980274", stuffKoreanPosition: "롯데월드", stuffImage: #imageLiteral(resourceName: "IMG_0256")))
//        stuffs.append(MainMapModel(id: 3, gotTime: nil, stuffPerson: "noname", flag: true, stuffName: "립스틱", stuffCharacteristic: "핑크빛", stuffLatitudePosition: "37.5121422", stuffLongitudePosition: "126.9954074", stuffKoreanPosition: "세빛둥둥섬", stuffImage: #imageLiteral(resourceName: "lipstic")))
//        let s = stuffs
//        return s
//    }
}
