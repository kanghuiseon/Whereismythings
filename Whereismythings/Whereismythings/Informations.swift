//
//  Informations.swift
//  Whereismythings
//
//  Created by 송낙현 on 2021/01/15.
//

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
}


