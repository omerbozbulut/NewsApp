//
//  News+TableView.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 24.07.2022.
//

import UIKit

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = viewModel.articles[indexPath.row]
        let destinationVC = NewsDetailViewController(article)
        navigationController?.navigationBar.tintColor = .red
        navigationController?.pushViewController(destinationVC, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.newsTableViewIdentifier, for: indexPath) as? NewsTableViewCell else {return UITableViewCell()}

        let article = viewModel.articles[indexPath.row]
        cell.configureArticle(article)

        cell.favoriteProcesses = {self.viewModel.favoriteProcess(indexPath.row)}
        cell.selectionStyle = .none
        return cell
    }
}
