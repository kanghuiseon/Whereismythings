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
        for stuff in stuffs{
            let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(stuff.stuffLatitudePosition)!, longitude: CLLocationDegrees(stuff.stuffLongitudePosition)!)
            let annotation = MapAnnotation(coordinate)
            mainMap.addAnnotation(annotation)
        }
        
    }
    @objc func btnDetailView(){
        let detailVC = storyboard?.instantiateViewController(identifier: "DetailStuffViewController")
        self.present(detailVC!, animated: true, completion: nil)
        print("tap")
    }

}

extension MapViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //만약 사용자지정이면 return
        if annotation.isEqual(MKUserLocation.self){
            exit(0)
        }
        let mapAnnotationView = MapAnnotationView(annotation: annotation, reuseIdentifier: nil)
        let detail = mapAnnotationView.detailCalloutAccessoryView as! MapPinView
        detail.btnPin.addTarget(self, action: #selector(btnDetailView), for: .touchUpInside)
        return mapAnnotationView
    }
//    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
//        let detailVC = storyboard?.instantiateViewController(identifier: "DetailStuffViewController")
//        present(detailVC!, animated: true, completion: nil)
//    }
}
