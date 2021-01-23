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
    @IBOutlet var btnGPS: UIButton!
    var stuffs: [MainMapModel] = []
    // 현재 기기 위치 관련 변수
    let locationManager = CLLocationManager()
    var lostAnnotation = [MapAnnotation]()
    var getAnnotation = [MapAnnotation]()
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavigationButton("전체 보기")
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        mainMap.showsUserLocation = true
        dataSetting()
        for stuff in stuffs{
            if stuff.flag == true{
                let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(stuff.stuffLatitudePosition)!, longitude: CLLocationDegrees(stuff.stuffLongitudePosition)!)
                let annotation = MapAnnotation(coordinate, stuff.id, stuff.stuffPerson, stuff.flag, stuff.gotTime, stuffName: stuff.stuffName, stuff.stuffCharacteristic, stuff.stuffKoreanPosition, stuff.stuffImage)
                getAnnotation.append(annotation)
            }
            else if stuff.flag == false{
                let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(stuff.stuffLatitudePosition)!, longitude: CLLocationDegrees(stuff.stuffLongitudePosition)!)
                let annotation = MapAnnotation(coordinate, stuff.id, stuff.stuffPerson, stuff.flag, stuff.gotTime, stuffName: stuff.stuffName, stuff.stuffCharacteristic, stuff.stuffKoreanPosition, stuff.stuffImage)
                lostAnnotation.append(annotation)
            }
        }
        mainMap.addAnnotations(getAnnotation)
        let userCurrentPosition = locationManager.location
        let currentCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees((userCurrentPosition?.coordinate.latitude)!), CLLocationDegrees((userCurrentPosition?.coordinate.longitude)!))
        let spanValue = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let currentRegion = MKCoordinateRegion(center: currentCoordinate, span: spanValue)
        locationManager.startUpdatingLocation()
        mainMap.setRegion(currentRegion, animated: true)
        
    }
   
    func dataSetting(){
        stuffs.append(MainMapModel(id: 1, gotTime: nil, stuffPerson: "익명1", flag: true, stuffName: "인형", stuffCharacteristic: "새제품", stuffLatitudePosition: "37.5630725", stuffLongitudePosition: "127.0366688", stuffKoreanPosition: "성동구청", stuffImage: #imageLiteral(resourceName: "doll")))
        stuffs.append(MainMapModel(id: 2, gotTime: nil, stuffPerson: "익명2", flag: true, stuffName: "에어팟", stuffCharacteristic: "한쪽", stuffLatitudePosition: "37.5288539", stuffLongitudePosition: "126.9640447", stuffKoreanPosition: "롯데월드", stuffImage: #imageLiteral(resourceName: "IMG_0256")))
        stuffs.append(MainMapModel(id: 3, gotTime: nil, stuffPerson: "noname", flag: true, stuffName: "립스틱", stuffCharacteristic: "핑크빛", stuffLatitudePosition: "37.5121422", stuffLongitudePosition: "126.9954074", stuffKoreanPosition: "세빛둥둥섬", stuffImage: #imageLiteral(resourceName: "lipstic")))
        stuffs.append(MainMapModel(id: 4, gotTime: nil, stuffPerson: "dffef", flag: false, stuffName: "가방", stuffCharacteristic: "노란색", stuffLatitudePosition: "37.4786971", stuffLongitudePosition: "127.0104861", stuffKoreanPosition: "예술의 전당", stuffImage: #imageLiteral(resourceName: "bag")))
        stuffs.append(MainMapModel(id: 5, gotTime: nil, stuffPerson: "익명 4", flag: false, stuffName: "핸드폰", stuffCharacteristic: "아이폰 12", stuffLatitudePosition: "37.5112348", stuffLongitudePosition: "127.0980274", stuffKoreanPosition: "롯데월드", stuffImage: #imageLiteral(resourceName: "iphone12")))
        stuffs.append(MainMapModel(id: 6, gotTime: nil, stuffPerson: "익명7", flag: false, stuffName: "애플워치", stuffCharacteristic: "se", stuffLatitudePosition: "37.5444535", stuffLongitudePosition: "126.9511752", stuffKoreanPosition: "공덕역", stuffImage: #imageLiteral(resourceName: "applewatch")))
        stuffs.append(MainMapModel(id: 7, gotTime: nil, stuffPerson: "익명8", flag: true, stuffName: "공책", stuffCharacteristic: "반정도 씀", stuffLatitudePosition: "37.5656229", stuffLongitudePosition: "127.0427489", stuffKoreanPosition: "마장역", stuffImage: #imageLiteral(resourceName: "note")))
        stuffs.append(MainMapModel(id: 8, gotTime: nil, stuffPerson: "익명9", flag: false, stuffName: "충전기", stuffCharacteristic: "아이폰 충전기", stuffLatitudePosition: "37.5753274", stuffLongitudePosition: "126.973307", stuffKoreanPosition: "경복궁역", stuffImage: nil))
        stuffs.append(MainMapModel(id: 9, gotTime: nil, stuffPerson: "익명3", flag: true, stuffName: "뽑기 인형", stuffCharacteristic: "포켓몬 피카츄 인형", stuffLatitudePosition: "37.5774587", stuffLongitudePosition: "126.9733411", stuffKoreanPosition: "대림미술관", stuffImage: nil))
        stuffs.append(MainMapModel(id: 10, gotTime: nil, stuffPerson: "익명12", flag: false, stuffName: "뽑기 인형", stuffCharacteristic: "무민 인형", stuffLatitudePosition: "37.5728093", stuffLongitudePosition: "126.9788857", stuffKoreanPosition: "교보문고 광화문점", stuffImage: nil))
        stuffs.append(MainMapModel(id: 11, gotTime: nil, stuffPerson: "익명11", flag: true, stuffName: "문제집", stuffCharacteristic: "수학 문제집", stuffLatitudePosition: "37.5525068", stuffLongitudePosition: "127.090441", stuffKoreanPosition: "신토불이 떡볶이", stuffImage: nil))
        stuffs.append(MainMapModel(id: 12, gotTime: nil, stuffPerson: "익명14", flag: true, stuffName: "에어팟 케이스", stuffCharacteristic: "보라색 호랑이 그림", stuffLatitudePosition: "37.5580179", stuffLongitudePosition: "127.046734", stuffKoreanPosition: "한양대학교", stuffImage: #imageLiteral(resourceName: "procase")))
        stuffs.append(MainMapModel(id: 13, gotTime: nil, stuffPerson: "익명15", flag: true, stuffName: "에어팟 한쪽", stuffCharacteristic: "에어팟 프로", stuffLatitudePosition: "37.5522425", stuffLongitudePosition: "126.9218085", stuffKoreanPosition: "홍대 수노래방", stuffImage: nil))
        stuffs.append(MainMapModel(id: 14, gotTime: nil, stuffPerson: "익명16", flag: true, stuffName: "곰돌이 인형", stuffCharacteristic: "갈색 곰돌이", stuffLatitudePosition: "37.5602909", stuffLongitudePosition: "126.9237287", stuffKoreanPosition: "연남파출소", stuffImage: nil))
        stuffs.append(MainMapModel(id: 15, gotTime: nil, stuffPerson: "익명17", flag: true, stuffName: "에어팟 케이스", stuffCharacteristic: "라이온 케이스", stuffLatitudePosition: "37.5562048", stuffLongitudePosition: "126.905603", stuffKoreanPosition: "망원시장", stuffImage: nil))
    }
    
    
    @IBAction func selectedSegmentEvent(_ sender: Any) {
        //주운사람
        if segmentedControl.selectedSegmentIndex == 0{
            mainMap.removeAnnotations(lostAnnotation)
            mainMap.addAnnotations(getAnnotation)
        }
        // 잃어버린 사람
        else{
            mainMap.removeAnnotations(getAnnotation)
            mainMap.addAnnotations(lostAnnotation)
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
        let selectedAnnotation = mainMap.selectedAnnotations.first as! MapAnnotation
        print("selectedAnnotation: ", selectedAnnotation.flag)
        let identifier = selectedAnnotation.flag ? "GetStuffViewController" : "LostStuffViewController"
        print("identifier: ", identifier)
        let detailVC = storyboard?.instantiateViewController(identifier: identifier) as! DetailStuffViewController
        detailVC.stuffInformation(lblPerson: selectedAnnotation.stuffPerson, imgStuff: selectedAnnotation.stuffImage, lblStuffName: selectedAnnotation.stuffName, lblStuffPosition: selectedAnnotation.stuffKoreanPosition, lblGotTime: selectedAnnotation.time)
        mainMap.deselectAnnotation(selectedAnnotation, animated: false)
        self.present(detailVC, animated: true, completion: nil)
    }

    @objc func showVisibleAnnotations(_ sender: UIBarButtonItem) {
        let visibleTV = storyboard?.instantiateViewController(identifier: "VisibleStuffViewController") as! VisibleStuffViewController
        // 현재 보이는 map rect
        let visibleAnnotationsRect = mainMap.visibleMapRect
        // map 의 핀들
        let visibleAnnotations = mainMap.annotations
        var visibleAnno:[MKAnnotation] = []
        // 현재 위치인거 빼주기
        for visible in visibleAnnotations{
            if visible.isKind(of: MKUserLocation.self){
            }
            else{
                visibleAnno.append(visible)
            }
        }

        var visibleStuffs:[MapAnnotation] = []
        // visibleAnno : 현재위치를 뺀 나머지 annotation
        for annotation in visibleAnno{
            if segmentedControl.selectedSegmentIndex == 0{
                if visibleAnnotationsRect.contains(MKMapPoint(annotation.coordinate)){
                    if getAnnotation.contains(annotation as! MapAnnotation){
                        visibleStuffs.append(annotation as! MapAnnotation)
                    }
                }
            }else{
                if visibleAnnotationsRect.contains(MKMapPoint(annotation.coordinate)){
                    if lostAnnotation.contains(annotation as! MapAnnotation){
                        visibleStuffs.append(annotation as! MapAnnotation)
                    }
                }
            }
        }
        visibleTV.visibleStuffs = visibleStuffs
        visibleTV.modalPresentationStyle = .fullScreen
        present(visibleTV, animated: true, completion: nil)
    }
    
    func addNavigationButton(_ title: String){
        let navButton = UIButton(type: .custom)
        navButton.setTitle(title, for: .normal)
        navButton.setTitleColor(.white, for: .normal)
        navButton.addTarget(self, action: #selector(showVisibleAnnotations), for: .touchUpInside)
        let barButtonItem = UIBarButtonItem(customView: navButton)
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
}


extension MapViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //만약 사용자지정이면 return
        guard !annotation.isKind(of: MKUserLocation.self) else { return nil }
        let mapAnnotationView = MapAnnotationView(annotation: annotation, reuseIdentifier: nil)
        if segmentedControl.selectedSegmentIndex == 0{
            mapAnnotationView.image = UIImage.fontAwesomeIcon(name: .mapPin, style: .solid, textColor: UIColor(hexString: "072452"), size: CGSize(width: 40, height: 40))
        }
        else{
            mapAnnotationView.image = UIImage.fontAwesomeIcon(name: .mapPin, style: .solid, textColor: UIColor(hexString: "EB8942"), size: CGSize(width: 40, height: 40))
        }
        let detail = mapAnnotationView.detailCalloutAccessoryView as! MapPinView
        detail.btnPin.addTarget(self, action: #selector(btnDetailView), for: .touchUpInside)
        return mapAnnotationView
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let selectedAnnotation = view.annotation as! MapAnnotation
        if let img = selectedAnnotation.stuffImage{
            (view.detailCalloutAccessoryView as! MapPinView).btnPin.setImage(img, for: .normal)

        }
    }
}

extension MapViewController: CLLocationManagerDelegate{
    
}
