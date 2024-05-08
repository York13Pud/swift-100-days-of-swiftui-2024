//
import MapKit
import SwiftUI

struct ContentView: View {
    @State private var locations = [Location]()
    
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    var body: some View {
        // Use MapReader to get the map co-ords, rather than the screen co-ords:
        MapReader { proxy in
            Map(initialPosition: startPosition) {
                // Show each of the markers in the locations array on the map:
                ForEach(locations) { location in
                    Marker(location.name, coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
                }
            }
            // When a location on the map is tapped, create a location marker:
            .onTapGesture { position in
                if let coordinate = proxy.convert(position, from: .local) {
                    let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
                    locations.append(newLocation)
                    }
                }
            .mapStyle(.hybrid)
        }
    }
}

#Preview {
    ContentView()
}
