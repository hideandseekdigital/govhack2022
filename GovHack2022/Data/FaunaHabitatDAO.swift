//
//  FaunaHabitatDAO.swift
//  GovHack2022
//
//  Created by Adam Balzan on 20/8/2022.
//

import UIKit
import CoreLocation
import MapKit

class FaunaHabitatAnnotationView: MKAnnotationView {
    
    //var annotation: FaunaHabitatAnnotationView?
    
    static func setupView(userLocation: MKUserLocation) -> FaunaHabitatAnnotationView  {
        let annotationView = FaunaHabitatAnnotationView(annotation: userLocation, reuseIdentifier: "identifier_User")
        annotationView.image = UIImage(named: "User")
        annotationView.canShowCallout = false
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.image = UIImage(named: "User")

        if #available(iOS 14.0, *) {
            annotationView.zPriority = .defaultUnselected
        }

        return annotationView

    }
    
    static func setupView(annotation: FaunaHabitatAnnoation, showRightButton: Bool = false) -> FaunaHabitatAnnotationView {
        let annotationView = FaunaHabitatAnnotationView(annotation: annotation, reuseIdentifier: "identifier_\(annotation.title)")
        annotationView.image = UIImage(named: annotation.faunaHabitat.data.pinImageName)
        annotationView.canShowCallout = false
        //annotation = annotation
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.image = UIImage(named: annotation.faunaHabitat.data.pinImageName)

        if #available(iOS 14.0, *) {
            annotationView.zPriority = .defaultUnselected
        }

        return annotationView

    }
    
}

class FaunaHabitatAnnoation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    let faunaHabitat : FaunaHabitat

    init?(faunaHabitat : FaunaHabitat) {
        guard let center = faunaHabitat.geometry?.centroid else { return nil }
        self.coordinate = center
        self.title = faunaHabitat.nameCommon
        self.subtitle = faunaHabitat.category
        self.faunaHabitat = faunaHabitat
    }
}


class Geometry: NSObject {
    let type: String
    // array of
    //        array of
    //            array of points
    let coordinates: [[CLLocationCoordinate2D]] // array (multiple Polygons) of Array (points of (Array coordinates 2 coords) )
    var cachedCentroid: CLLocationCoordinate2D?
    
    init?(dic: [String:Any]) {
        type = dic["type"] as? String ?? ""
        var arrayOfArrayOfCoordinate = [[CLLocationCoordinate2D]]()
        if let coordinatesArray1 = dic["coordinates"] as? [[[Any]]] {
            coordinatesArray1.forEach { (coordinatesArray2) in
                var arrayOfCoordinate = [CLLocationCoordinate2D]()
                coordinatesArray2.forEach { (coordinatesArray3) in

                    if coordinatesArray3.count == 2 {
                        if let lat = coordinatesArray3[1] as? Double, let lng = coordinatesArray3[0] as? Double {
                            arrayOfCoordinate.append(CLLocationCoordinate2DMake(lat, lng))
                        }
                    }
                }
                arrayOfArrayOfCoordinate.append(arrayOfCoordinate)

            }
        }
        coordinates = arrayOfArrayOfCoordinate
        super.init()
        cachedCentroid = self.centroid
    }
    
    var centroid: CLLocationCoordinate2D? {
        guard let array = coordinates.first else { return nil }
        guard let coord1 = array.first else { return nil }
        
            
            var minX = coord1.longitude
            var maxX = coord1.longitude
            var minY = coord1.latitude
            var maxY = coord1.latitude
            
            for i in 1..<array.count {
                let current = array[i]
                if minX > current.longitude {
                    minX = current.longitude
                } else if maxX < current.longitude {
                    maxX = current.longitude
                } else if minY > current.latitude {
                    minY = current.latitude
                } else if maxY < current.latitude {
                    maxY = current.latitude
                }
            }
            
            let centerX = minX + ((maxX - minX) / 2)
            let centerY = minY + ((maxY - minY) / 2)
            return CLLocationCoordinate2D(latitude: centerY, longitude: centerX)
        }
    
    
}


