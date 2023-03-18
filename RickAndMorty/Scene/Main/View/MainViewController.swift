//
//  ViewController.swift
//  RickAndMorty
//
//  Created by mert polat on 8.03.2023.
//

import UIKit

class MainViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var HorizontalCV: UICollectionView!
    
    @IBOutlet weak var VerticalCV: UICollectionView!
    

    
    var names:[String] = ["dsds","asas","wewe","3232323","sdsdsdsd","sdds","sdsdsd"]

    override func viewDidLoad() {
        super.viewDidLoad()

        HorizontalCV.dataSource = self
        HorizontalCV.delegate = self
        
        VerticalCV.dataSource = self
        VerticalCV.delegate = self

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == HorizontalCV){
            return names.count
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = VerticalCV.dequeueReusableCell(withReuseIdentifier: "VerticalCollectionViewCell", for: indexPath)
        if(collectionView == HorizontalCV){
            let cell2 = HorizontalCV.dequeueReusableCell(withReuseIdentifier: "HorizontalCollectionViewCell", for: indexPath)
            cell2.layer.cornerRadius = 10
            return cell2
        }
        cell.layer.cornerRadius = 15
        return cell
    }



}

