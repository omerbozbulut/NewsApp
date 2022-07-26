//
//  ViewController.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 23.07.2022.
//

import UIKit

final class NewsViewController: UIViewController {

    lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        return searchController
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 144
        tableView.separatorColor = .white
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: Constants.newsTableViewIdentifier)
        return tableView
    }()

    private let filterButton: UIButton = {
        let filterButton = UIButton(type: .system)
        filterButton.setImage(UIImage(systemName: Constants.SymbolNames.listBulletCircle), for: .normal)
        filterButton.tintColor = .black
        filterButton.setTitle("", for: .normal)
        filterButton.setTitleColor(.black, for: .normal)
        return filterButton
    }()

    let refreshControl = UIRefreshControl()

    var viewModel: ArticleViewModelProtocol

    var selectedCategoryName: String? = nil

    init(_ viewModel: ArticleViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "News"

        fetchAllData()
        configure()
    }

    private func configure(){
        self.navigationController?.navigationBar.titleTextAttributes =
        [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 27),
         NSAttributedString.Key.foregroundColor: UIColor.red]

        filterButton.addTarget(self, action: #selector(newsFilter), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: filterButton)
        navigationItem.searchController = searchController

        view.addSubview(tableView)
        configureConstraints()
        configureRefresh()
    }

    func updateData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    //MARK: - Refresh Control
    func configureRefresh(){
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }

    @objc func refresh(_ sender: AnyObject) {
        fetchAllData()
        refreshControl.endRefreshing()
    }

    //MARK: - Fetch Data
    func fetchAllData() {
        viewModel.fetchArticles(category: nil, searchText: nil) { [weak self] data in
            guard let data = data?.articles else { return }
            self?.viewModel.articles = data
            self?.updateData()
        } onError: { error in
            print(error)
        }
    }
}
