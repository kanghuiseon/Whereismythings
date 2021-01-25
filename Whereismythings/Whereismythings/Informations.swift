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



// 말풍선 하나
struct ChatMessage {
    var fromUserId: String
    var text: String
    var timestamp: NSNumber
}

// 채팅방
struct Group {
    var key: String
    var name: String
    var messages: Dictionary<String, Int>
    
    init(key: String, name: String) {
        self.key = key
        self.name = name
        self.messages = [:]
    }
    
    init(key: String, data: Dictionary<String, AnyObject>) {
        self.key = key
        self.name = data["name"] as! String
        if let messages = data["messages"] as? Dictionary<String, Int> {
            self.messages = messages
        } else {
            self.messages = [:]
        }
    }
}

// 사용자
struct User {
    var uid: String
    var email: String
    var username: String
    var group: Dictionary<String, String>
    
    init(uid: String, email: String, username: String) {
        self.uid = uid
        self.email = email
        self.username = username
        self.group = [:]
    }
}




