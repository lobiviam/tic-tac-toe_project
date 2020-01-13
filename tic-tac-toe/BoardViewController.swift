//
//  ViewController.swift
//  tic-tac-toe
//
//  Created by Olga Zubrilina on 30.12.2019.
//  Copyright © 2019 Olga Zubrilina. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController {

    @IBOutlet weak var boardCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension BoardViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}

