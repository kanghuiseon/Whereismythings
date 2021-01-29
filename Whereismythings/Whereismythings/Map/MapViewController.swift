//
//  ViewController.swift
//  Whereismythings
//
//  Created by 강희선 on 2020/12/26.
//

import UIKit
import MapKit
import CoreLocation
import FontAwesome_swift
import Firebase

class MapViewController: UIViewController{
    @IBOutlet var mainMap: MKMapView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var btnGPS: UIButton!
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
        MainMapModel.dataSetting()
        for stuff in MainMapModel.stuffs{
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
        let currentCoordinate: CLLocationCoordinate2D?
        if let userCurrentPosition = locationManager.location{
            currentCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees((userCurrentPosition.coordinate.latitude)), CLLocationDegrees((userCurrentPosition.coordinate.longitude)))
        }
        else{
            currentCoordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(Double("37.5753274")!), longitude: CLLocationDegrees(Double("126.973307")!))
        }
        let spanValue = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let currentRegion = MKCoordinateRegion(center: currentCoordinate!, span: spanValue)
        locationManager.startUpdatingLocation()
        mainMap.setRegion(currentRegion, animated: true)
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
        detailVC.stuffInformation(uid: selectedAnnotation.id, lblPerson: selectedAnnotation.stuffPerson, imgStuff: selectedAnnotation.stuffImage, lblStuffName: selectedAnnotation.stuffName, lblStuffPosition: selectedAnnotation.stuffKoreanPosition, lblGotTime: selectedAnnotation.time)
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
        navButton.setTitleColor(.black, for: .normal)
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
            mapAnnotationView.image = UIImage.fontAwesomeIcon(name: .mapPin, style: .solid, textColor: UIColor.blue, size: CGSize(width: 40, height: 40))
        }
        else{
            mapAnnotationView.image = UIImage.fontAwesomeIcon(name: .mapPin, style: .solid, textColor: UIColor.green, size: CGSize(width: 40, height: 40))
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
