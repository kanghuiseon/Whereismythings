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
    var stuffName: String
    var stuffCharacteristic: String?
    var stuffLatitudePosition: String
    var stuffLongitudePosition: String
    var stuffKoreanPosition: String
    var stuffImage: UIImage?
    
    init(id: Int, stuffName: String, stuffCharacteristic: String?, stuffLatitudePosition: String,
         stuffLongitudePosition: String, stuffKoreanPosition: String, stuffImage: UIImage?) {
        self.id = id
        self.stuffName = stuffName
        self.stuffCharacteristic = stuffCharacteristic
        self.stuffLatitudePosition = stuffLatitudePosition
        self.stuffLongitudePosition = stuffLongitudePosition
        self.stuffKoreanPosition = stuffKoreanPosition
        self.stuffImage = stuffImage!
    }
}
