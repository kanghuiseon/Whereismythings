//
//  ViewController.swift
//  Whereismythings
//
//  Created by 강희선 on 2020/12/26.
//

import UIKit
import MapKit
import CoreLocation
class MapViewController: UIViewController{
    @IBOutlet var mainMap: MKMapView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    var stuffs: [MainMapModel] = []
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stuffs.append(MainMapModel(id: 1, stuffName: "맥미니", stuffCharacteristic: "새제품", stuffLatitudePosition: "37.5630725", stuffLongitudePosition: "127.0366688",stuffKoreanPosition: "성동구청", stuffImage: nil))
        stuffs.append(MainMapModel(id: 2, stuffName: "맥북프로2020", stuffCharacteristic: nil, stuffLatitudePosition: "37.5112348", stuffLongitudePosition: "127.0980274", stuffKoreanPosition: "롯데월드", stuffImage: nil))
        stuffs.append(MainMapModel(id: 3, stuffName: "에어팟", stuffCharacteristic: nil, stuffLatitudePosition: "37.5121422", stuffLongitudePosition: "126.9954074", stuffKoreanPosition: "세빛섬", stuffImage: nil))
        // pin에 관한 임시 코드
        mainMap.showsUserLocation = true
        mainMap.delegate = self
        for stuff in stuffs{
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(stuff.stuffLatitudePosition)!, longitude: CLLocationDegrees(stuff.stuffLongitudePosition)!)
            mainMap.addAnnotation(annotation)
        }
    }
}
extension MapViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isKind(of: MKUserLocation.self){
            return nil
        }
        let identifier = "annotation"
        var markerAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        if let markerAnnotationView = markerAnnotationView{
            markerAnnotationView.image = #imageLiteral(resourceName: "baseline_location_on_black_18dp")
            markerAnnotationView.canShowCallout = true
            markerAnnotationView.detailCalloutAccessoryView = UIImageView(image: #imageLiteral(resourceName: "IMG_0256"))
            return markerAnnotationView
        }
        else{
            markerAnnotationView = MKMarkerAnnotationView()
            markerAnnotationView?.image = #imageLiteral(resourceName: "baseline_location_on_black_18dp")
            markerAnnotationView?.canShowCallout = true
            markerAnnotationView?.detailCalloutAccessoryView = UIImageView(image: #imageLiteral(resourceName: "IMG_0256"))

            return markerAnnotationView
        }
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let annotation = view.annotation{
            if let detailStuffVC = storyboard?.instantiateViewController(withIdentifier: "DetailStuffViewController"){
                detailStuffVC.modalPresentationStyle = .popover
                present(detailStuffVC, animated: true, completion: nil)
                
            }
        }
    }
}