struct FaunaHabitatType {
    let type: String
    let name: String
    let lastSeen: String
    let colour: UIColor
    let pinImageName: String
    let imageName: String
    let headerImageName: String
    let heroImageName: String
    let description: String

    
    init(type: String, name: String, lastSeen: String, colour: UIColor, number:Int) {
        self.type = type
        self.name = name
        self.lastSeen = lastSeen
        self.colour = colour
        pinImageName = "Pin\(number)"
        imageName = "Image\(number)"
        heroImageName = "Hero\(number)"
        headerImageName = "Heading\(number)"

        if number == 1 {
            description = """
Eastern Grey Kangaroo, Macropus giganteus, is a marsupial mammal that belongs to a small group called macropods. They have hind legs that are larger than their forelimbs. Their hind feet are also large and powerful. Their long muscular tail is used for balance when hopping and as a fifth limb when movements are slow. The fur is a light grey woolly colour except the face which is darker. A dark tip of fur is also found on the tail.
"""
        }
        else if number == 2 {
            description = """
The females rarely fly, males can be seen flying in a zig-zag pattern in the warmest part of the day looking for the females. Females’ forewings are dark grey with lighter grey patterning; hind wings are reduced and are bright orange with black spots along the edges. Males’ forewings are dark brown with lighter grey patterning, hind wings bronze to brown with dark brown patches. Both males and females have clubbed antennae.
"""
        }
        else if number == 3 {
            description = """
The females rarely fly, males can be seen flying in a zig-zag pattern in the warmest part of the day looking for the females. Females’ forewings are dark grey with lighter grey patterning; hind wings are reduced and are bright orange with black spots along the edges. Males’ forewings are dark brown with lighter grey patterning, hind wings bronze to brown with dark brown patches. Both males and females have clubbed antennae.
"""
        }
        else if number == 4 {
            description = """
The Greater Glider is Australia’s largest gliding mammal. Greater Gliders have thick, dark grey-brown fur on their back and creamy white fur on their under-side, and can be found in different dark and light-coloured morphs. They have a long, furry prehensile tail and large furry ears.
"""
        }
        else {
            description = """
The little dragon is light brown with three white stripes running down and a number of darker bands running across its body. It is just 15cm from head to tail when fully grown. Unlike most other lizards it doesn't have external ear openings. It’s an energetic little animal for its size and adults can move over 110 metres in a day. The Grassland Earless Dragon was once widespread throughout western Victoria, NSW and the ACT.
"""
        }
        
    }
    
    static let kangaroo = FaunaHabitatType(type: "Common", name: "Eastern grey kangaroo", lastSeen: "Last seen 11.45am 19/08/22", colour: UIColor.commonTint , number: 1)
    static let moth = FaunaHabitatType(type: "Legendary", name: "Golden sun moth", lastSeen: "Last seen 2.45pm 29/08/22", colour: UIColor.legendaryTint, number: 2)
    static let spider = FaunaHabitatType(type: "Agro", name: "Redback spider", lastSeen: "Last seen 9.45pm 9/08/22", colour: UIColor.argoTint, number: 3)
    static let glider = FaunaHabitatType(type: "Rare", name: "Greater glider", lastSeen: "Last seen 11.30am 9/07/22", colour: UIColor.rareTint, number: 4)
    static let dragon = FaunaHabitatType(type: "Epic", name: "Grassland earless dragon", lastSeen: "Last seen 4.55pm 23/08/22", colour: UIColor.epicTint, number: 5)
    
    static func getRandomType() -> FaunaHabitatType {
        switch Int.random(in: 1..<5) {
        case 1:
            return kangaroo
        case 2:
            return moth
        case 3:
            return spider
        case 4:
            return glider
        default:
            return dragon
        }
    }
}

