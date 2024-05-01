//

import Foundation
import SwiftUI

func navBarSettings() {
    let appearance = UINavigationBarAppearance()
    
    appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
    appearance.backgroundColor = UIColor(Color.green.opacity(0.7))
    appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    
    // Inline appearance (standard height appearance):
    UINavigationBar.appearance().standardAppearance = appearance
    
    // Large Title appearance:
    UINavigationBar.appearance().scrollEdgeAppearance = appearance
}
