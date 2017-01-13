//
//  Foodtruck.swift
//  Foodtruck
//
//  Created by Fhict on 22/12/16.
//  Copyright © 2016 bakker.co. All rights reserved.
//

import Foundation
import MapKit
import Alamofire
import Contacts


class Foodtruck: NSObject, MKAnnotation{
    
    let id: Int?
    let storeName: String?
    let coordinate: CLLocationCoordinate2D
    
    
    init(id: Int, storeName: String, coordinate: CLLocationCoordinate2D) {
        self.id = id
        self.storeName = storeName
        self.coordinate = coordinate
    }
    
    init(data: [String:Any]) {
        self.id = data["id"] as? Int
        self.storeName = data["store_name"] as? String
        let latitude = (data["latitude"] as! NSString).doubleValue
        let longitude = (data["longitude"] as! NSString).doubleValue
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    
    func pinTintColor() -> UIColor  {
            return MKPinAnnotationView.greenPinColor()
        
    }
    
    // annotation callout opens this mapItem in Maps app
    func mapItem() -> MKMapItem {
        let addressDict = [CNPostalAddressStreetKey: storeName!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = storeName
        
        return mapItem
    }
    
}
