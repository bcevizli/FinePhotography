//
//  PhotoListView.swift
//  FinePhotography
//
//  Created by Adem Burak Cevizli on 6.03.2023.
//

import UIKit

protocol PhotoListItemDelegate: AnyObject {
    func selectedPhoto(photo: Photo)
}

class PhotoListView: UIView {
    weak var delegate: PhotoListItemDelegate?
    
    lazy var vm: PhotoListViewModel = {
        let vm = PhotoListViewModel()
        vm.delegate = self
        return vm
    }()
    
    lazy var tableView: UITableView = {
        let v = UITableView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.delegate = self
        v.dataSource = self
        v.register(UITableViewCell.self, forCellReuseIdentifier: "cell ")
        return v
    }()
}

extension PhotoListView: PhotoListViewModelDelegate {
    func photosLoaded() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}

extension PhotoListView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

extension PhotoListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.count
    }
    
    
}
