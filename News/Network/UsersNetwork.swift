import UIKit

protocol UsersNetworkDelegate {
    func didAddCell(manager: UsersNetwork, model: ModelOfUsers)
}

struct UsersNetwork {
    
    let urlLabel = "https://jsonplaceholder.typicode.com"
    var delegate = UsersNetworkDelegate?(nil)
    mutating func fetchingUsers() {
        var url = URL(string: "")
        for i in 0...9 {
            url = URL(string: "\(urlLabel)/users")
            let num = i
            startURLSession(url: url!, num: num)
        }
    }
    
    func startURLSession(url: URL, num: Int) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil { return }
            
            if let data = data {
                if let model = self.parseJSON(data: data, num: num) {
                    self.delegate!.didAddCell(manager: self, model: model)
                }
            }
        }
        task.resume()
    }

    func parseJSON(data: Data, num: Int) -> ModelOfUsers? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([UsersData].self, from: data)
            let post = ModelOfUsers(name: decodedData[num].name, username: decodedData[num].username)
            return post
        } catch {
            return nil
        }
    }
}
