//
//  News+Filter+Search.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 26.07.2022.
//

import UIKit

//MARK: - News filter
extension NewsViewController {
    @objc func newsFilter() {

        let alert = UIAlertController(title: "Filter", message: nil, preferredStyle: .actionSheet)

        let All = UIAlertAction(title: "All", style: .default, handler: {(_) in
            self.fetchAllData()
            self.selectedCategoryName = nil
            self.updateData()
        })
        alert.addAction(All)

        for categoryName in Constants.ServiceEndPointConverter.categoryNames {
            let Button = UIAlertAction(title: categoryName.0, style: .default, handler: {(_) in
                self.viewModel.fetchArticles(category: categoryName.1)
                self.selectedCategoryName = categoryName.1
                self.viewModel.articleUpdateFavorite()
            })
            alert.addAction(Button)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alert.addAction(cancel)
        self.present(alert, animated: true)
    }
    
    func dataErrorAlert(_ error: Error) {
        let notFoundDataAlert = UIAlertController(title: "Error!", message: error.localizedDescription, preferredStyle: .alert)
        let Cancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        notFoundDataAlert.addAction(Cancel)
        present(notFoundDataAlert, animated: true)
    }
}


//MARK: - Search News
extension NewsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchController.searchBar.searchTextField.textColor = .black
        viewModel.searchRequest(text: searchController.searchBar.text, startingDate: getStartDate(), endDate: getEndDate())
    }
}