class FaunaHabitat: NSObject {
    let objectID: Int
    let nameCommon: String
    let nameScientific: String
    let category: String
    let type: String
    let location: String
    let statusACT: String
    let statusEPBC: String
    let dataSet: String
    let notes: String?
    let source: String?
    let objectID1: Int
    var geometry: Geometry?
    
    let data: FaunaHabitatType
    

    
    

    init?(dic: [String:Any], geoDic: [String:Any]) {
        
        objectID = dic["OBJECTID"] as? Int ?? 0
        nameCommon = dic["COMMON_NAM"] as? String ?? ""
        nameScientific = dic["SCIENTIFIC"] as? String ?? ""
        category = dic["CATEGORY"] as? String ?? ""
        type = dic["TYPE"] as? String ?? ""
        location = dic["LOCATION"] as? String ?? ""
        statusACT = dic["ACT_STATUS"] as? String ?? ""
        statusEPBC = dic["EPBC_STATUS"] as? String ?? ""
        dataSet = dic["DATASET"] as? String ?? ""
        notes = dic["NOTES"] as? String ?? ""
        source = dic["SOURCE"] as? String ?? ""
        objectID1 = dic["OBJECTID_1"] as? Int ?? 0
        geometry = Geometry(dic: geoDic)
        
        //data = FaunaHabitatType.getRandomType()
        
        if nameCommon == "Peacock Spider" {
            data = FaunaHabitatType.spider
        }
        else if nameCommon == "Greater Glider" {
            data = FaunaHabitatType.glider
        }
        else if nameCommon == "Grassland Earless Dragon" {
            data = FaunaHabitatType.dragon
        }
        else if nameCommon == "Golden Sun Moth" {
            data = FaunaHabitatType.moth
        }
        else if nameCommon == "Striped Legless Lizard" {
            data = FaunaHabitatType.dragon
        }
        else {
            switch Int.random(in: 1..<10) {
            case 1:
                data = FaunaHabitatType.kangaroo
            default:
                return  nil
            }
            
        }
        
        
        
    }
    
    
}

class FaunaHabitatDAO: NSObject {
    
    static let shared = FaunaHabitatDAO()
    
    var features = [FaunaHabitat]()
    var distinctFaunaNames = [String:FaunaHabitat]()
    
    override init() {
        super.init()

        features.removeAll()
        distinctFaunaNames.removeAll()
        guard let url = Bundle.main.url(forResource: "Threatened_Fauna_Habitat", withExtension: "geojson") else {return }
        if let dict = loadJSON(fileName: "Threatened_Fauna_Habitat")  {
            if let dataArray = dict["features"] as? [[String: Any]] {
                dataArray.forEach { item in
                    if let propertiesDic = item["properties"] as? [String:Any] , let geometryDic = item["geometry"] as? [String:Any] {
                        if let object = FaunaHabitat(dic: propertiesDic, geoDic: geometryDic) {
                            features.append(object)
                            
                            if !distinctFaunaNames.keys.contains(object.nameCommon) {
                                distinctFaunaNames[object.nameCommon] = object
                            }
                        }
                    }
                }
            }
        }
    }
    


    
    public func loadJSON(fileName: String) -> [String: Any]? {
        let testBundle = Bundle(for: type(of: self))
        guard let url = testBundle.url(forResource: fileName, withExtension: "geojson") else {return nil}
        guard let data: Data = NSData(contentsOf: url) as Data? else {return nil}

        do {
            let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            guard let dictionary = object as? [String: Any] else {return nil}
            return dictionary
        } catch {
            print("Not parsed")
        }

        return nil
    }

    
    func filtered(rect: MKMapRect) -> [FaunaHabitat] {
        return Array( features.filter { item in
            guard let center = item.geometry?.cachedCentroid else { return false }
            return rect.contains(MKMapPoint(center))
        }.prefix(300))
        
    }
}
