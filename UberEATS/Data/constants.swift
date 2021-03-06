//
//  constants.swift
//  UberEATS
//
//  Created by WorldMobile on 8/13/18.
//  Copyright © 2018 WorldMobile. All rights reserved.
//

import Foundation


struct K {
    struct bear {
        static let key =  KEYS.ACCESS_BEAR_KEY
    }
    
    struct ProductionServer {
        static let baseURL = "https://api.zxsean.com"
    }
    
    struct APIParameterKey {
        static let password = "password"
        static let email = "email"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}

extension DateFormatter {
    static var businessDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
}

