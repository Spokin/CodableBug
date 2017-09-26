//
//  Dog.swift
//  CodableBug
//
//  Created by Kevin McQuown on 9/25/17.
//  Copyright © 2017 Spokin. All rights reserved.
//

import Foundation

class Dog: Animal {
    var bestFriend: String?
    
    private enum CodingKeys: String, CodingKey {
        case bestFriend
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        bestFriend = try container.decode(String.self, forKey: .bestFriend)
        try super.init(from: decoder)
    }
}
