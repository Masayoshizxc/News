import UIKit


class PostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NetworkDelegate {
    var items : [ModelOfPosts] = [ModelOfPosts]()
    
    var table = UITableView()
    var network = PostsNetworking()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "All posts"
        table.register(ItemPostsCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        network.delegate = self
        network.fetchPost()
        
        view.addSubview(table)
    }
    
    override func viewDidLayoutSubviews() {
        table.frame = view.frame
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemPostsCell
        let endItem = items[indexPath.row]
        cell.item = endItem
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 360
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let destination = CommentsView()
        destination.id = indexPath[1] + 1
        navigationController?.pushViewController(destination, animated: true)
    }
    
    func didAddCell(manager: PostsNetworking, model: ModelOfPosts) {
        DispatchQueue.main.async {
            self.items.append(ModelOfPosts(image: UIImage(systemName: "rectangle.fill")!, title: model.title, subTitle: model.subTitle ))
            self.table.reloadData()
        }
    }
}
