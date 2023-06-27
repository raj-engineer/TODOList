//
//  User.swift
//  TODOList
//
//  Created by Rajesh Rajesh on 25/06/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
