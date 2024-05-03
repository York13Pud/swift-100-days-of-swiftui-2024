#  SwiftUI, CoreImage And UIKit Image Handling

## SwiftUI - Image

In SwiftUI, the `Image` view is used to show an image. It does not offer any options to modify the image directly.

Modifiers such as `.resizable()` and `.scaledToFit()` only perform sizing on the screen. They do not change the actual image file.

There are three options for working with images as data, rather than read-only. These are:

- UIImage - UIKit
- CGImage - Core Graphics - a 2D array of pixels
- GIImage - Core Image - An image recipe - The oldest of the frameworks

