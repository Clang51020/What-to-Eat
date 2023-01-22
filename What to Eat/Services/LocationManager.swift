//
//  LocationManager.swift
//  What to Eat
//
//  Created by Chris Lang on 1/21/23.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    static let shared = LocationManager()
    @Published var userLocation: CLLocation?
    
    func checkIfLocationServicesEnabled() {
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager = CLLocationManager()
                self.locationManager!.delegate = self
            } else {
                print("location services are not enabled.")
            }
    }
    
    private func checkLocationAuth() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("This location is restricted.")
        case .denied:
            print("You have turned off location permission. Go into settings to change it.")
        case .authorizedAlways, .authorizedWhenInUse:
            userLocation = locationManager.location
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuth()
    }
}
