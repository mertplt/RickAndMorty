//
//  SplashViewController.swift
//  RickAndMorty
//
//  Created by mert polat on 10.03.2023.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
            
            self.performSegue(withIdentifier: "toMain", sender: nil)
        }

    }
    
}
