//
//  News+TableView.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 24.07.2022.
//

import UIKit

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.newsTableViewIdentifier, for: indexPath) as? NewsTableViewCell else {return UITableViewCell()}
        return cell
    }


}
