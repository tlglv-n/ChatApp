//
//  Dynamic.swift
//  ChatApp
//
//  Created by Nurikk T. on 21.07.2023.
//

import Foundation
class Dynamic<T> {
    
    typealias Listener = (T) -> Void
    private var listener: Listener?
    
    func bind(_ listener: @escaping Listener) {
        self.listener = listener
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
