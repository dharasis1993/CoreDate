//
//  GenericObserver.swift
//  TableViewDataSourceSeparation
//
//  Created by dharasis behera on 25/01/21.
//

import Foundation
class GenericObserver<T>{
    
    typealias Observer = (T)->()
    var observer: Observer?
    
    var value: T{
        didSet{
            observer?(value)
        }
    }
    
    init(_ data: T) {
        value = data
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
            observer = closure
            closure(value)
    }
    
}
