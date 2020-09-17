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
    var isSortedDate = false
    
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
        imageViewDetail.layer.cornerRadius = 10
        sortComicsByDate()
    }
    private func sortComicsByDate(){
        var filteredItems = [String]()
        
        // Filter by date 2005
        detailsVM?.character?.comics?.items?.forEach{ item in
            if(checkDateIsAfter2005(comic: item.name ?? "")){
                filteredItems.append(item.name!)
            }
        }
        // Sort by date
        filteredItems.sort(by: { getYearFromString(string: $0) > getYearFromString(string: $1)})

        // Take first 10 items
        comicsList = Array(filteredItems.prefix(10))
        updateComics()
    }
    private func checkDateIsAfter2005(comic: String) -> Bool {
        return getYearFromString(string: comic) > 2005
    }
    private func getYearFromString(string: String) -> Int {
        let fullComic : [String] = string.components(separatedBy: "(")
        let firstPart : String = fullComic[1]
        let remain : [String] = firstPart.components(separatedBy: ")")
        let remainPart : String = remain[0]
        return Int(remainPart) ?? 0
    }
    private func updateComics() {
        tableViewDetail.reloadData()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension DetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comicsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = comicsList[indexPath.row]
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.clear
        return cell
    }
}
