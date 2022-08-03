//
//  Detail+Constraints.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 25.07.2022.
//

import Foundation
import SnapKit

extension NewsDetailViewController {
    func configureConstraints() {
        makeImageConstraints()
        makeTitleLabelConstraints()
        makeSourceLabelConstraints()
        makeDateLabelConstraints()
        makeContentLabelConstraints()
        makeAuthorLabelConstraints()
    }

    private func makeImageConstraints() {
        image.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(240)
        }
    }

    private func makeSourceLabelConstraints() {
        sourceLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
        }
    }

    private func makeDateLabelConstraints(){
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(16)
            make.leading.equalTo(sourceLabel.snp.trailing)
            make.trailing.equalToSuperview().offset(-16)
        }
    }

    private func makeTitleLabelConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(sourceLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }

    private func makeContentLabelConstraints() {
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }

    private func makeAuthorLabelConstraints() {
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(16)
        }
    }
}
