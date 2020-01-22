//
//  ViewController.swift
//  tic-tac-toe
//
//  Created by Olga Zubrilina on 30.12.2019.
//  Copyright © 2019 Olga Zubrilina. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var boardCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let defaultGameDimension : Int = 3
    var gameDimension : Int = 0
    var firstPlayer = Player()
    var secondPlayer = Player()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        performInitialSetup()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30)
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        
        boardCollectionView.dataSource = self
        boardCollectionView.delegate = self
        boardCollectionView.collectionViewLayout = flowLayout
    }
    
    private func performInitialSetup() {
        firstPlayer.sign = Signs.tic
        firstPlayer.isHisTurn = true
        titleLabel.text = firstPlayer.sign.rawValue + "'s Turn"
        firstPlayer.playerId = 1
        
        secondPlayer.sign = Signs.tac
        secondPlayer.isHisTurn = false
        secondPlayer.playerId = 2
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return gameDimension == 0 ? defaultGameDimension : gameDimension
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameDimension == 0 ? defaultGameDimension : gameDimension
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = boardCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BoardViewCell.self), for: indexPath) as! BoardViewCell
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.white.cgColor
        cell.textLabel.text = ""
        cell.playerId = 0

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((collectionView.bounds.width - 60 - 40) / CGFloat(defaultGameDimension)), height: (collectionView.bounds.size.height - 40 - 40) / CGFloat(defaultGameDimension))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! BoardViewCell
        if cell.textLabel.text == "" {
            if firstPlayer.isHisTurn {
                cell.textLabel.text = "❌"
                cell.playerId = firstPlayer.playerId
                firstPlayer.positions.append(indexPath)
                firstPlayer.isHisTurn = false
                secondPlayer.isHisTurn = true
            } else {
                cell.textLabel.text = "⭕️"
                cell.playerId = secondPlayer.playerId
                secondPlayer.positions.append(indexPath)
                secondPlayer.isHisTurn = false
                firstPlayer.isHisTurn = true
            }
        }
    }
    
}

