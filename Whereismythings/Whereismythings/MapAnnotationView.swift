//
//  MapAnnotationView.swift
//  Whereismythings
//
//  Created by Abraham Park on 2021/01/16.
//

import MapKit
import UIKit
import Foundation

class MapAnnotationView: MKAnnotationView {
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        //  추가 초기화를 진행.
        
        let nib = UINib(nibName: "MapTagView", bundle: nil)
        let views = nib.instantiate(withOwner: nil, options: nil)
        
        self.addSubview(views.first as! UIView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
