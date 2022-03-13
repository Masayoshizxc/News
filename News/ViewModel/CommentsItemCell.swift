import UIKit

class CommentsItemCell: UITableViewCell {
    var product : CommentsModel? {
        didSet {
            productComment.text = product?.comments
            productImage.image = product?.icon
        }
    }
    private let productImage : UIImageView = {
        let l = UIImageView(image: UIImage(named: "person.fill"))
        l.contentMode = .scaleAspectFit
        l.clipsToBounds = true
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private let productComment : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.font = .boldSystemFont(ofSize: 20)
        l.textAlignment = .left
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(productComment)
        addSubview(productImage)
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints() {
        productImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        productComment.snp.makeConstraints { make in
            make.left.equalTo(productImage.snp.right).offset(10)
            make.top.equalToSuperview().offset(30)
        }
    }
    
    
}
