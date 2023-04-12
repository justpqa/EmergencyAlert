//
//  EmergencyAlertApp.swift
//  EmergencyAlert
//
//  Created by Anh Phan on 4/8/23.
//

import SwiftUI

@main
struct EmergencyAlertApp: App {
    private var AnEmergencyAlert = EmergencyAlert()
    var body: some Scene {
        WindowGroup {
            EmergencyAlertView(myViewModel: AnEmergencyAlert)
        }
    }
}
