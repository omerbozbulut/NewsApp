//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 24.07.2022.
//

import UIKit
import Kingfisher

final class FavoriteTableCell: UITableViewCell {

    let image: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 8
        return image
    }()

    let titleLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 3
        title.font = UIFont(name: Constants.Fonts.TrebuchetMSBold, size: 22)
        return title
    }()

    let sourceLabel: UILabel = {
        let title = UILabel()
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 0
        title.font = UIFont(name: Constants.Fonts.helvetica, size: 15)
        return title
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(sourceLabel)
        contentView.addSubview(image)

        configureConstraints()
    }

    func configureArticle(_ article: Article) {
        titleLabel.text = article.title
        if let imageUrl = article.urlToImage {
            image.kf.setImage(with: URL(string: imageUrl))
        } else {
            image.kf.setImage(with: URL(string: Constants.nullImageUrl))
        }
        sourceLabel.text = article.source?.name
    }
}
