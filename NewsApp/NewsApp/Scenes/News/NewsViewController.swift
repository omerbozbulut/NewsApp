//
//  ViewController.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 23.07.2022.
//

import UIKit
import SwiftUI

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

    let emptyView: UIView = {
        let view = UIView()
        return view
    }()

    let dateStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()

    lazy var startingDate: UIDatePicker = {
        let date = UIDatePicker()
        date.datePickerMode = .date
        date.addTarget(self, action: #selector(dateValueChanged(picker:)), for: .valueChanged)
        return date
    }()

    lazy var endDate: UIDatePicker = {
        let date = UIDatePicker()
        date.datePickerMode = .date
        date.addTarget(self, action: #selector(dateValueChanged(picker:)), for: .valueChanged)
        return date
    }()

    let refreshControl = UIRefreshControl()
    let dateFormatter = DateFormatter()
    let viewModel: NewsViewModel

    var selectedCategoryName: String? = nil
    var startingDateString = ""
    var endDateString = ""

    init(_ viewModel: NewsViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = NSLocalizedString("News", comment: "")

        viewModel.outputProtocol = self
        fetchAllData()
        configure()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.articleUpdateFavorite()
        updateData()
    }

    private func configure(){
        self.navigationController?.navigationBar.titleTextAttributes =
        [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 27),
         NSAttributedString.Key.foregroundColor: UIColor.red]

        filterButton.addTarget(self, action: #selector(newsFilter), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: filterButton)
        navigationItem.searchController = searchController

        dateStackView.addArrangedSubview(startingDate)
        dateStackView.addArrangedSubview(emptyView)
        dateStackView.addArrangedSubview(endDate)
        view.addSubview(dateStackView)
        view.addSubview(tableView)
        configureConstraints()
        configureRefresh()
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }

//MARK: - Date picker
    @objc func dateValueChanged(picker: UIDatePicker){
        updateSearchResults(for: searchController)
    }

    func getStartDate() -> String {
        let date = startingDate.date
        let dateString = dateFormatter.string(from: date)
        return dateString
    }

    func getEndDate() -> String {
        let date = endDate.date
        let dateString = dateFormatter.string(from: date)
        return dateString
    }

    //MARK: - Refresh Control
    func configureRefresh() {
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }

    @objc func refresh(_ sender: AnyObject) {
        fetchAllData()
        refreshControl.endRefreshing()
    }

    func updateData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    // top-headlines data
    func fetchAllData() {
        viewModel.fetchArticles(category: nil) { status in
            if status {
                self.viewModel.articleUpdateFavorite()
                self.updateData()
            }
        }
    }

    func convertDateFormat(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        guard let date = dateFormatter.date(from: dateString) else { return "" }
        let resultString = dateFormatter.string(from: date)
        return resultString
    }
}

extension NewsViewController: ArticleOutputProtocol {
    func refresh() {
        updateData()
    }
}
