//
//  CharactersDatasource.swift
//  Marvel
//
//  Created by Thiago Lioy on 17/11/16.
//  Copyright © 2016 Thiago Lioy. All rights reserved.
//

import UIKit

final class CharactersDatasource: NSObject, ItemsTableViewDatasource {
    
    typealias Cell = CharacterTableCell

    var items:[Character] = []
    weak var tableView: UITableView?
    weak var delegate: UITableViewDelegate?
    
    required init(items: [Character], tableView: UITableView, delegate: UITableViewDelegate) {
        super.init()

        self.items = items
        self.tableView = tableView
        self.delegate = delegate
        tableView.register(cellType: Cell.self)
        self.setupTableView()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: Cell.self)
        let character = self.items[indexPath.row]
        cell.setup(with: character)
        
        return cell
    }
}

class CharactersTableDelegate: NSObject, UITableViewDelegate {
    
    let delegate: CharactersDelegate
    
    init(_ delegate: CharactersDelegate) {
        self.delegate = delegate
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didSelectCharacter(at: indexPath)
    }
}
