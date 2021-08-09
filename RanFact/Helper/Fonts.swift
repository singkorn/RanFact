//
//  Fonts.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 20/7/2564 BE.
//

import Foundation
import SwiftUI

struct Fonts {

    static func oswaldRegular(size:CGFloat) -> Font{
        return Font.custom("Oswald-Regular", size: size)
    }

    static func oswaldLight(size:CGFloat) -> Font{
        return Font.custom("Oswald-Light", size: size)
    }

    static func oswaldBold(size:CGFloat) -> Font{
        return Font.custom("Oswald-Bold", size: size)
    }

}
