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
    @IBOutlet var segmentedControl: UISegmentedControl!
    let locationManager = CLLocationManager()
    var leftstuffs: [MainMapModel] = []
    var rightstuffs: [MainMapModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        leftstuffs.append(MainMapModel(id: 1, stuffName: "맥미니", stuffCharacteristic: "새제품", stuffLatitudePosition: "37.5630725", stuffLongitudePosition: "127.0366688",stuffKoreanPosition: "성동구청", stuffImage: nil))
        leftstuffs.append(MainMapModel(id: 2, stuffName: "맥북프로2020", stuffCharacteristic: nil, stuffLatitudePosition: "37.5112348", stuffLongitudePosition: "127.0980274", stuffKoreanPosition: "롯데월드", stuffImage: nil))
        rightstuffs.append(MainMapModel(id: 3, stuffName: "에어팟", stuffCharacteristic: nil, stuffLatitudePosition: "37.5121422", stuffLongitudePosition: "126.9954074", stuffKoreanPosition: "세빛섬", stuffImage: nil))
        for mapModel in leftstuffs{
            setAnnotation(latitude: Double(mapModel.stuffLatitudePosition)!, longitude: Double(mapModel.stuffLongitudePosition)!, delta: 0.01, Title: mapModel.stuffName, subTitle: mapModel.stuffName)
        }
        locationManager.delegate = self // delegate 현재 뷰로 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 정확도 최고
        locationManager.requestWhenInUseAuthorization() //사용자 인증 요청
        locationManager.startUpdatingLocation() // 위치 업데이트 시작
        mainMap.showsUserLocation = true
    }
    

    @IBAction func clickedSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            // 핀 꽂기
            for mapModel in leftstuffs{
                setAnnotation(latitude: Double(mapModel.stuffLatitudePosition)!, longitude: Double(mapModel.stuffLongitudePosition)!, delta: 0.01, Title: mapModel.stuffName, subTitle: mapModel.stuffName)
            }
        case 1:
            for mapModel in rightstuffs{
                setAnnotation(latitude: Double(mapModel.stuffLatitudePosition)!, longitude: Double(mapModel.stuffLongitudePosition)!, delta: 0.01, Title: mapModel.stuffName, subTitle: mapModel.stuffName)
            }
        default:
            exit(0)
        }
    }
    //현재 위치로 확대되는 함수
    func myLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees, delta: Double) -> CLLocationCoordinate2D{
        let coordinateLocation = CLLocationCoordinate2DMake(latitude, longitude)
        let spanValue = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        let locationRegion = MKCoordinateRegion(center: coordinateLocation, span: spanValue)
        mainMap.setRegion(locationRegion, animated: true)
        return coordinateLocation
    }
    
    // 업데이트 되는 위치 정보 표시
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation = locations.last // 가장 최근 위치 정보
        myLocation(latitude: (lastLocation?.coordinate.latitude)!, longitude: (lastLocation?.coordinate.longitude)!, delta: 0.01) // 0.01 -> 100배 확대
    }

    // 핀 설정
    func setAnnotation(latitude: CLLocationDegrees, longitude: CLLocationDegrees, delta: Double, Title: String, subTitle: String?){
        let annotation = MKPointAnnotation()
        annotation.coordinate = myLocation(latitude: latitude, longitude: longitude, delta: delta)
        annotation.title = title
        annotation.subtitle = title
        mainMap.addAnnotation(annotation)
    }
}

