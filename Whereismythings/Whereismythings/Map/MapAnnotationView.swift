//
//  MapAnnotationView.swift
//  Whereismythings
//
//  Created by 강희선 on 2021/01/20.
//

import UIKit
import MapKit
class MapAnnotationView: MKAnnotationView{
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        let imageNib = UINib(nibName: "MapImageView", bundle: nil)
        let views = imageNib.instantiate(withOwner: nil, options: nil)
        let btnAnnotationView = views.first as! MapPinView
        self.canShowCallout = true
        self.detailCalloutAccessoryView = btnAnnotationView
    }
    
    enum UserType{
        case lost, get
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
