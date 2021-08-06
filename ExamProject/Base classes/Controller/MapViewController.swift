//
//  ViewController.swift
//  ExamProject
//
//  Created by Veronika Shadlovskaya on 04.08.2021.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let manager = CLLocationManager()
    var items: [GroupItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        mapView.mapType = .standard
        mapView.showsUserLocation = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
    
    
    func render(_ location: CLLocation) {
        let coordinate = CLLocationCoordinate2D(
            latitude: location.coordinate.latitude,
            longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        fetchItems(
            latitude: location.coordinate.latitude,                
            longitude: location.coordinate.longitude)
    }
    
    func fetchItems(latitude: Double, longitude: Double) {
        let networkManager = NetworkManager()
        networkManager.fetchPlacesNearby(latitude: latitude, longitude: longitude) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let mapObject):
                strongSelf.items = mapObject.response?.groups?[0].items ?? []
                strongSelf.addItemsOnMap()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func addItemsOnMap() {
        for item in items {
            let mapItem = MapObject(
                id: item.venue?.id,
                name: item.venue?.name,
                location: (item.venue?.location!)!)
            mapView.addAnnotation(mapItem)
        }
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
           // manager.stopUpdatingLocation()
            print("didUpdateLocations")
            render(location)
            fetchItems(
                latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude)
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MapObject else {
              return nil
            }
        
            let identifier = "mapObject"
            var view: MKMarkerAnnotationView

            if let dequeuedView = mapView.dequeueReusableAnnotationView(
              withIdentifier: identifier) as? MKMarkerAnnotationView {
              dequeuedView.annotation = annotation
              view = dequeuedView
            } else {
              view = MKMarkerAnnotationView(
                annotation: annotation,
                reuseIdentifier: identifier)
              view.canShowCallout = true
              view.calloutOffset = CGPoint(x: -5, y: 5)
              view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }
            return view
    }
   
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let mapItem = view.annotation as! MapObject
        let vc = CardViewController()
        vc.title = mapItem.title
        vc.id = mapItem.id ?? ""
        navigationController?.pushViewController(vc, animated: true)
    }
}
