//
//  ViewController.swift
//  Whereismythings
//
//  Created by 강희선 on 2020/12/26.
//

import UIKit
import MapKit
import CoreLocation
protocol StuffInfoDelegate{
    func stuffInformation(lblPerson: String, imgStuff: UIImage?, lblStuffName: String, lblStuffPosition: String, lblGotTime: String)
}
class MapViewController: UIViewController{
    @IBOutlet var mainMap: MKMapView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    var stuffs: [MainMapModel] = []
    // 현재 기기 위치 관련 변수
    let locationManager = CLLocationManager()
    var delegate: StuffInfoDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        mainMap.showsUserLocation = true
        
        stuffs.append(MainMapModel(id: 1, gotTime: nil, stuffPerson: "익명1", flag: true, stuffName: "인형", stuffCharacteristic: "새제품", stuffLatitudePosition: "37.5630725", stuffLongitudePosition: "127.0366688", stuffKoreanPosition: "성동구청", stuffImage: #imageLiteral(resourceName: "doll")))
        stuffs.append(MainMapModel(id: 2, gotTime: nil, stuffPerson: "익명2", flag: true, stuffName: "에어팟", stuffCharacteristic: "한쪽", stuffLatitudePosition: "37.5112348", stuffLongitudePosition: "127.0980274", stuffKoreanPosition: "롯데월드", stuffImage: #imageLiteral(resourceName: "IMG_0256")))
        stuffs.append(MainMapModel(id: 3, gotTime: nil, stuffPerson: "noname", flag: true, stuffName: "립스틱", stuffCharacteristic: "핑크빛", stuffLatitudePosition: "37.5121422", stuffLongitudePosition: "126.9954074", stuffKoreanPosition: "세빛둥둥섬", stuffImage: #imageLiteral(resourceName: "lipstic")))
        for stuff in stuffs{
            let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(stuff.stuffLatitudePosition)!, longitude: CLLocationDegrees(stuff.stuffLongitudePosition)!)
            let annotation = MapAnnotation(coordinate, stuff.id, stuff.stuffPerson, true, stuff.gotTime, stuffName: stuff.stuffName, stuff.stuffCharacteristic, stuff.stuffKoreanPosition, stuff.stuffImage)
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
        let selectedAnnotation = mainMap.selectedAnnotations.first as! MapAnnotation
        delegate?.stuffInformation(lblPerson: selectedAnnotation.stuffPerson, imgStuff: selectedAnnotation.stuffImage, lblStuffName: selectedAnnotation.stuffName, lblStuffPosition: selectedAnnotation.stuffKoreanPosition, lblGotTime: selectedAnnotation.time!
        )
        self.present(detailVC!, animated: true, completion: nil)
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

//
//extension MKAnnotation{
//    public var id: Int{
//        get{
//            return self.id
//        }
//        set{
//
//        }
//    }
//    var gotStuffPerson: String{
//        get{
//            return self.gotStuffPerson
//        }
//        set{
//        }
//    }
//    var gotTime: String?{
//        get{
//            return self.gotTime
//        }
//        set{
//
//        }
//    }
//    var stuffName: String{
//        get{
//            return self.stuffName
//        }
//        set{
//
//        }
//    }
//    var stuffCharacteristic: String?{
//        get{
//            return self.stuffCharacteristic
//        }
//        set{
//
//        }
//    }
//    var stuffLatitudePosition: String{
//        get{
//            return self.stuffLatitudePosition
//        }
//        set{
//
//        }
//    }
//    var stuffLongitudePosition: String{
//        get{
//            return self.stuffLongitudePosition
//        }
//        set{
//
//        }
//    }
//    var stuffKoreanPosition: String{
//        get{
//            return self.stuffKoreanPosition
//        }
//        set{
//
//        }
//    }
//    var stuffImage: UIImage?{
//        get{
//            return self.stuffImage
//        }
//        set{
//        }
//    }
//}
