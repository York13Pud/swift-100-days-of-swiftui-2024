//
import PhotosUI
import SwiftUI

struct PhotoImport: View {
    // Create a reference to a selected item:
    @State private var pickerItem: PhotosPickerItem?
    
    // The actual image:
    @State private var selectedImage: Image?
    
    var body: some View {
        VStack {
            selectedImage?
                .resizable()
                .scaledToFit()
            
            PhotosPicker("Select a picture", selection: $pickerItem, matching: .images)
        }
        .onChange(of: pickerItem) {
            Task {
                selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
            }
        }
    }
}

struct MultiplePhotoImport: View {
    // Create a reference to all the selected selected items.
    // As this is an array, the PhotoPicker will allow for multiple items to be selected:
    @State private var pickerItems = [PhotosPickerItem]()
    
    // The actual image:
    @State private var selectedImages = [Image]()
    
    var body: some View {
        VStack {
            // Allow upto three images to be selected:
            PhotosPicker(selection: $pickerItems, maxSelectionCount: 3, matching: .any(of: [.images, .not(.screenshots)])) {
                Label("Select a picture", systemImage: "photo")
            }

            // Display the images on the screen:
            ScrollView {
                ForEach(0..<selectedImages.count, id: \.self) { i in
                    selectedImages[i]
                        .resizable()
                        .scaledToFit()
                }
            }
            
        }
        .onChange(of: pickerItems) {
            Task {
                // Empty the selectedImages array:
                selectedImages.removeAll()

                // Add the images to the selectedImages array so that they can be shown in the ScrollView:
                for item in pickerItems {
                    if let loadedImage = try await item.loadTransferable(type: Image.self) {
                        selectedImages.append(loadedImage)
                    }
                }
            }
        }
        
    }
        
}


#Preview {
    MultiplePhotoImport()
}
