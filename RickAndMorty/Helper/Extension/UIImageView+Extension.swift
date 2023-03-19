//
//  UIImageView+Extension.swift
//  RickAndMorty
//
//  Created by mert polat on 19.03.2023.
//

import Foundation

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    func loadURL(url: String) {
        if let url = URL(string: url) {
            sd_setImage(with: url)
        }
    }
}
