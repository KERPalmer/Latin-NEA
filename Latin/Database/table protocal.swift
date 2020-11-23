//
//  table protocal.swift
//  Latin
//
//  Created by Kenan Palmer on 22/11/2020.
//

import Foundation

protocol SQLTable {
    static var createStatement: String { get }
    static var insertStatement: String { get }
    static var dropStatement: String { get }
}
