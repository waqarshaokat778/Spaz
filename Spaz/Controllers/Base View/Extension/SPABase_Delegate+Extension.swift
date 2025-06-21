//
//  SPA_Delegate+Extension.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 10/08/2022.
//

import CoreLocation

extension SPABase: CLLocationManagerDelegate {
    func initLocationManager() {
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let loc: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        currentLat = loc.latitude
        currentLng = loc.longitude
    }
}
