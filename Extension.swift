//
//  Extension.swift
//  reality_escaper
//
//  Created by Abhishek Sansanwal on 07/02/19.
//  Copyright © 2019 Verved. All rights reserved.
//

import Foundation
import SceneKit
import ARKit

var width : CGFloat = 0.02
var height: CGFloat = 1
var length: CGFloat = 1

var doorLength : CGFloat = 0.3

func createBox(isDoor: Bool) -> SCNNode {
    let node = SCNNode()
    
    //First Box
    let firstBox = SCNBox(width: width, height: height, length: isDoor ? doorLength : length, chamferRadius: 0)
    let firstBoxNode = SCNNode(geometry: firstBox)
    firstBoxNode.renderingOrder = 200
    
    node.addChildNode(firstBoxNode)
    
    //Masked Box
    let maskBox = SCNBox(width: width, height: height, length: isDoor ? doorLength : length, chamferRadius: 0)
    maskBox.firstMaterial?.diffuse.contents =  UIColor.white
    maskBox.firstMaterial?.transparency = 0.00001
    
    let maskBoxNode = SCNNode(geometry: maskBox)
    maskBoxNode.renderingOrder = 100
    maskBoxNode.position = SCNVector3.init(width, 0, 0)
    
    
    node.addChildNode(maskBoxNode)
    
    
    return node
}

extension FloatingPoint {
    var degreesToRadians : Self {
        return self * .pi / 180
    }
    var radiansToDegrees : Self {
        return self * 180 / .pi
    }
}
