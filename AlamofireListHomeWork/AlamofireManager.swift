import Alamofire
import Foundation


class AlamofireManager {
    static let shared = AlamofireManager()
    
    func getAssets(completion: @escaping ([Asset]?) -> Void) {
        let url = "https://api.coincap.io/v2/assets"
        
        AF.request(url).response { response in
            if let data = response.data {
                let decoder = JSONDecoder()
                do {
                    let assetResponse = try decoder.decode(AssetResponse.self, from: data)
                    completion(assetResponse.data)
                } catch {
                    print("Error decoding data:", error)
                    completion(nil)
                }
            } else {
                completion(nil) 
            }
        }
    }
}
