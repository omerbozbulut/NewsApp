//
//  ViewController.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 23.07.2022.
//

import UIKit

class NewsViewController: UIViewController {

    lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        return searchController
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: Constants.newsTableViewIdentifier)
        tableView.separatorColor = .black
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "News"

        configure()
    }

    func configure(){
        self.navigationController?.navigationBar.titleTextAttributes =
        [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 27),
         NSAttributedString.Key.foregroundColor: UIColor.red]

        navigationItem.searchController = searchController
        view.addSubview(tableView)
        configureConstraints()
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
