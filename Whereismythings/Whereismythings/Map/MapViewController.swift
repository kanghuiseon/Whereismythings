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
    // 현재 기기 위치 관련 변수
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        mainMap.showsUserLocation = true
        
        stuffs.append(MainMapModel(id: 1, stuffName: "맥미니", stuffCharacteristic: "새제품", stuffLatitudePosition: "37.5630725", stuffLongitudePosition: "127.0366688",stuffKoreanPosition: "성동구청", stuffImage: nil))
        stuffs.append(MainMapModel(id: 2, stuffName: "맥북프로2020", stuffCharacteristic: nil, stuffLatitudePosition: "37.5112348", stuffLongitudePosition: "127.0980274", stuffKoreanPosition: "롯데월드", stuffImage: nil))
        stuffs.append(MainMapModel(id: 3, stuffName: "에어팟", stuffCharacteristic: nil, stuffLatitudePosition: "37.5121422", stuffLongitudePosition: "126.9954074", stuffKoreanPosition: "세빛섬", stuffImage: nil))
        
        
        for stuff in stuffs{
            let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(stuff.stuffLatitudePosition)!, longitude: CLLocationDegrees(stuff.stuffLongitudePosition)!)
            let annotation = MapAnnotation(coordinate)
            mainMap.addAnnotation(annotation)
        }
        
    }
    // gps, 현재 위치 주변 확대
    @IBAction func btnCurrentPosition(_ sender: UIButton) {
        let userCurrentPosition = locationManager.location
        let currentCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees((userCurrentPosition?.coordinate.latitude)!), CLLocationDegrees((userCurrentPosition?.coordinate.longitude)!))
        let spanValue = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let currentRegion = MKCoordinateRegion(center: currentCoordinate, span: spanValue)
        locationManager.startUpdatingLocation()
        mainMap.setRegion(currentRegion, animated: true)
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
        guard !annotation.isKind(of: MKUserLocation.self) else { return nil }
        let mapAnnotationView = MapAnnotationView(annotation: annotation, reuseIdentifier: nil)
        let detail = mapAnnotationView.detailCalloutAccessoryView as! MapPinView
        detail.btnPin.addTarget(self, action: #selector(btnDetailView), for: .touchUpInside)
        return mapAnnotationView
    }
}

extension MapViewController: CLLocationManagerDelegate{
    
}
