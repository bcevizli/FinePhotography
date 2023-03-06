//
//  PhotoListViewModel.swift
//  FinePhotography
//
//  Created by Adem Burak Cevizli on 6.03.2023.
//

import Foundation
import UIKit

protocol PhotoListViewModelDelegate: AnyObject {
    func photosLoaded()
}

final class PhotoListViewModel {
    private var photos = [Photo]()
    
    weak var delegate: PhotoListViewModelDelegate?
    
    private let pexelsClient: PexelsClient
    private let imageLoader: ImageLoader
    
    var currentPage = 0
    
    init() {
        pexelsClient = PexelsClient()
        imageLoader = ImageLoader()
        
        loadPhotos()
    }
    
    func getPhoto(at idx: Int) -> Photo {
        return photos[idx]
    }
    
    var count: Int {
        return photos.count
    }
    
    func loadPhotos() {
        currentPage += 1
        let feed = PhotoFeed.curated(currentPage: currentPage, perPage: 20)
        pexelsClient.getPhotos(from: feed) { [weak self] (result) in
            guard let strongSelf = self else {
                return
            }
            switch result {
            case .success(let photoFeedResult):
                guard let photoResult = photoFeedResult else {
                    return
                }
                strongSelf.photos.append(contentsOf: photoResult.photos)
                strongSelf.delegate?.photosLoaded()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    func loadImage(url: URL, _ completion: @escaping (UIImage?) -> Void) -> UUID? {
        let token = imageLoader.loadImage(url) { (result) in
            switch result {
            case .success(let image):
                    completion(image)
            case .failure(let error):
                completion(nil) 
                print(error)
            }
        }
        return token
    }
    func cancel(_ token: UUID?) {
        if let token = token {
            imageLoader.cancel(token)
        }
    }
}
