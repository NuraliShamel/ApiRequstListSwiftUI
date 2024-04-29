import SwiftUI
import Foundation

class AssetViewModel: ObservableObject {
    private let manager = AlamofireManager.shared
    
    @Published var assets: [Asset] = []
    
    func viewDidAppear() {
        fetchAssets()
    }
    
    func fetchAssets() {
        manager.getAssets { assets in
            guard let assets = assets else { return }
            self.assets = assets 
        }
    }
}
