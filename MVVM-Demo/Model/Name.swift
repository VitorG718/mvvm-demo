//
//  Name.swift
//  MVVM-Demo
//
//  Created by Vitor Gledison Oliveira de Souza on 17/11/21.
//

import Foundation

class NameModel {
    private var names: [String]
    public static var shared = NameModel()
    
    private init() {
        names = [String]()
    }
    
    public func fetch() -> [String] {
        return names
    }
    
    public func save(name: String) -> [String] {
        names.append(name)
        return names
    }
}
