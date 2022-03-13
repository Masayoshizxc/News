import UIKit

class UsersItemCell: UITableViewCell {
    var item : ModelOfUsers? {
        didSet {
            itemName.text = item?.name
            itemUsername.text = item?.username
        }
    }
    
    private let itemName : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.font = .boldSystemFont(ofSize: 20)
        l.textAlignment = .left
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private let itemUsername : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.font = .systemFont(ofSize: 16)
        l.textAlignment = .left
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(itemName)
        addSubview(itemUsername)
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints() {
        itemName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(20)
        }
        itemUsername.snp.makeConstraints { make in
            make.top.equalTo(itemName.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(20)
        }
    }
}
