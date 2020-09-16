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
    var  character: CharacterResults? = nil
    var  detailsVM: DetailsVM? = nil
    
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
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension DetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailsVM?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = detailsVM?.getComics(atIndex: indexPath.row)
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}
