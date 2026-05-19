//
//  Service.swift
//  ServiciosSV
//
//  Created by Sara Ascencio on 5/5/26.
//
import Foundation

struct Service: Identifiable, Equatable {
    let id: UUID
    let title: String
    let description: String
    let longDescription: String
    let basePriceUSD: Double
    let iconName: String
    let estimatedTime: String
}

enum SupportedLocale: String, CaseIterable, Identifiable {
    case elSalvador = "es"
    case unitedStates = "en"
    case france = "fr"
    case southKorea = "ko"
    
    var id: String { rawValue }
    
    var flag: String {
        switch self {
        case .elSalvador: return "🇸🇻"
        case .unitedStates: return "🇺🇸"
        case .france: return "🇫🇷"
        case .southKorea: return "🇰🇷"
        }
    }
    
    var currencyCode: String {
        switch self {
        case .elSalvador, .unitedStates: return "USD"
        case .france: return "EUR"
        case .southKorea: return "KRW"
        }
    }
    
    var currencySymbol: String {
        switch self {
        case .elSalvador, .unitedStates: return "$"
        case .france: return "€"
        case .southKorea: return "₩"
        }
    }
    
    var displayName: String {
        switch self {
        case .elSalvador: return "El Salvador"
        case .unitedStates: return "United States"
        case .france: return "France"
        case .southKorea: return "대한민국"
        }
    }
}
