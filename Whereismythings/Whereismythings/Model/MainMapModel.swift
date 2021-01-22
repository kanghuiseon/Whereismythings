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
}
