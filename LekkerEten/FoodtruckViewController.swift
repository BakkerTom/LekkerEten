//
//  FoodtruckViewController.swift
//  Foodtruck
//
//  Created by Fhict on 22/12/16.
//  Copyright © 2016 bakker.co. All rights reserved.
//

import UIKit
import MapKit

class FoodtruckViewController: UIViewController {

    var foodtrucks = [Foodtruck]()
    
    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        WebService.retrieveFoodtrucks { (foodtrucks) -> (Void) in
            self.foodtrucks = foodtrucks
            self.mapView.addAnnotations(foodtrucks)
        }
        
        // set initial location in Kaatsheuvel
        let initialLocation = CLLocation(latitude: 51.668178, longitude: 5.034356)
        centerMapOnLocation(initialLocation)
    }

    func centerMapOnLocation(_ location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    

}
