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
    let viewModel = MainViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        HorizontalCV.dataSource = self
        HorizontalCV.delegate = self
        
        VerticalCV.dataSource = self
        VerticalCV.delegate = self
        
        collectionSetup()
        viewModelConfiguration()
        


    }
    
    fileprivate func collectionSetup(){
        HorizontalCV.registerCell(type: HorizontalCollectionViewCell.self)
        VerticalCV.registerCell(type: VerticalCollectionViewCell.self)
    }
    
    fileprivate func viewModelConfiguration(){
        
        viewModel.getLocationItems()
        viewModel.errorCallBack = { [weak self] errorMesage in
            print("error: \(errorMesage)")
        }
        viewModel.successCallBack = { [weak self] in
            self?.HorizontalCV.reloadData()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == HorizontalCV){
            return viewModel.numberOfItems()
        }
        return viewModel.nubmerOfCharacterItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 
        let cell = VerticalCV.dequeueReusableCell(withReuseIdentifier: "VerticalCollectionViewCell", for: indexPath) as! VerticalCollectionViewCell

        if let character = viewModel.character{
            cell.CharacterConfigure(data: character)
        }
        
        if(collectionView == HorizontalCV){
            let cell2 = HorizontalCV.dequeueReusableCell(withReuseIdentifier: "HorizontalCollectionViewCell", for: indexPath) as! HorizontalCollectionViewCell
            if let location = viewModel.main?.results?[indexPath.item]{
              
                cell2.configure(data: location)
            }
            cell2.layer.cornerRadius = 10
            return cell2
        }
        cell.layer.cornerRadius = 15
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard collectionView == HorizontalCV else { return }
        let location = viewModel.main?.results?[indexPath.item]
        let locationURL = location?.url ?? ""

        let characterLink = viewModel.generateCharacterLinks(from: locationURL)
    //   CharacterEndpoint(link: characterLink)
        
        
       // print(characterLink)


    }





}

