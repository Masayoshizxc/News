import UIKit

protocol NetworkDelegate {
    func didAddCell(manager: PostsNetworking, model: ModelOfPosts)
}

struct PostsNetworking {
    
    var delegate = NetworkDelegate?(nil)
    
    let urlString = "https://jsonplaceholder.typicode.com"
    
    func fetchPost() {
        for i in 1...10 {
            let url = URL(string: "\(urlString)/posts/\(i)")
            startURLSession(url: url!)
        }
    }
    
    func startURLSession(url: URL) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil { return }

            if let data = data {
                if let model = self.parseJSON(data: data) {
                    self.delegate!.didAddCell(manager: self, model: model)
                }
            }
        }
        task.resume()
    }

    func parseJSON(data: Data) -> ModelOfPosts? {
        let decoder = JSONDecoder()
        do {
            let Data = try decoder.decode(NetworkData.self, from: data)
            let post = ModelOfPosts( image: UIImage(systemName: "rectangle.fill")!, title: Data.title, subTitle: Data.body)
            return post
        } catch {
            return nil
        }
    }
}
