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

    let refreshControl = UIRefreshControl()

    var viewModel: ArticleViewModelProtocol

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

        configure()
    }

    private func configure(){
        self.navigationController?.navigationBar.titleTextAttributes =
        [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 27),
         NSAttributedString.Key.foregroundColor: UIColor.red]

        fetchData()
        navigationItem.searchController = searchController
        view.addSubview(tableView)
        configureConstraints()

        // Refresh Control
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }

    @objc func refresh(_ sender: AnyObject) {
        fetchData()
        refreshControl.endRefreshing()

    }

    private func updateData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

//MARK: - Fetch Data
    private func fetchData() {
        viewModel.fetchArticles { [weak self] data in
            guard let data = data?.articles else { return }
            self?.viewModel.articles = data
            self?.updateData()
        } onError: { error in
            print(error)
        }
    }
}

//MARK: - Search News
extension NewsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchController.searchBar.searchTextField.textColor = .black

        guard let text = searchController.searchBar.text else {return}
        print(text)
    }
}
