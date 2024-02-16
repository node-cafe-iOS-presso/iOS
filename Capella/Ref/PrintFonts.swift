//
//  PrintFonts.swift
//  Capella
//
//  Created by YOUJIM on 2/17/24.
//

import SwiftUI


func printAll() {
    for family in UIFont.familyNames.sorted() {
        let names = UIFont.fontNames(forFamilyName: family)
        print("Family: \(family) Font names: \(names)")
    }
}
