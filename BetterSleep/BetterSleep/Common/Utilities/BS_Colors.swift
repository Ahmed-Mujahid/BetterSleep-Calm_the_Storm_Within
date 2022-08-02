//
//  BS_Colors.swift
//  BetterSleep
//
//  Created by developer on 02/08/2022.
//

import Foundation
import UIKit

struct Color {
    static let BS_Blue = UIColor(named: "BS_Blue")!
    static let BS_DarkBlue =  UIColor(named: "BS_Dark_Blue")!
    static let BS_Purple = UIColor(named: "BS_Purple")!
    static let BS_GradientBlue = UIColor(named: "GradientBlue")!
    static let BS_GradientGreen = UIColor(named: "GradientGreen")!
    static let BS_GradientPurpleDark = UIColor(named: "GradientPurpleDark")!
    static let BS_GradientPurpleLight = UIColor(named: "GradientPurpleLight")!
    static var frame: CGRect?
    static let BS_Gradient1: CAGradientLayer = {
        var gl = CAGradientLayer()
        guard let frame = frame else { fatalError("Set Color.frame") }
        gl.frame = frame
        gl.colors = [BS_GradientPurpleLight.cgColor, BS_GradientGreen.cgColor]
        gl.locations = [0.0, 1.0]
        return gl
     
    }()
    
    static let BS_Gradient2: CAGradientLayer = {
        var gl = CAGradientLayer()
        guard let frame = frame else { fatalError("Set Color.frame") }
        gl.frame = frame
        gl.colors = [BS_GradientBlue.cgColor, BS_GradientPurpleDark.cgColor]
        gl.locations = [0.0, 1.0]
        return gl
     
    }()
}
