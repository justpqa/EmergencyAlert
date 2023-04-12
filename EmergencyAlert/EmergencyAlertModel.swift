//
//  EmergencyAlertModel.swift
//  EmergencyAlert
//
//  Created by Anh Phan on 4/9/23.
//

import Foundation
import CoreLocation
import UIKit
import SwiftUI
import CoreLocation

class EmergencyAlertModel: NSObject, CLLocationManagerDelegate {
    
    private static let phoneData = PhoneNumberData()
    private let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var currentCountry: String
    var locationUpdated: ((CLLocation) -> Void)?
    
    override init() {
        currentCountry = ""
        super.init()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        currentLocation = location

        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            // Process Response
            if let error = error {
                print("Unable to Reverse Geocode Location (\(error))")
            } else {
                if let placemarks = placemarks, let placemark = placemarks.first {
                    self.currentCountry = placemark.isoCountryCode ?? "error"
                }
                print("Country code: \(self.currentCountry)")
                print("Location updated: \(String(describing: self.currentLocation?.coordinate.longitude ?? 0.0)) \(String(describing: self.currentLocation?.coordinate.latitude ?? 0.0))")
            }
        }
        locationUpdated?(location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location: \(error.localizedDescription)")
    }
    
    func callPolice() {
        var police = EmergencyAlertModel.phoneData.getPolice(currentCountry)
        /*
        if let phoneURL = URL(string: "tel://\(police)"), UIApplication.shared.canOpenURL(phoneURL) {
                UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
        }
        */
        print(police)
    }
    
    func callFire() {
        var fire = EmergencyAlertModel.phoneData.getFire(currentCountry)
        /*
        if let phoneURL = URL(string: "tel://\(fire)"), UIApplication.shared.canOpenURL(phoneURL) {
                UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
        }
        */
        print(fire)
    }
    
    func callAmbulance() {
        var ambulance = EmergencyAlertModel.phoneData.getAmbulance(currentCountry)
        /*
        if let phoneURL = URL(string: "tel://\(ambulance)"), UIApplication.shared.canOpenURL(phoneURL) {
                UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
        }
        */
        print(ambulance)
    }
    
    func getCountry() -> String {
        return currentCountry
    }
    
    func getLong() -> Double {
        return currentLocation?.coordinate.longitude ?? 0.0
    }
    
    func getLat() -> Double {
        return currentLocation?.coordinate.latitude ?? 0.0
    }
}

