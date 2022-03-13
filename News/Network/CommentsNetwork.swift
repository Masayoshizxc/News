import UIKit

protocol CommentsNetwork {
    func cellAdd(manager: CommentsNetworking, model: CommentsModel)
}

struct CommentsNetworking {
    
    var delegate = CommentsNetwork?(nil)
    
    let urlString = "https://jsonplaceholder.typicode.com"
    
    func fetchComments(commentId: Int) {
        let url = URL(string: "\(urlString)/posts/\(commentId)/comments")
        for i in 0...4 {
            startURLSession(url: url!, number: i)
        }
    }
    
    func startURLSession(url: URL, number: Int) {
        let ses = URLSession(configuration: .default)
        let point = ses.dataTask(with: url) { (data, response, error) in
            if error != nil { return }
            if let data = data {
                if let model = self.parseJSON(data: data, number: number) {
                    self.delegate!.cellAdd(manager: self, model: model)
                }
            }
        }
        point.resume()
    }

    func parseJSON(data: Data, number: Int) -> CommentsModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([CommentsData].self, from: data)
            let post = CommentsModel(comments: decodedData[number].body, icon: UIImage(systemName: "person.crop.circle")!)
            return post
        } catch {
            return nil
        }
    }
}
