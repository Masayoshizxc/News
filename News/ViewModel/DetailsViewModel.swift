import UIKit

protocol DetailsViewModelProtocol {
    var product: DetailsModel? { get set }
    var username: UILabel { get set }
    var name: UILabel { get set }
    var email: UILabel { get set }
    var id: UILabel { get set }
    var website: UILabel { get set }
    var company: UILabel { get set }
}

class DetailsViewModel: DetailsViewModelProtocol {
    
    var product : DetailsModel? {
        didSet {
            username.text = product?.username
            name.text = product?.name
            email.text = product?.email
            id.text = product?.id
            website.text = product?.website
            company.text = product?.company
        }
    }
    
    var username : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    var name : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.textAlignment = .left
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    var email : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.textAlignment = .left
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    var id : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.textAlignment = .left
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    
    var website : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.textAlignment = .left
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    
    var company : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.textAlignment = .left
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    
}
