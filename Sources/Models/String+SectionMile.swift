import Foundation

extension String {

    var sectionMiles: Float? {
        let components = self.components(separatedBy: CharacterSet.decimalDigits.inverted)
        guard components.count == 3, let km = Int(components[0]), let m = Int(components[2]) else { return nil }
        let miles = Float(km) + Float(m) / 1000
        return round(miles * 1000) / 1000
    }
    
}
