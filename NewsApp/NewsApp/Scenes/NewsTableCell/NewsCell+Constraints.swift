//
//  Cell+Constraints.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 24.07.2022.
//

import Foundation
import SnapKit

extension NewsTableViewCell {
    func configureConstraints() {
        makeImageConstraints()
        makeTitleLabelConstraints()
        makeSourceLabelConstraints()
        makeFavoriteButtonConstraints()
    }

    func makeImageConstraints() {
        image.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.width.equalTo(156)
        }
    }

    func makeTitleLabelConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.top)
            make.leading.equalTo(image.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-8)
        }
    }

    func makeSourceLabelConstraints() {
        sourceLabel.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }

    func makeFavoriteButtonConstraints() {
        favoriteButton.snp.makeConstraints { make in
            make.centerY.equalTo(sourceLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(-16)
            make.height.width.equalTo(32)
        }
    }
}


