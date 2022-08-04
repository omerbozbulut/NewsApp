//
//  Favorite+Constraints.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 2.08.2022.
//

import Foundation

extension FavoriteNewsViewController {
    func configureConstraints() {
        makeTitleLabelConstraints()
        makeTableViewConstraints()
    }

    private func makeTitleLabelConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
    }

    private func makeTableViewConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
