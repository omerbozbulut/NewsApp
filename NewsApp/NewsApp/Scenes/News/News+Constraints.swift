//
//  News+Constraints.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 24.07.2022.
//

import Foundation

extension NewsViewController {

    func configureConstraints() {
        makeTableViewConstraints()
    }

    private func makeTableViewConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
