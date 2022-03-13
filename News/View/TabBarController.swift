import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        viewControllers = [
            createTabBarItem(tabBarTitle: "Posts",
                             tabBarImage: "newspaper.fill",
                             viewController: PostViewController()),
            
            createTabBarItem(tabBarTitle: "Users",
                             tabBarImage: "person.fill",
                             viewController: UsersViewController()),]}
    
    func createTabBarItem(tabBarTitle: String, tabBarImage: String, viewController: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: viewController)
        
        nav.tabBarItem.title = tabBarTitle
        
        nav.tabBarItem.image = UIImage(systemName: tabBarImage)
        
        return nav
    }

    
}
