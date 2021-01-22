//
//  ViewController.swift
//  Whereismythings
//
//  Created by 강희선 on 2020/12/26.
//

import UIKit
import MapKit
import CoreLocation
//protocol StuffInfoDelegate{
//    func stuffInformation(lblPerson: String, imgStuff: UIImage?, lblStuffName: String, lblStuffPosition: String, lblGotTime: String?)
//}
class MapViewController: UIViewController{
    @IBOutlet var mainMap: MKMapView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    var stuffs: [MainMapModel] = []
    // 현재 기기 위치 관련 변수
    let locationManager = CLLocationManager()
//    var delegate: StuffInfoDelegate?
    var lostAnnotation = [MKAnnotation]()
    var getAnnotation = [MKAnnotation]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.delegate = DetailStuffViewController()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        mainMap.showsUserLocation = true
        dataSetting()
        for stuff in stuffs{
            if stuff.flag == true{
                let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(stuff.stuffLatitudePosition)!, longitude: CLLocationDegrees(stuff.stuffLongitudePosition)!)
                let annotation = MapAnnotation(coordinate, stuff.id, stuff.stuffPerson, true, stuff.gotTime, stuffName: stuff.stuffName, stuff.stuffCharacteristic, stuff.stuffKoreanPosition, stuff.stuffImage)
                lostAnnotation.append(annotation)
            }
            else if stuff.flag == false{
                let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(stuff.stuffLatitudePosition)!, longitude: CLLocationDegrees(stuff.stuffLongitudePosition)!)
                let annotation = MapAnnotation(coordinate, stuff.id, stuff.stuffPerson, true, stuff.gotTime, stuffName: stuff.stuffName, stuff.stuffCharacteristic, stuff.stuffKoreanPosition, stuff.stuffImage)
                getAnnotation.append(annotation)
            }
        }
        mainMap.addAnnotations(lostAnnotation)
    }
    
    func dataSetting(){
        stuffs.append(MainMapModel(id: 1, gotTime: nil, stuffPerson: "익명1", flag: true, stuffName: "인형", stuffCharacteristic: "새제품", stuffLatitudePosition: "37.5630725", stuffLongitudePosition: "127.0366688", stuffKoreanPosition: "성동구청", stuffImage: #imageLiteral(resourceName: "doll")))
        stuffs.append(MainMapModel(id: 2, gotTime: nil, stuffPerson: "익명2", flag: true, stuffName: "에어팟", stuffCharacteristic: "한쪽", stuffLatitudePosition: "37.5288539", stuffLongitudePosition: "126.9640447", stuffKoreanPosition: "롯데월드", stuffImage: #imageLiteral(resourceName: "IMG_0256")))
        stuffs.append(MainMapModel(id: 3, gotTime: nil, stuffPerson: "noname", flag: true, stuffName: "립스틱", stuffCharacteristic: "핑크빛", stuffLatitudePosition: "37.5121422", stuffLongitudePosition: "126.9954074", stuffKoreanPosition: "세빛둥둥섬", stuffImage: #imageLiteral(resourceName: "lipstic")))
        stuffs.append(MainMapModel(id: 4, gotTime: nil, stuffPerson: "dffef", flag: false, stuffName: "가방", stuffCharacteristic: "노란색", stuffLatitudePosition: "37.4786971", stuffLongitudePosition: "127.0104861", stuffKoreanPosition: "예술의 전당", stuffImage: nil))
        stuffs.append(MainMapModel(id: 5, gotTime: nil, stuffPerson: "익명 4", flag: false, stuffName: "핸드폰", stuffCharacteristic: "아이폰 12", stuffLatitudePosition: "37.5112348", stuffLongitudePosition: "127.0980274", stuffKoreanPosition: "롯데월드", stuffImage: nil))
        stuffs.append(MainMapModel(id: 6, gotTime: nil, stuffPerson: "익명7", flag: false, stuffName: "애플워치", stuffCharacteristic: "se", stuffLatitudePosition: "37.5444535", stuffLongitudePosition: "126.9511752", stuffKoreanPosition: "공덕역", stuffImage: nil))
        stuffs.append(MainMapModel(id: 7, gotTime: nil, stuffPerson: "익명8", flag: true, stuffName: "공책", stuffCharacteristic: "반정도 씀", stuffLatitudePosition: "37.5656229", stuffLongitudePosition: "127.0427489", stuffKoreanPosition: "마장역", stuffImage: nil))
        stuffs.append(MainMapModel(id: 8, gotTime: nil, stuffPerson: "익명9", flag: false, stuffName: "충전기", stuffCharacteristic: "아이폰 충전기", stuffLatitudePosition: "37.5753274", stuffLongitudePosition: "126.973307", stuffKoreanPosition: "경복궁역", stuffImage: nil))
        stuffs.append(MainMapModel(id: 9, gotTime: nil, stuffPerson: "익명3", flag: true, stuffName: "뽑기 인형", stuffCharacteristic: "포켓몬 피카츄 인형", stuffLatitudePosition: "37.5774587", stuffLongitudePosition: "126.9733411", stuffKoreanPosition: "대림미술관", stuffImage: nil))
        stuffs.append(MainMapModel(id: 10, gotTime: nil, stuffPerson: "익명12", flag: false, stuffName: "뽑기 인형", stuffCharacteristic: "무민 인형", stuffLatitudePosition: "37.5728093", stuffLongitudePosition: "126.9788857", stuffKoreanPosition: "교보문고 광화문점", stuffImage: nil))
        stuffs.append(MainMapModel(id: 11, gotTime: nil, stuffPerson: "익명11", flag: true, stuffName: "문제집", stuffCharacteristic: "수학 문제집", stuffLatitudePosition: "37.5525068", stuffLongitudePosition: "127.090441", stuffKoreanPosition: "신토불이 떡볶이", stuffImage: nil))
        stuffs.append(MainMapModel(id: 12, gotTime: nil, stuffPerson: "익명14", flag: true, stuffName: "에어팟 케이스", stuffCharacteristic: "보라색 호랑이 그림", stuffLatitudePosition: "37.5580179", stuffLongitudePosition: "127.046734", stuffKoreanPosition: "한양대학교", stuffImage: nil))
        stuffs.append(MainMapModel(id: 13, gotTime: nil, stuffPerson: "익명15", flag: true, stuffName: "에어팟 한쪽", stuffCharacteristic: "에어팟 프로", stuffLatitudePosition: "37.5522425", stuffLongitudePosition: "126.9218085", stuffKoreanPosition: "홍대 수노래방", stuffImage: nil))
        stuffs.append(MainMapModel(id: 14, gotTime: nil, stuffPerson: "익명16", flag: true, stuffName: "곰돌이 인형", stuffCharacteristic: "갈색 곰돌이", stuffLatitudePosition: "37.5602909", stuffLongitudePosition: "126.9237287", stuffKoreanPosition: "연남파출소", stuffImage: nil))
        stuffs.append(MainMapModel(id: 15, gotTime: nil, stuffPerson: "익명17", flag: true, stuffName: "에어팟 케이스", stuffCharacteristic: "라이온 케이스", stuffLatitudePosition: "37.5562048", stuffLongitudePosition: "126.905603", stuffKoreanPosition: "망원시장", stuffImage: nil))
    }
    
    
    @IBAction func selectedSegmentEvent(_ sender: Any) {
        if segmentedControl.selectedSegmentIndex == 0{
            mainMap.removeAnnotations(getAnnotation)
                for stuff in stuffs{
                    if stuff.flag == true{
                        let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(stuff.stuffLatitudePosition)!, longitude: CLLocationDegrees(stuff.stuffLongitudePosition)!)
                        let annotation = MapAnnotation(coordinate, stuff.id, stuff.stuffPerson, true, stuff.gotTime, stuffName: stuff.stuffName, stuff.stuffCharacteristic, stuff.stuffKoreanPosition, stuff.stuffImage)
                        lostAnnotation.append(annotation)
                    }
                }
            mainMap.addAnnotations(lostAnnotation)
            }
            else{
                for stuff in stuffs{
                    if stuff.flag == false{
                        mainMap.removeAnnotations(lostAnnotation)
                        let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(stuff.stuffLatitudePosition)!, longitude: CLLocationDegrees(stuff.stuffLongitudePosition)!)
                        let annotation = MapAnnotation(coordinate, stuff.id, stuff.stuffPerson, true, stuff.gotTime, stuffName: stuff.stuffName, stuff.stuffCharacteristic, stuff.stuffKoreanPosition, stuff.stuffImage)
                        getAnnotation.append(annotation)
                    }
                }
                mainMap.addAnnotations(getAnnotation)
            }
    }
    // gps, 현재 위치 주변 확대
    @IBAction func btnCurrentPosition(_ sender: UIButton) {
        let userCurrentPosition = locationManager.location
        let currentCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees((userCurrentPosition?.coordinate.latitude)!), CLLocationDegrees((userCurrentPosition?.coordinate.longitude)!))
        let spanValue = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let currentRegion = MKCoordinateRegion(center: currentCoordinate, span: spanValue)
        locationManager.startUpdatingLocation()
        mainMap.setRegion(currentRegion, animated: true)
    }

    @objc func btnDetailView(){
        let detailVC = storyboard?.instantiateViewController(identifier: "DetailStuffViewController") as! DetailStuffViewController
        let selectedAnnotation = mainMap.selectedAnnotations.first as! MapAnnotation
        detailVC.stuffInformation(lblPerson: selectedAnnotation.stuffPerson, imgStuff: selectedAnnotation.stuffImage, lblStuffName: selectedAnnotation.stuffName, lblStuffPosition: selectedAnnotation.stuffKoreanPosition, lblGotTime: selectedAnnotation.time)
        mainMap.deselectAnnotation(selectedAnnotation, animated: false)
        self.present(detailVC, animated: true, completion: nil)
    }
}


extension MapViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //만약 사용자지정이면 return
        guard !annotation.isKind(of: MKUserLocation.self) else { return nil }
        let mapAnnotationView = MapAnnotationView(annotation: annotation, reuseIdentifier: nil)
        if segmentedControl.selectedSegmentIndex == 0{
            mapAnnotationView.image = UIImage.fontAwesomeIcon(name: .mapPin, style: .solid, textColor: .systemIndigo, size: CGSize(width: 40, height: 40))
        }
        else{
            mapAnnotationView.image = UIImage.fontAwesomeIcon(name: .mapPin, style: .solid, textColor: .systemOrange, size: CGSize(width: 40, height: 40))
        }
        let detail = mapAnnotationView.detailCalloutAccessoryView as! MapPinView
        detail.btnPin.addTarget(self, action: #selector(btnDetailView), for: .touchUpInside)
        return mapAnnotationView
    }
}

extension MapViewController: CLLocationManagerDelegate{
    
}
