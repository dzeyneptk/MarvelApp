//
//  DetailVC.swift
//  MarvelApp
//
//  Created by zeynep tokcan on 16.09.2020.
//  Copyright © 2020 zeynep tokcan. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageViewDetail: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var tableViewDetail: UITableView!
    
    // MARK: - Parameters
    var character: CharacterResults? = nil
    var detailsVM: DetailsVM? = nil
    var comicsList: [String] = []
    var yearList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
    }
    // MARK: - Private Functions
    private func configureTableView(){
        self.tableViewDetail.delegate = self
        self.tableViewDetail.dataSource = self
        self.tableViewDetail.backgroundColor = UIColor.clear
        self.tableViewDetail.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    private func configureUI() {
        detailsVM = DetailsVM(character: character!)
        characterName.text = detailsVM?.getCharacterName()
        descLabel.text = detailsVM?.getCharacterDesc()
        if (descLabel.text == "") {descLabel.text = "Character description not found!"}
        imageViewDetail.af.setImage(withURL: URL(string: (detailsVM?.getCharacterImage())!)!)
    }
    private func sortToDate() {
        for comic in self.comicsList {
            let fullComic : [String] = comic.components(separatedBy: "(")
            let firstPart : String = fullComic[1]
            let remain : [String] = firstPart.components(separatedBy: ")")
            let remainPart : String = remain[0]
            

            let decimalCharacters = CharacterSet.decimalDigits

            let decimalRange = remainPart.rangeOfCharacter(from: decimalCharacters)

            if decimalRange != nil {
                if (Int(remainPart)! < 2005) {
                    comicsList.removeLast()
                }
            }
            
        }
       print(comicsList)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension DetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailsVM?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        comicsList.append(detailsVM?.getComics(atIndex: indexPath.row) ?? "")
       // sortToDate()
        cell.textLabel?.text = comicsList[indexPath.row]
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}
