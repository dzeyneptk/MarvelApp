//
//  ViewController.swift
//  MarvelApp
//
//  Created by zeynep tokcan on 15.09.2020.
//  Copyright © 2020 zeynep tokcan. All rights reserved.
//

import UIKit
class MainVC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Parameters
    var charactersVM = CharactersVM()
    private var limit = 30
    private var offset = 0
    var destinationIndex = 0
    
    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        charactersVM.delegate = self
        charactersVM.getCharacterName(limit: limit, offset: offset)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromCellToDetail" {
            let destination = segue.destination as! DetailVC
            destination.character = charactersVM.getCharacter(index: destinationIndex)
        }
    }
    
    // MARK: - Private Functions
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        layout.itemSize = CGSize(width: 120, height: 120)
        collectionView.register(MainCollectionViewCell.nib(), forCellWithReuseIdentifier: AppConstant.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDelegate
extension MainVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        self.destinationIndex = indexPath.row
        self.performSegue(withIdentifier: "fromCellToDetail", sender: nil)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            if indexPath.row == charactersVM.count - 1 {
                updateNextSet()
            }
    }
    func updateNextSet(){
           print("On Completetion")
        self.offset += 30
        charactersVM.getCharacterName(limit: limit, offset: offset)
    }
}
// MARK: - UICollectionViewDataSource
extension MainVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppConstant.identifier, for: indexPath) as! MainCollectionViewCell
        if let url = charactersVM.getImageUrl(index: indexPath.row){
            cell.configure(with: url, name: charactersVM.getCharacterName(index: indexPath.row))
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return charactersVM.count
    }
    
}
// MARK: - UICollectionViewDelegateFlowLayout
extension MainVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let size = self.collectionView.frame.width/2 - 10
        return CGSize(width: size, height: size)
    }
}

// MARK: - PosterImageDelegate
extension MainVC: CharactersDelegate {
    func succes() {
        collectionView.reloadData()
    }
    func failWith(error: String?) {
        print(error ?? "")
    }
}

