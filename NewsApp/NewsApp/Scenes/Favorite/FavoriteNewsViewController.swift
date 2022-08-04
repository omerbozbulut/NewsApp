//
//  FavoriteNewsViewController.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 23.07.2022.
//

import UIKit

final class FavoriteNewsViewController: UIViewController {

    let titleLabel: UILabel = {
        let title = UILabel()
        title.text = NSLocalizedString("Favorite news", comment: "")
        title.font = UIFont(name: Constants.Fonts.TrebuchetMSBold, size: 33)
        return title
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 144
        tableView.separatorColor = .white
        tableView.register(FavoriteTableCell.self, forCellReuseIdentifier: Constants.favoriteTableViewIdentifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configure()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.updateFavoriteList()
        updateData()
    }

    let viewModel: FavoriteViewModel

    init(_ viewModel: FavoriteViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(){
        view.addSubview(tableView)
        view.addSubview(titleLabel)

        configureConstraints()
    }

    func updateData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}
