//
//  MapViewController.swift
//  GovHack2022
//
//  Created by Adam Balzan on 19/8/2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    
    @IBOutlet weak var locationSegmentControl: UISegmentedControl!
    @IBOutlet weak var calloutView: FaunaCalloutView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchField: UITextField!
    
    let mapInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        calloutView.isHidden = true
        
        
        // Toolbar
        let toolbar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolbar.barStyle = .default
        let done =  UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneAction))
        toolbar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), done ]
        toolbar.sizeToFit()
        searchField.inputAccessoryView = toolbar
    }
    
    
    @objc func doneAction() {
        view.endEditing(true)
    }
    
    @objc func locateSelf() {
        MyCLController.shared.start()
        MyCLController.shared.runWhenHaveLocation = { [weak self] in
            self?.locateSelfAction()
        }
        locateSelfAction()
    }
    
    func panTo(coordinate: CLLocationCoordinate2D) {
        let span = 0.04
        var mapRegion = MKCoordinateRegion.init(center: coordinate, span: MKCoordinateSpan.init(latitudeDelta: span, longitudeDelta: span))
        if mapRegion.span.latitudeDelta <= 0.0 || mapRegion.span.longitudeDelta <= 0.0 {
            mapRegion.span.latitudeDelta = 1.0
            mapRegion.span.longitudeDelta = 1.0
        }
        self.mapView.setRegion(mapRegion, animated: true)
    }
    
    
    func locateSelfAction(){
        panTo(coordinate: self.mapView.userLocation.coordinate)
    }
    
    
    @IBAction func locationSegmentChanged(_ sender: Any) {
        if locationSegmentControl.selectedSegmentIndex == 0 {
            self.locateSelf()
        }
    }
    
    
}


extension MapViewController: MKMapViewDelegate {

     func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
         mapView.removeOverlays(mapView.overlays)
         mapView.removeAnnotations(mapView.annotations)
         
         FaunaHabitatDAO.shared.filtered(rect: mapView.visibleMapRect).forEach { hab in
             addToMap(item: hab)
         }
         calloutView.isHidden = true
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyLine = overlay as? MKPolyline {
            let render = MKPolylineRenderer(overlay: polyLine)
            render.strokeColor = .black
            render.lineWidth = 4
            return render
        } else if let circle = overlay as? MKCircle {
            let render = MKCircleRenderer(circle: circle)
            if circle.title == "Radius" {
                render.strokeColor = .black
                render.fillColor = UIColor.black.withAlphaComponent(0.1)
                render.lineWidth = 2
            }
            return render
        } else if let polygon = overlay as? MKPolygon {
            let render = MKPolygonRenderer(overlay: polygon)
            if polygon.title == "SchoolCatchment" {
                render.strokeColor = .black
                render.fillColor = UIColor.black.withAlphaComponent(0.1)
                render.lineWidth = 2
            } else {
                render.strokeColor = .black
                render.fillColor = UIColor.black.withAlphaComponent(0.1)
                render.lineWidth = 4
                mapView.setVisibleMapRect(overlay.boundingMapRect, edgePadding: mapInsets, animated: true)
                
            }
            return render
        }
        mapView.setNeedsDisplay()
        return MKPolygonRenderer(overlay: overlay)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isEqual(mapView.userLocation) {
            return FaunaHabitatAnnotationView.setupView(userLocation: mapView.userLocation)

        }
        
        if let annoation = annotation as? FaunaHabitatAnnoation {
            return FaunaHabitatAnnotationView.setupView(annotation: annoation)
        }
        return nil
        //
//        if let schoolAnnoation = annotation as? SchoolAnnotation {
//            return SchoolAnnotationView.setupView(annotation: schoolAnnoation, showRightButton: true)
//        }
//
//        return CustomCalloutAnnotationView.getAnnotation(mapView, viewFor: annotation, forceSinglePin: false)
    }
//
    
    func addToMap(item: FaunaHabitat) {
        guard let array = item.geometry?.coordinates.first else { return }
        let polygon =  MKPolygon(coordinates: array , count: array.count)
        polygon.title = "SchoolCatchment"
        mapView.addOverlay(polygon)
        if let annotation = FaunaHabitatAnnoation(faunaHabitat: item) {
            mapView.addAnnotation(annotation)
        }
    }
 
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if view.reuseIdentifier == "identifier_User" {
            locateSelfAction()
            calloutView.isHidden = true
        }
        if let view = view as? FaunaHabitatAnnotationView {
            if let anno = view.annotation as? FaunaHabitatAnnoation {
                calloutView.isHidden = false
                calloutView.setupView(faunaHabitat: anno.faunaHabitat, action: {
                    let navController = UINavigationController(rootViewController: InfoTableViewController.controller(fauna: anno.faunaHabitat))
                    navController.setNavigationBarHidden(true, animated: false)
                    self.navigationController?.present(navController, animated: true, completion: nil)
                })

            }

        }
       
    }
    
    func makeRect(coordinates: [CLLocationCoordinate2D]) -> MKMapRect {
        var rect = MKMapRect()
        var coordinates = coordinates
        if !coordinates.isEmpty {
            let first = coordinates.removeFirst()
            var top = first.latitude
            var bottom = first.latitude
            var left = first.longitude
            var right = first.longitude
            coordinates.forEach { coordinate in
                top = max(top, coordinate.latitude)
                bottom = min(bottom, coordinate.latitude)
                left = min(left, coordinate.longitude)
                right = max(right, coordinate.longitude)
            }
            let topLeft = MKMapPoint(CLLocationCoordinate2D(latitude: top, longitude: left))
            let bottomRight = MKMapPoint(CLLocationCoordinate2D(latitude: bottom, longitude: right))
            rect = MKMapRect(x: topLeft.x, y: topLeft.y, width: bottomRight.x - topLeft.x, height: bottomRight.y - topLeft.y)
        }
        return rect
    }
    
}
