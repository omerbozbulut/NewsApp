//
//  Favorite+TableView.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 2.08.2022.
//

import UIKit

extension FavoriteNewsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = viewModel.favoriteNews[indexPath.row]
        guard let url = URL(string: article.url ?? "") else {return}
        UIApplication.shared.open(url)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.favoriteNews.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.favoriteTableViewIdentifier, for: indexPath) as? FavoriteTableCell else {return UITableViewCell()}
        let article = viewModel.favoriteNews[indexPath.row]
        cell.configureArticle(article)
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.removeFavorite(indexPath.row)
            viewModel.updateFavoriteList()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            updateData()
        }
    }
}
