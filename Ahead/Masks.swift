//
//  Masks.swift
//  Ahead
//
//  Created by Adel Salikhov on 05/05/2019.
//  Copyright © 2019 Adel Salikhov. All rights reserved.
//

import Foundation
import SpriteKit

struct CollisionBitMask {
    static let mainFloor  : UInt32 = 0x1 << 1
    static let ground: UInt32 = 0x1 << 2
    static let player : UInt32 = 0x1 << 3
}
