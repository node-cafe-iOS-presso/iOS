//
//  Font+.swift
//  Namo_SwiftUI
//
//  Created by 정현우 on 1/20/24.
//

import SwiftUI

extension Font {
	enum Pretendard {
		case thin
		case extraLight
		case light
		case regular
		case medium
		case semibold
		case bold
		case extrabold
		case black
		
		var name: String {
			switch self {
			case .thin:
				return "Pretendard-Thin"
			case .extraLight:
				return "Pretendard-ExtraLight"
			case .light:
				return "Pretendard-Light"
			case .regular:
				return "Pretendard-Regular"
			case .medium:
				return "Pretendard-Medium"
			case .semibold:
				return "Pretendard-SemiBold"
			case .bold:
				return "Pretendard-Bold"
			case .extrabold:
				return "Pretendard-ExtraBold"
			case .black:
				return "Pretendard-Black"
			}
		}
	}
	
	static func pretendard(_ weight: Pretendard, size: CGFloat) -> Font {
		return .custom(weight.name, size: size)
	}
    
    
    // MARK: - Custom Font 선언
    
    static let title1 = Font.pretendard(.bold, size: 30.0)
    static let title2 = Font.pretendard(.bold, size: 28.0)
    static let title3 = Font.pretendard(.bold, size: 20.0)
    static let title4 = Font.pretendard(.medium, size: 20.0)
    static let title5 = Font.pretendard(.bold, size: 18.0)
    
    static let paragraph1 = Font.pretendard(.semibold, size: 16.0)
    static let paragraph2 = Font.pretendard(.medium, size: 16.0)
    static let paragraph3 = Font.pretendard(.regular, size: 16.0)
    static let paragraph4 = Font.pretendard(.semibold, size: 14.0)
    static let paragraph5 = Font.pretendard(.medium, size: 14.0)
    static let paragraph6 = Font.pretendard(.regular, size: 14.0)
    
    static let captionText1 = Font.pretendard(.semibold, size: 12.0)
    static let captionText2 = Font.pretendard(.medium, size: 12.0)
    static let captionText3 = Font.pretendard(.regular, size: 12.0)
    static let captionText4 = Font.pretendard(.regular, size: 10.0)
}
