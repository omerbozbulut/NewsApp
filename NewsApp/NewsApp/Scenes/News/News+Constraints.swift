//
//  News+Constraints.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 24.07.2022.
//

import Foundation

extension NewsViewController {

    func configureConstraints() {
        makedateStackViewConstraints()
        makeTableViewConstraints()
    }

    private func makedateStackViewConstraints() {
        dateStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(-8)
            make.trailing.equalToSuperview().offset(-16)
        }
    }

    private func makeTableViewConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(dateStackView.snp.bottom)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
