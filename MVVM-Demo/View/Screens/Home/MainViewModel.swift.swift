//
//  MainViewModel.swift.swift
//  MVVM-Demo
//
//  Created by Vitor Gledison Oliveira de Souza on 17/11/21.
//

import Foundation

final class MainViewModel: NSObject {
    private var names = [String]()
    public var numberOfNames: Int { names.count }
    weak var delegate: MainViewDelegate?
    
    init(delegate: MainViewDelegate) {
        super.init()
        names = NameModel.shared.fetch()
        self.delegate = nil
        self.delegate?.mainViewController(updateLabelWith: numberOfNames)
    }
    
    public func addName(_ name: String) {
        let newName = name.trimmingCharacters(in: .whitespaces)
        if !newName.isEmpty {
            names = NameModel.shared.save(name: newName)
            delegate?.mainViewController(updateLabelWith: numberOfNames)
        }
    }
}

protocol MainViewDelegate: AnyObject {
    func mainViewController(updateLabelWith quantity: Int)
}
