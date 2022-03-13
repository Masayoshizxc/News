import UIKit

class DetailsViewController: UIViewController, DetailNetworkDelegate {
    
    var connection = DetailsNetwork()
    private let viewModel: DetailsViewModelProtocol
    var id = 1
    
    init(vm: DetailsViewModelProtocol = DetailsViewModel()){
        viewModel = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        title = "User details"
        
        connection.d = self
        connection.usersFetching(userId: id)
        
        view.addSubview(viewModel.username)
        view.addSubview(viewModel.name)
        view.addSubview(viewModel.email)
        view.addSubview(viewModel.id)
        view.addSubview(viewModel.website)
        view.addSubview(viewModel.company)
        
        setupConstraints()
    }
    
    func cellAdd(manager: DetailsNetwork, model: DetailsModel) {
        DispatchQueue.main.async {
            self.viewModel.username.text = model.username
            self.viewModel.name.text = model.name
            self.viewModel.email.text = model.email
            self.viewModel.id.text = model.id
            self.viewModel.website.text = model.website
            self.viewModel.company.text = model.company

        }
    }
    
    func setupConstraints() {
        viewModel.username.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.centerX.equalToSuperview()
        }
        
        viewModel.name.snp.makeConstraints { make in
            make.top.equalTo(viewModel.username.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        viewModel.email.snp.makeConstraints { make in
            make.top.equalTo(viewModel.name.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        viewModel.id.snp.makeConstraints { make in
            make.top.equalTo(viewModel.email.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        viewModel.website.snp.makeConstraints { make in
            make.top.equalTo(viewModel.id.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        viewModel.company.snp.makeConstraints { make in
            make.top.equalTo(viewModel.website.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
}
