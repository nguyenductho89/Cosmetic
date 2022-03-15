//
//  ListIngredientsVM.swift
//  Cosmetic
//
//  Created by Nguyễn Đức Thọ on 8/27/21.
//

import Foundation

protocol ListIngredientsVMProtocol {
    func object(at index: IndexPath) -> CosmeticIngredients
    func numberOfSection() -> Int
    func numberOfRowInSection(_ section: Int) -> Int
    func getListIngredients() -> [CosmeticIngredients]
}

class ListIngredientsVMImpl: ListIngredientsVMProtocol {
    
    var repo: ListIngredientsRepoProtocol!
    
    func getListIngredients() -> [CosmeticIngredients] {
        return []
    }
    
    func numberOfSection() -> Int {
        return 10
    }
    
    func numberOfRowInSection(_ section: Int) -> Int {
        return 10
    }
    
    func object(at index: IndexPath) -> CosmeticIngredients {
        return CosmeticIngredients.init()
    }    
}
