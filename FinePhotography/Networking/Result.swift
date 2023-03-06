//
//  Result.swift
//  FinePhotography
//
//  Created by Adem Burak Cevizli on 6.03.2023.
//

import Foundation

enum Result<T, U> where U: Error {
    case success(T)
    case failure(U)
}
