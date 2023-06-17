//
//  EmergencyAlertViewModel.swift
//  EmergencyAlert
//
//  Created by Anh Phan on 4/9/23.
//

import Foundation
import CoreLocation
import UIKit
import SwiftUI


class EmergencyAlert: ObservableObject {
    
    @Published private var EAlert = EmergencyAlertModel()
    
    func getCountry() -> String {
        return EAlert.getCountry()
    }
    
    func getLong() -> Double {
        return EAlert.getLong()
    }
    
    func getLat() -> Double {
        return EAlert.getLat()
    }
    
    func callPolice() {
        EAlert.callPolice()
    }
    
    func callFire() {
        EAlert.callFire()
    }
    
    func callAmbulance() {
        EAlert.callAmbulance()
    }
    
    
}


