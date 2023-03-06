//
//  HomeViewController.swift
//  FinePhotography
//
//  Created by Adem Burak Cevizli on 6.03.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var photoList: PhotoListView = {
        let v = PhotoListView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.delegate = self
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    func setupView() {
        view.addSubview(photoList)
        setupConstraints()
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            photoList.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoList.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photoList.topAnchor.constraint(equalTo: view.topAnchor),
            photoList.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension HomeViewController: PhotoListItemDelegate {
    func selectedPhoto(photo: Photo) {
        // launch detail vc here
    }
    
    
}

