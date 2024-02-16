//
//  Color+.swift
//  Namo_SwiftUI
//
//  Created by 정현우 on 1/23/24.
//

import SwiftUI

extension Color {
	init(hex: String) {
		let scanner = Scanner(string: hex)
		_ = scanner.scanString("#")
		
		var rgb: UInt64 = 0
		scanner.scanHexInt64(&rgb)
		
		let r = Double((rgb >> 16) & 0xFF) / 255.0
		let g = Double((rgb >>  8) & 0xFF) / 255.0
		let b = Double((rgb >>  0) & 0xFF) / 255.0
		self.init(red: r, green: g, blue: b)
	}
    
    
    // MARK: - Gray Scale
    
    static let white = Color("White")
    static let gray001 = Color("Gray01")
    static let gray002 = Color("Gray02")
    static let gray003 = Color("Gray03")
    static let gray004 = Color("Gray04")
    static let gray005 = Color("Gray05")
    static let gray006 = Color("Gray06")
    static let gray007 = Color("Gray07")
    static let gray008 = Color("Gray08")
    static let gray009 = Color("Gray09")
    static let gray010 = Color("Gray10")
    static let black = Color("Black")
    
    
    // MARK: - Main Color
    
    static let main001 = Color("Main01")
    static let main002 = Color("Main02")
    static let main003 = Color("Main03")
    static let main004 = Color("Main04")
    
    
    // MARK: - System Color
    
    static let alert = Color("Alert")
    static let warning = Color("Warning")
    static let complete = Color("Complete")
    static let active = Color("Active")
}

