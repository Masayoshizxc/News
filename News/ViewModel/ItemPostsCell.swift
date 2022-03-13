import UIKit
import SnapKit

class ItemPostsCell: UITableViewCell {

    var item : ModelOfPosts? {
        didSet{
            itemTitle.text = item?.title
            itemImage.image = item?.image
            itemDescrip.text = item?.subTitle
        }
    }
    override init(style: UITableViewCell.CellStyle,reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        toAddSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func toAddSubView(){
        addSubview(itemImage)
        addSubview(itemDescrip)
        addSubview(itemTitle)
    }
    private let itemImage : UIImageView = {
        let l = UIImageView()
        l.image = UIImage(systemName: "plus.circle.fill")
        l.tintColor = .blue
        
        l.contentMode = .scaleAspectFit
        l.translatesAutoresizingMaskIntoConstraints = false
        l.clipsToBounds = true
        return l
    }()
    
    private let itemDescrip : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.font = .systemFont(ofSize: 22)
        return l
    }()
    
    private let itemTitle : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.font = .systemFont(ofSize: 14)
        l.textAlignment = .left
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    func setupConstraints(){
        itemImage.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(8)
            make.width.height.equalTo(220)
            
        }
        itemDescrip.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalTo(itemTitle.snp.bottom).offset(8)
            
        }
        itemTitle.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalTo(itemImage.snp.bottom).offset(8)
            
        }
        
    }
}
