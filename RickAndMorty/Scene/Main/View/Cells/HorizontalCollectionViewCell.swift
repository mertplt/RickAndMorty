//
//  HorizontalCollectionViewCell.swift
//  RickAndMorty
//
//  Created by mert polat on 10.03.2023.
//

import UIKit

protocol LocationCellProtocol{
    var locationText: String{ get }
    
}

class HorizontalCollectionViewCell: UICollectionViewCell,ReuseProtocol,NibProtocol{
    
    @IBOutlet weak var LocationTitleLabel: UILabel!
    
    @IBOutlet weak var LocationLablel: UILabel!
    
    func configure(data: LocationCellProtocol){
       LocationLablel.text = data.locationText
       // LocationLablel.text = "mert"
    }
    
    

}
