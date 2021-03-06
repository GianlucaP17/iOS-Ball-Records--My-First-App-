//
//  Texture.swift
//  Ball Records!
//
//  Created by gianluca posca on 29/09/16.
//  Copyright © 2016 Monica Gaiga. All rights reserved.
//

import SpriteKit

public enum GradientDirection {
    case Up
    case Left
    case UpLeft
    case UpRight
}

struct Colors {
    
    static var Primo = CIColor(color: UIColor.cyan)
    static var Secondo = CIColor(color: UIColor.black)

}

public extension SKTexture {
    
    convenience init(size: CGSize, direction: GradientDirection = .Up) {
        
        let context = CIContext(options: nil)
        let filter = CIFilter(name: "CILinearGradient")
        var startVector: CIVector
        var endVector: CIVector
        
        filter!.setDefaults()
        
        switch direction {
        case .Up:
            startVector = CIVector(x: size.width * 0.5, y: 0)
            endVector = CIVector(x: size.width * 0.5, y: size.height)
        case .Left:
            startVector = CIVector(x: size.width, y: size.height * 0.5)
            endVector = CIVector(x: 0, y: size.height * 0.5)
        case .UpLeft:
            startVector = CIVector(x: size.width, y: 0)
            endVector = CIVector(x: 0, y: size.height)
        case .UpRight:
            startVector = CIVector(x: 0, y: 0)
            endVector = CIVector(x: size.width, y: size.height)
        }
        
        
        let color1 = Colors.Primo
        let color2 = Colors.Secondo
        
        filter!.setValue(startVector, forKey: "inputPoint0")
        filter!.setValue(endVector, forKey: "inputPoint1")
        filter!.setValue(color1, forKey: "inputColor0")
        filter!.setValue(color2, forKey: "inputColor1")
        
        
        let image = context.createCGImage(filter!.outputImage!, from: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        self.init(cgImage: image!)
    }
}
