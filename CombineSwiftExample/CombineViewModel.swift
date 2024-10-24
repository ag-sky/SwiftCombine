//
//  CombineViewModel.swift
//  CombineSwiftExample
//
//  Created by Deeksha Verma on 24/10/24.
//

import Foundation
import Combine

class CombineViewModel: ObservableObject {
    private var combineRepo = CombineRepository()
    @Published var items:[String] = []
    private var cancellables = Set<AnyCancellable>()
    init(){
        fetchItems()
    }
    
    func fetchItems(){
        combineRepo.fetchItems()
            .receive(on: DispatchQueue.main)
            .sink{
                [weak self] fetcheditems in
                self?.items = fetcheditems
            
            }
            .store(in: &cancellables)
    }
    
    func addItem(_ item: String) {
           combineRepo.addItems(item)
       }
}
