//
//  VerticalCollectionViewCell.swift
//  RickAndMorty
//
//  Created by mert polat on 10.03.2023.
//

import UIKit
import SDWebImage


protocol CharacterCellProtocol{
    
    var nameText: String { get }
    var genderText : String { get }
    var posterImage: String { get }
    
}


class VerticalCollectionViewCell: UICollectionViewCell,ReuseProtocol,NibProtocol {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var generLbl: UILabel!
    
    func CharacterConfigure(data : CharacterCellProtocol){
        nameLbl.text = data.nameText
        generLbl.text = data.genderText
        imageView.sd_setImage(with: URL(string: data.posterImage))
        print(data)
    }

    

}
