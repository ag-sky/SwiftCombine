//
//  CombineRepository.swift
//  CombineSwiftExample
//
//  Created by Akash Gupta on 24/10/24.
//

import Foundation
import Combine

class CombineRepository{
    
    private var itemsPublisher = CurrentValueSubject<[String], Never>([])
    
    func fetchItems() -> AnyPublisher<[String], Never> {
        let newItems = ["Akash","Ravi","Rakesh"]
        itemsPublisher.send(newItems)
        return itemsPublisher.eraseToAnyPublisher()
    }
    
    func addItems(_ item: String){
        var currentItems = itemsPublisher.value
        currentItems.append(item)
        itemsPublisher.send(currentItems)
    }
}
