//
//  HomeDataSourceController.swift
//  Twitter
//
//  Created by Aaron Owusu on 11/10/2017.
//  Copyright © 2017 Aaron Owusu. All rights reserved.
//

import LBTAComponents

class UserHeader: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .blue
    }
}

class UserCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet{
        nameLabel.text = datasourceItem as? String
        }
    }
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Test Test Test"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .yellow

        addSubview(nameLabel)
        nameLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

class HomeDataSource: Datasource {
    let words = ["User 1", "User 2","User 3"]
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return[UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return words.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return words[indexPath.item]
    }
}

class HomeDataSourceController : DatasourceController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeDatasource = HomeDataSource()
        self.datasource = homeDatasource
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
}
