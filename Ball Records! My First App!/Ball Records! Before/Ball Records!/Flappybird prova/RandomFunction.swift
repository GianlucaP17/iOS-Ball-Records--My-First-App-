//
//  RandomFunction.swift
//  Ball Records!
//
//  Created by Monica Gaiga on 04/01/16.
//  Copyright (c) 2016 Monica Gaiga. All rights reserved.
//

import Foundation
import CoreGraphics

public extension CGFloat{
    
    public static func random() -> CGFloat{
        
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    public static func random(min min : CGFloat, max : CGFloat) -> CGFloat{
        
        return CGFloat.random() * (max - min) + min
    }
    
}