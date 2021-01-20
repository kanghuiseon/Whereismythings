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
    init(_ coordinate: CLLocationCoordinate2D){
        self.coordinate = coordinate
    }
}
