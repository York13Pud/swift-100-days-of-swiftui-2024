//
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct CoreImage: View {
    @State private var image: Image?

        var body: some View {
            VStack {
                image?
                    .resizable()
                    .scaledToFit()
            }
            .onAppear(perform: loadImage)
        }
        
    
        // This example will take an image that will be loaded using UI Kit (UIImage, then passed into CIImage
        // that will apply a filter. Lastly, pass the image to Core Graphics (CGImage) that creates the image
        // from the outputImage in CIImage and then pass it back to UIImage to display on the screen.
        //
        // What a mess!! Come on Apple, make this simpler!
        func loadImage() {
            // Load the image and place it into a CIImage:
            let inputImage = UIImage(resource: .example)
            let beginImage = CIImage(image: inputImage)
            
            // Create a context and set the filter to use. Sepia tone makes the image have a brown effect:
            let context = CIContext()
            let currentFilter = CIFilter.sepiaTone()
            
            // Set the intensity of the filter:
            currentFilter.inputImage = beginImage
            currentFilter.intensity = 1
            
            // Get a CIImage from our filter or exit if that fails
            guard let outputImage = currentFilter.outputImage else { return }

            // Attempt to get a CGImage from our CIImage
            guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }

            // Convert that to a UIImage
            let uiImage = UIImage(cgImage: cgImage)

            // and convert that to a SwiftUI image
            image = Image(uiImage: uiImage)
        }
}



#Preview {
    CoreImage()
}
