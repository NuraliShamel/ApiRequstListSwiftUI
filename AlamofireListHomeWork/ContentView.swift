import SwiftUI

struct AssetDetailView: View {
    let asset: Asset
    
    var body: some View {
        VStack {
            Text("ID: \(asset.id)")
            Text("Symbol: \(asset.symbol)")
            Text("Price (USD): \(asset.priceUsd)")
        }
        .navigationTitle(asset.symbol)
    }
}

struct ContentView: View {
    @StateObject var viewModel = AssetViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.assets) { asset in
                NavigationLink(destination: AssetDetailView(asset: asset)) {
                    Text("\(asset.symbol): $\(asset.priceUsd)")
                }
            }
        }
        .onAppear {
            viewModel.fetchAssets()
        }
    }
}

#Preview {
    ContentView()
}
