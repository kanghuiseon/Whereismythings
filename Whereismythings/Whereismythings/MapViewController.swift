//
//  ViewController.swift
//  Whereismythings
//
//  Created by 강희선 on 2020/12/26.
//

import UIKit
import MapKit
class MapViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var mainMap: MKMapView!
    let locationManager = CLLocationManager()
    var stuffs:[MainMapModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stuffs.append(MainMapModel(id: 1, stuffName: "맥미니", stuffCharacteristic: "새제품", stuffLatitudePosition: "37.5630725", stuffLongitudePosition: "127.0366688",stuffKoreanPosition: "성동구청", stuffImage: nil))
        stuffs.append(MainMapModel(id: 2, stuffName: "맥북프로2020", stuffCharacteristic: nil, stuffLatitudePosition: "37.5112348", stuffLongitudePosition: "127.0980274", stuffKoreanPosition: "롯데월드", stuffImage: nil))
        stuffs.append(MainMapModel(id: 3, stuffName: "에어팟", stuffCharacteristic: nil, stuffLatitudePosition: "37.5121422", stuffLongitudePosition: "126.9954074", stuffKoreanPosition: "세빛섬", stuffImage: nil))
        locationManager.delegate = self // delegate 현재 뷰로 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 정확도 최고
        locationManager.requestWhenInUseAuthorization() //사용자 인증 요청
        locationManager.startUpdatingLocation() // 위치 업데이트 시작
        mainMap.showsUserLocation = true
    }

    func myLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees, delta: Double){
        let coordinateLocation = CLLocationCoordinate2DMake(latitude, longitude)
        let spanValue = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        let locationRegion = MKCoordinateRegion(center: coordinateLocation, span: spanValue)
        mainMap.setRegion(locationRegion, animated: true)
    }
    //업데이트 되는 위치 정보 표시
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation = locations.last // 가장 최근 위치 정보
        myLocation(latitude: (lastLocation?.coordinate.latitude)!, longitude: (lastLocation?.coordinate.longitude)!, delta: 0.01) // 0.01 -> 100배 확대
    }
}

