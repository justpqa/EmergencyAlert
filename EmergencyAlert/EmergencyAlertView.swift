//
//  ContentView.swift
//  EmergencyAlert
//
//  Created by Anh Phan on 4/8/23.
//

import SwiftUI

struct EmergencyAlertView: View {
    
    @ObservedObject var myViewModel: EmergencyAlert = EmergencyAlert()
    @State private var message: String = ""
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.purple)
                    .frame(height: 80)
                Text("Welcome to One Touch Help")
                    .font(.title)
                    .foregroundColor(.white)
            }
            Spacer()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    EmergencyButton(type: "Ambulance")
                    Spacer()
                    EmergencyButton(type: "Police")
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    EmergencyButton(type: "Fire")
                    Spacer()
                    EmergencyButton(type: "Send text")
                    Spacer()
                }
                Spacer()
            }
            Spacer()
            TextField("Type your message here to send to your emergency contact. Your latitude and longtitude will be sent along with your text.", text: $message, axis: .vertical)
                .lineLimit(4, reservesSpace: true)
                .border(Color.red)
                .textFieldStyle(.roundedBorder)
                .onSubmit {}
            HStack {
                sendtext
                Spacer()
                EContact
            }
            .padding()
        }
    }
    
    var sendtext: some View {
        Button(action: {
            // some function to work on these inputs
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill()
                    .foregroundColor(.red)
                    .frame(height: 50)
                Text("Send Text")
                    .foregroundColor(.white)
            }
        }
    }
    
    var EContact: some View {
        Button(action: {
            // some function to work on these inputs
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill()
                    .foregroundColor(.red)
                    .frame(height: 50)
                Text("Emergency Contact")
                    .foregroundColor(.white)
            }
        }
    }
    
}

struct EmergencyButton: View {
    @ObservedObject var myViewModel: EmergencyAlert = EmergencyAlert()
    
    let type: String
    
    var TxttoSym: [String:String] = [
        "Police": "🚨",
        "Fire": "🔥",
        "Ambulance": "🚑",
        "Send text": "💬"
    ]
    
    var body: some View {
        Button(action: {
            if type == "Police" {
                myViewModel.callPolice()
            } else if type == "Fire" {
                myViewModel.callFire()
            } else if type == "Ambulance" {
                myViewModel.callAmbulance()
            } else {
                print("Send a text")
            }
        }) {
            ZStack {
                RoundedRectangle(cornerRadius : 20)
                    .fill()
                    .foregroundColor(.red)
                    .frame(width: 150, height: 150)
                VStack {
                    Text(TxttoSym[type]!)
                        .font(.largeTitle)
                    Text(type)
                        .foregroundColor(.black)
                }
            }
        }
    }
}


struct EmergencyAlertView_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyAlertView(myViewModel: EmergencyAlert())
    }
}
