//

import MapKit
import SwiftUI

struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

let locations = [
    Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
    Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
]

struct MapKitExample: View {

    var body: some View {
        // Show both locations on the map. It will default to show a map with both markers:
        Map {
            // This will use the default iOS map markers:
//            ForEach(locations) { location in
//                Marker(location.name, coordinate: location.coordinate)
//            }
            
            // This will use a custom marker / annotation:
            ForEach(locations) { location in
                Annotation(location.name, coordinate: location.coordinate) {
                    Text(location.name)
                        .font(.headline)
                        .padding()
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                }
                .annotationTitles(.hidden)
            }
            // This will show the location data in the debug console:
//            MapReader { proxy in
//                Map()
//                    .onTapGesture { position in
//                        if let coordinate = proxy.convert(position, from: .local) {
//                            print(coordinate)
//                        }
//                    }
//            }
        }
    }
}

#Preview {
    MapKitExample()
}
