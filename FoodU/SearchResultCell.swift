//
//  SearchResultCell.swift
//  FoodU
//
//  Created by Fredy Camas on 08/15/23.
//

import UIKit

protocol SearchResultCellDelegate: AnyObject {
    func togglHeartBtn(for cell: SearchResultCell)
}

class SearchResultCell: UICollectionViewCell {
    static let id = "ResultEventCell"
    weak var delegate: SearchResultCellDelegate?
    
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
}
