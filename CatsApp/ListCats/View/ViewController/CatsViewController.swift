//
//  CatsViewController.swift
//  CatsApp
//
//  Created by Felipe Aragon on 21/05/23.
//

import UIKit
import RxSwift
import RxCocoa

protocol CatsViewControllerOutputProtocol {
    func getCats() -> Observable<[Cat]>
}

final class CatsViewController: UIViewController, CatsPresenterOutputProtocol {
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            let nibName = String(describing: CatCell.self)
            let nib = UINib(nibName: nibName, bundle: .main)
            tableView.register(nib, forCellReuseIdentifier: nibName)
            tableView.rowHeight = 359.0
        }
    }
    @IBOutlet private weak var emptyResultView: UIView! {
        didSet {
            emptyResultView.isHidden = true
        }
    }
    @IBOutlet private weak var emptyImage: UIImageView! {
        didSet {
            emptyImage.image = CatsTestStyle.icon.badImage
        }
    }
    @IBOutlet private weak var emptyLabel: UILabel! {
        didSet {
            emptyLabel.font = CatsTestStyle.font.avenirNormalSmallThree
            emptyLabel.textColor = CatsTestStyle.color.accentColor
        }
    }
    
    private var outPut: CatsViewControllerOutputProtocol?
    private var router: CatsRouterProtocol?
    private let viewModel = CatsModel()
    private let disposeBag = DisposeBag()
    
    init() {
        super.init(nibName: String(describing: CatsViewController.self), bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Catbreeds"
        bindViews()
    }
    
    func bindViews() {
        
        outPut?.getCats()
            .bind(to: viewModel.catsSubject)
            .disposed(by: disposeBag)
        
        viewModel.catsSubject
            .observe(on: MainScheduler.instance)
            .do(onNext: { [weak self] locations in
                self?.emptyResultView.isHidden = !locations.isEmpty
            })
            .bind(to: tableView.rx
                .items(cellIdentifier: String(describing: CatCell.self),
                       cellType: CatCell.self)) { (row, element, cell) in
                cell.setup(name: element.breedName,
                           origin: element.origin,
                           intelligen: element.intelligence,
                           imageUrl: element.imageUrl ?? "")
            }.disposed(by: disposeBag)
        
        tableView.rx
            .modelSelected(Cat.self)
            .subscribe(onNext: { [weak self] cat in
                guard let self = self else { return }
                self.router?.goToDetail(cat: cat)
            }).disposed(by: disposeBag)

    }
    
    func setViewOutput(outPut: CatsViewControllerOutputProtocol,
                            router: CatsRouterProtocol) {
        self.outPut = outPut
        self.router = router
    }
}
