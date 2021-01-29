//
//  MainMapModel.swift
//  Whereismythings
//
//  Created by 강희선 on 2021/01/13.
//

import Foundation
import UIKit
import Firebase

struct MainMapModel{
    var id: String
    var stuffPerson: String
    var flag: Bool
    var gotTime: String?
    var stuffName: String
    var stuffCharacteristic: String?
    var stuffLatitudePosition: String
    var stuffLongitudePosition: String
    var stuffKoreanPosition: String
    var stuffImage: UIImage?
    static var stuffs: [MainMapModel] = []
    
    init(id: String, gotTime: String?, stuffPerson: String, flag: Bool, stuffName: String, stuffCharacteristic: String?, stuffLatitudePosition: String,
         stuffLongitudePosition: String, stuffKoreanPosition: String, stuffImage: UIImage?) {
        self.id = id
        self.stuffPerson = stuffPerson
        self.flag = flag
        self.stuffName = stuffName
        self.stuffCharacteristic = stuffCharacteristic
        self.stuffLatitudePosition = stuffLatitudePosition
        self.stuffLongitudePosition = stuffLongitudePosition
        self.stuffKoreanPosition = stuffKoreanPosition
        guard let image = stuffImage else { return }
        self.stuffImage = image
    }
    
    static func dataSetting() -> [MainMapModel]{
        var tmpStuffs: [MainMapModel] = []
        tmpStuffs.append(MainMapModel(id: "Gtp24gAsLLe3MvEOe4qaCkY1Lic2", gotTime: nil, stuffPerson: "익명1", flag: true, stuffName: "인형", stuffCharacteristic: "새제품", stuffLatitudePosition: "37.5630725", stuffLongitudePosition: "127.0366688", stuffKoreanPosition: "성동구청", stuffImage: #imageLiteral(resourceName: "doll")))
        tmpStuffs.append(MainMapModel(id: "Gtp24gAsLLe3MvEOe4qaCkY1Lic2", gotTime: nil, stuffPerson: "익명2", flag: true, stuffName: "에어팟", stuffCharacteristic: "한쪽", stuffLatitudePosition: "37.5288539", stuffLongitudePosition: "126.9640447", stuffKoreanPosition: "롯데월드", stuffImage: #imageLiteral(resourceName: "IMG_0256")))
        tmpStuffs.append(MainMapModel(id: "Gtp24gAsLLe3MvEOe4qaCkY1Lic2", gotTime: nil, stuffPerson: "noname", flag: true, stuffName: "립스틱", stuffCharacteristic: "핑크빛", stuffLatitudePosition: "37.5121422", stuffLongitudePosition: "126.9954074", stuffKoreanPosition: "세빛둥둥섬", stuffImage: #imageLiteral(resourceName: "lipstic")))
        tmpStuffs.append(MainMapModel(id: "Gtp24gAsLLe3MvEOe4qaCkY1Lic2", gotTime: nil, stuffPerson: "dffef", flag: false, stuffName: "가방", stuffCharacteristic: "노란색", stuffLatitudePosition: "37.4786971", stuffLongitudePosition: "127.0104861", stuffKoreanPosition: "예술의 전당", stuffImage: #imageLiteral(resourceName: "bag")))
        tmpStuffs.append(MainMapModel(id: "Gtp24gAsLLe3MvEOe4qaCkY1Lic2", gotTime: nil, stuffPerson: "익명 4", flag: false, stuffName: "핸드폰", stuffCharacteristic: "아이폰 12", stuffLatitudePosition: "37.5112348", stuffLongitudePosition: "127.0980274", stuffKoreanPosition: "롯데월드", stuffImage: #imageLiteral(resourceName: "iphone12")))
        tmpStuffs.append(MainMapModel(id: "Gtp24gAsLLe3MvEOe4qaCkY1Lic2", gotTime: nil, stuffPerson: "익명7", flag: false, stuffName: "애플워치", stuffCharacteristic: "se", stuffLatitudePosition: "37.5444535", stuffLongitudePosition: "126.9511752", stuffKoreanPosition: "공덕역", stuffImage: #imageLiteral(resourceName: "applewatch")))
        tmpStuffs.append(MainMapModel(id: "Gtp24gAsLLe3MvEOe4qaCkY1Lic2", gotTime: nil, stuffPerson: "익명8", flag: true, stuffName: "공책", stuffCharacteristic: "반정도 씀", stuffLatitudePosition: "37.5656229", stuffLongitudePosition: "127.0427489", stuffKoreanPosition: "마장역", stuffImage: #imageLiteral(resourceName: "note")))
        tmpStuffs.append(MainMapModel(id: "Gtp24gAsLLe3MvEOe4qaCkY1Lic2", gotTime: nil, stuffPerson: "익명9", flag: false, stuffName: "충전기", stuffCharacteristic: "아이폰 충전기", stuffLatitudePosition: "37.5753274", stuffLongitudePosition: "126.973307", stuffKoreanPosition: "경복궁역", stuffImage: nil))
        tmpStuffs.append(MainMapModel(id: "Gtp24gAsLLe3MvEOe4qaCkY1Lic2", gotTime: nil, stuffPerson: "익명3", flag: true, stuffName: "뽑기 인형", stuffCharacteristic: "포켓몬 피카츄 인형", stuffLatitudePosition: "37.5774587", stuffLongitudePosition: "126.9733411", stuffKoreanPosition: "대림미술관", stuffImage: nil))
        tmpStuffs.append(MainMapModel(id: "Gtp24gAsLLe3MvEOe4qaCkY1Lic2", gotTime: nil, stuffPerson: "익명12", flag: false, stuffName: "뽑기 인형", stuffCharacteristic: "무민 인형", stuffLatitudePosition: "37.5728093", stuffLongitudePosition: "126.9788857", stuffKoreanPosition: "교보문고 광화문점", stuffImage: nil))
        tmpStuffs.append(MainMapModel(id: "Gtp24gAsLLe3MvEOe4qaCkY1Lic2", gotTime: nil, stuffPerson: "익명11", flag: true, stuffName: "문제집", stuffCharacteristic: "수학 문제집", stuffLatitudePosition: "37.5525068", stuffLongitudePosition: "127.090441", stuffKoreanPosition: "신토불이 떡볶이", stuffImage: nil))
        tmpStuffs.append(MainMapModel(id: "Gtp24gAsLLe3MvEOe4qaCkY1Lic2", gotTime: nil, stuffPerson: "익명14", flag: true, stuffName: "에어팟 케이스", stuffCharacteristic: "보라색 호랑이 그림", stuffLatitudePosition: "37.5580179", stuffLongitudePosition: "127.046734", stuffKoreanPosition: "한양대학교", stuffImage: #imageLiteral(resourceName: "procase")))
        tmpStuffs.append(MainMapModel(id: "Gtp24gAsLLe3MvEOe4qaCkY1Lic2", gotTime: nil, stuffPerson: "익명15", flag: true, stuffName: "에어팟 한쪽", stuffCharacteristic: "에어팟 프로", stuffLatitudePosition: "37.5522425", stuffLongitudePosition: "126.9218085", stuffKoreanPosition: "홍대 수노래방", stuffImage: nil))
        tmpStuffs.append(MainMapModel(id: "Gtp24gAsLLe3MvEOe4qaCkY1Lic2", gotTime: nil, stuffPerson: "익명16", flag: true, stuffName: "곰돌이 인형", stuffCharacteristic: "갈색 곰돌이", stuffLatitudePosition: "37.5602909", stuffLongitudePosition: "126.9237287", stuffKoreanPosition: "연남파출소", stuffImage: nil))
        tmpStuffs.append(MainMapModel(id: "Gtp24gAsLLe3MvEOe4qaCkY1Lic2", gotTime: nil, stuffPerson: "익명17", flag: true, stuffName: "에어팟 케이스", stuffCharacteristic: "라이온 케이스", stuffLatitudePosition: "37.5562048", stuffLongitudePosition: "126.905603", stuffKoreanPosition: "망원시장", stuffImage: nil))
        stuffs = tmpStuffs
        
        return tmpStuffs
    }
        
}


