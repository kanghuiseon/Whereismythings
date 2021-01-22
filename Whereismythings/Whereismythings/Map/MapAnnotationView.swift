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
        self.image = UIImage.fontAwesomeIcon(name: .mapPin, style: .solid, textColor: .systemIndigo, size: .init(width: 40, height: 40))
        
    }
    
    enum UserType{
        case lost, get
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
