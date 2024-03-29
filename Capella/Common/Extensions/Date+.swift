////
////  Date+.swift
////  Namo_SwiftUI
////
////  Created by 정현우 on 1/24/24.
////
//
//import Foundation
//import SwiftUICalendar
//
//extension Date {
//	// 만약 input이 자정이라면, 전날 23:59:59으로 return
//	func adjustDateIfMidNight() -> Date {
//		let calendar = Calendar.current
//		let midnight = calendar.startOfDay(for: self)
//		
//		if self == midnight {
//			return calendar.date(byAdding: .second, value: -1, to: midnight) ?? self
//		} else {
//			return self
//		}
//	}
//	
//	func toHHmm() -> String {
//		let dateFormatter = DateFormatter()
//		dateFormatter.dateFormat = "HH:mm"
//		return dateFormatter.string(from: self)
//	}
//	
//	// date를 YMD로 변환
//	func toYMD() -> YearMonthDay {
//		let calendar = Calendar.current
//		
//		return YearMonthDay(
//			year: calendar.component(.year, from: self),
//			month: calendar.component(.month, from: self),
//			day: calendar.component(.day, from: self)
//		)
//	}
//}
