//
//  AppConfiguration.swift
//  MovieTitle
//
//  Created by Abdullah on 17/09/2022.
//

import Foundation
class AppConfiguration {
    
    static let baseUrl: String = {
        return Bundle.main.object(forInfoDictionaryKey: "BaseUrl") as! String
    }()
}
