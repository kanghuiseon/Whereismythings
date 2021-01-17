//
//  Informations.swift
//  Whereismythings
//
//  Created by 송낙현 on 2021/01/15.
//
import UIKit
import Foundation


class LoginInformations {
    
   
    var id : String
    var email : String
    var password : String
    
    init(id : String, email : String, password: String) {
       
        self.id = id
        self.email = email
        self.password = password
    }
    
    var lostItems: [ItemInfo] = [ItemInfo(name: "에어팟맥스")]
    var foundItems: [ItemInfo] = []
}

/// 사용자가 등록한 아이템의 정보
struct ItemInfo {
    let name: String // 물건 이름
    let tag: [String] = [] // 맥미니, 멕미니, macMini, MacMini, MAC MINI, 애플 에플 
    let images: [UIImage] = []
//    let type: TypeOfItem
}

//enum TypeOfItem {
//    case lost, found, wish
//}

