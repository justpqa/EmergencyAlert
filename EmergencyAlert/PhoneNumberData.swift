//
//  PhoneNumberData.swift
//  EmergencyAlert
//
//  Created by Anh Phan on 4/9/23.
//

import Foundation

class PhoneNumberData {
    
    private var PhoneData: [String:[String:String]] = [
        "DZ": [
            "Police" : "18",
            "Fire" : "14",
            "Ambulance" : "14"
        ],
        "VN" : [
            "Police" : "113",
            "Fire" : "114",
            "Ambulance" : "115"
        ],
        "PG" : [
            "Police" : "112",
            "Fire" : "110",
            "Ambulance" : "111"
        ],
        "CN" : [
            "Police" : "110",
            "Fire" : "119",
            "Ambulance" : "120"
        ],
        "ES" : [
            "Police" : "112",
            "Fire" : "112",
            "Ambulance" : "112"
        ],
        "AU" : [
            "Police" : "000",
            "Fire" : "000",
            "Ambulance" : "000"
        ],
        "SG" : [
            "Police" : "999",
            "Fire" : "955",
            "Ambulance" : "955"
        ],
        "LK" : [
            "Police" : "119",
            "Fire" : "110",
            "Ambulance" : "110"
        ],
        "MV" : [
            "Police" : "119",
            "Fire" : "118",
            "Ambulance" : "102"
        ],
        "LA" : [
            "Police" : "191",
            "Fire" : "190",
            "Ambulance" : "195"
        ],
        "US" : [
            "Police" : "911",
            "Fire" : "911",
            "Ambulance" : "911"
        ],
        "DE" : [
            "Police" : "112",
            "Fire" : "112",
            "Ambulance" : "112"
        ],
        "GR" : [
            "Police" : "112",
            "Fire" : "112",
            "Ambulance" : "112"
        ],
        "HU" : [
            "Police" : "112",
            "Fire" : "112",
            "Ambulance" : "112"
        ],
        "test" : [
            "Police" : "5075817894",
            "Fire" : "5075817894",
            "Ambulance" : "5075817894"
        ], // this one is used to test if the features work right in order to not call police unintentionally
        "" : [
            "Police" : " ",
            "Fire" : " ",
            "Ambulance" : " "
        ]
    ]
    
    func getPolice(_ country: String) -> String {
        return PhoneData[country]!["Police"]!
    }
    
    func getFire(_ country: String) -> String {
        return PhoneData[country]!["Fire"]!
    }
    
    func getAmbulance(_ country: String) -> String {
        return PhoneData[country]!["Ambulance"]!
    }
}
