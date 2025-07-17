//
//  Config.swift
//  StarPicker
//
//  Created by 송태환 on 7/17/25.
//

import Foundation

enum ConfigKey: String, CaseIterable {
    case nasaApiKey = "NASA_API_KEY"
}

enum ConfigError: LocalizedError {
    case missingInfoDictionary
    case missingKey(ConfigKey)
    
    var errorDescription: String? {
        switch self {
        case .missingInfoDictionary:
            return "Info.plist for not found"
        case .missingKey(let key):
            return "Missing value for \(key)"
        }
    }
}

struct Config {
    private var values: [ConfigKey: String]
    
    init(bundle: Bundle = .main) throws {
        guard let info = bundle.infoDictionary else {
            throw ConfigError.missingInfoDictionary
        }
        
        var temp = [ConfigKey: String]()
        
        for key in ConfigKey.allCases {
            guard let value = info[key.rawValue] as? String else {
                throw ConfigError.missingKey(key)
            }
            
            temp[key] = value
        }
        
        self.values = temp
    }
    
    func get(key: ConfigKey) -> String {
        return values[key]!
    }
}
