//
//  ItemsViewModel.swift
//  StartMVVM
//
//  Created by DSCO on 7/9/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import Bond
class ItemsViewModel {
    
    var items = DataBinding<[ItemModel]>(value: [])
    var error = DataBinding<Error?>(value: nil)
    
    func numberItems() -> Int {
        return items.value.count
    }
    
    func fetchData() {
        ServiceManager.fetchItems { [weak self] (items, error) in
            guard let self = self else {return}
            if error != nil {
                self.error = error
            } else {
                self.items.value = items
            }
        }
    }
}
