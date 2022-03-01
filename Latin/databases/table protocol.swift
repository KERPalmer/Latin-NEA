//
//  table protocol.swift
//  Profile sql
//
//  Created by Kenan Palmer on 24/10/2020.
//

import Foundation

protocol SQLTable {
    static var createStatement: String { get }
    static var insertStatement: String { get }
    static var dropStatement: String { get }
}
