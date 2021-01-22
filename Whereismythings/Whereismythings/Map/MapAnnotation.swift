//
//  MapAnnotation.swift
//  Whereismythings
//
//  Created by 강희선 on 2021/01/20.
//

import Foundation
import MapKit

class MapAnnotation: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var id: Int
    var stuffPerson: String
    var flag: Bool
    var time: String? = nil
    var stuffName: String
    var stuffCharacteristic: String? = nil
    var stuffKoreanPosition: String
    var stuffImage: UIImage? = nil
    init(_ coordinate: CLLocationCoordinate2D, _ id: Int, _ stuffPerson: String, _ flag: Bool, _ time: String?, stuffName: String, _ stuffCharacteristic: String?, _ stuffKoreanPosition: String, _ stuffImage: UIImage?){
        self.coordinate = coordinate
        self.id = id
        self.stuffPerson = stuffPerson
        self.flag = flag
        self.time = time
        self.stuffName = stuffName
        self.stuffCharacteristic = stuffCharacteristic
        self.stuffKoreanPosition = stuffKoreanPosition
        self.stuffImage = stuffImage
    }
}
