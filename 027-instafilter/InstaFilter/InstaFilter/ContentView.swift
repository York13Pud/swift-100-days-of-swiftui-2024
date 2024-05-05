//

import CoreImage
import CoreImage.CIFilterBuiltins

import PhotosUI
import SwiftUI

struct ContentView: View {
    // Slider values:
    @State private var filterIntensity = 0.0
    @State private var filterRadius = 0.0
    @State private var filterScale = 0.0

    // Filter settings:
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @State private var processedImage: Image?
    @State private var selectedItem: PhotosPickerItem?
    
    // View visibility / enables:
    @State private var imageShown = false
    @State private var showingFilters = false
    


    let context = CIContext()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // Show either and image or a notice to indicate that there is no image loaded
                // and offer the user an option to load an image:
                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Import a photo to get started"))
                            
                    }
                }
                .buttonStyle(.plain)
                .onChange(of: selectedItem, loadImage)

                Spacer()
                
                // Display a slider to change the intensity of the filter
                Group {
                    HStack {
                        Text("Intensity")
                        Slider(value: $filterIntensity)
                            .onChange(of: filterIntensity, applyProcessing)
                        Text(String(format: "%.2f", filterIntensity))
                    }
                    .padding(.vertical)
                    
                    HStack {
                        Text("Radius")
                        Slider(value: $filterRadius)
                            .onChange(of: filterRadius, applyProcessing)
                        Text(String(format: "%.2f", filterRadius))
                    }
                    .padding(.vertical)
                    
                    HStack {
                        Text("Scale")
                        Slider(value: $filterScale)
                            .onChange(of: filterScale, applyProcessing)
                        Text(String(format: "%.2f", filterScale))
                    }
                    .padding(.vertical)
                    
                    HStack {
                        // Display a pop-up sheet to change the filter that is to be used:
                        Button("Change Filter") {
                            changeFilter()
                        }
                        
                        Spacer()
                        
                        Button("Reset Sliders") {
                            filterIntensity = 0.0
                            filterRadius = 0.0
                            filterScale = 0.0
                        }
                    }
                }
                .disabled(!imageShown)
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("InstaFilter")
            .toolbar {
                // Show a share button if an image has been selected:
                if let processedImage {
                    ShareLink(item: processedImage, preview: SharePreview("Instafilter image", image: processedImage))
                }
            }
            .confirmationDialog("Select a filter", isPresented: $showingFilters) {
                Button("Box Blur") { setFilter(CIFilter.boxBlur()) } // Added by me :-)
                Button("Crystallize") { setFilter(CIFilter.crystallize()) }
                Button("Edges") { setFilter(CIFilter.edges()) }
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                Button("Vignette") { setFilter(CIFilter.vignette()) }
                Button("Cancel", role: .cancel) { }
            }
        }
    }
    
    func changeFilter() {
        showingFilters = true
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }

    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }

            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            applyProcessing()
        }
    }
    
    func applyProcessing() {
        // Some filters use different keys to may the intensity to. As a result, the app needs to factor in
        // those potential possibilities:
        
        // First, get the input keys for the currently selected filter:
        let inputKeys = currentFilter.inputKeys
        
        // Next, match the input key and pass the filter value to it:
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterRadius * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterScale * 10, forKey: kCIInputScaleKey) }
        
        // Apply the filter to the image
        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }

        // Pass the filtered image back to processedImage so it can be shown on the screen:
        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
        
        imageShown = true
    }
}

#Preview {
    ContentView()
}
