import UIKit

class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UsersNetworkDelegate {
    
    var tableView = UITableView()
    var products : [ModelOfUsers] = [ModelOfUsers]()
    var network = UsersNetwork()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Users"
        tableView.register(UsersItemCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        network.delegate = self
        network.fetchingUsers()
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.frame
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UsersItemCell
        let endItem = products[indexPath.row]
        cell.item = endItem
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let destination = DetailsViewController()
        destination.id = indexPath[1] + 1
        navigationController?.pushViewController(destination, animated: true)
    }
    
    func didAddCell(manager: UsersNetwork, model: ModelOfUsers) {
        DispatchQueue.main.async {
            self.products.append(ModelOfUsers(name: model.name, username: model.username))
            self.tableView.reloadData()
        }
    }
}
