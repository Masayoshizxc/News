import UIKit
import Foundation

protocol DetailNetworkDelegate{
    func cellAdd(manager: DetailsNetwork,model: DetailsModel)
}

struct DetailsNetwork {
    var d = DetailNetworkDelegate?(nil)
    
    let urlLabel = "https:jsonplaceholder.typicode.com"
    func usersFetching(userId: Int){
        let url = URL(string: "\(urlLabel)/users/\(userId)")
        getUrlSession(url: url!)
    }
    
    func getUrlSession(url: URL) {
        let session = URLSession(configuration: .default)
        let point = session.dataTask(with: url) { (data, response, error) in
            if error != nil { return }
            if let data = data {
                if let model = self.parseJSON(data: data) {
                    self.d!.cellAdd(manager: self, model: model)
                }
            }
        }
        point.resume()
    }

    func parseJSON(data: Data) -> DetailsModel? {
        let decoder = JSONDecoder()
        do {
            let Data = try decoder.decode(DetailsData.self, from: data)
            let post = DetailsModel(username: Data.username, name: Data.name, email: Data.email, website: Data.website,company: Data.company, id: Data.id)
            return post
        } catch {
            return nil
        }
}
}
