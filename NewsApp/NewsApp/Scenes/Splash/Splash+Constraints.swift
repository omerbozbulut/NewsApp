//
//  Splash+Constraints.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 25.07.2022.
//

import Foundation

extension SplashViewController {

//MARK: - Constraints
    func configureConstraints(){
        makeCustomViewConstraints()
        makeTitleLabelConstraints()
    }

    private func makeCustomViewConstraints() {
        customView.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
    }

    private func makeTitleLabelConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(customView.snp.centerX)
            make.centerY.equalTo(customView.snp.centerY)
        }
    }
}
