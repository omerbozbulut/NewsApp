//
//  Cell+Constraints.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 24.07.2022.
//

import Foundation
import SnapKit

extension FavoriteTableCell {
    func configureConstraints() {
        makeImageConstraints()
        makeTitleLabelConstraints()
        makeSourceLabelConstraints()
    }

    func makeImageConstraints() {
        image.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.width.equalTo(160)
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
}


