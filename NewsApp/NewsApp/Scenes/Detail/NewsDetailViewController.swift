//
//  NewsDetailViewController.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 23.07.2022.
//

import UIKit

final class NewsDetailViewController: UIViewController {

    let image: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()

    let titleLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.font = UIFont(name: Constants.Fonts.TrebuchetMSBold, size: 22)
        return title
    }()

    let sourceLabel: UILabel = {
        let title = UILabel()
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 0
        title.layer.opacity = 0.7
        title.font = UIFont(name: Constants.Fonts.helvetica, size: 15)
        return title
    }()

    let dateLabel: UILabel = {
        let title = UILabel()
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 0
        title.layer.opacity = 0.7
        title.font = UIFont(name: Constants.Fonts.helvetica, size: 15)
        return title
    }()

    let contentLabel: UILabel = {
        let title = UILabel()
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 0
        title.font = UIFont(name: Constants.Fonts.helvetica, size: 17)
        return title
    }()

    let authorLabel: UILabel = {
        let title = UILabel()
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 0
        title.font = UIFont(name: Constants.Fonts.helvetica, size: 15)
        return title
    }()

    private var article: Article

    init(_ article: Article) {
        self.article = article
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        view.backgroundColor = .white
    }

    func configure() {
        view.addSubview(image)
        view.addSubview(titleLabel)
        view.addSubview(sourceLabel)
        view.addSubview(dateLabel)
        view.addSubview(contentLabel)
        view.addSubview(authorLabel)

        configureConstraints()
        configureArticle()
    }

//MARK: - Configure Article
    func configureArticle() {
        dateLabel.text = calculateElapsedTime(publishedDate: article.publishedAt)
        titleLabel.text = article.title
        if let imageUrl = article.urlToImage {
            image.kf.setImage(with: URL(string: imageUrl))
        } else {
            image.kf.setImage(with: URL(string: Constants.nullImageUrl))
        }
        sourceLabel.text = article.source?.name
        contentLabel.text = article.content
        authorLabel.text = "Author: \(article.author ?? "anonim")"
    }

//MARK: - Elapsed time calculate
    func calculateElapsedTime(publishedDate: String?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.dateFormat
        let date = dateFormatter.date(from: publishedDate ?? "2022-07-25T17:11:11Z")
        guard let elapsedTime = date?.timeIntervalSinceNow else {return ""}
        return elapsedTime.stringFromTimeInterval()
    }
}
