//
//  Double+Currency.swift
//  ServiciosSV
//
//  Created by Sara Ascencio on 5/5/26.
//
import Foundation

extension Double {
    func toCurrency(locale: SupportedLocale) -> String {
        let rate: Double = {
            switch locale {
            case .elSalvador, .unitedStates: return 1.0
            case .france: return 0.92       // USD a EUR aproximado
            case .southKorea: return 1480   // USD a KRW aproximado
            }
        }()
        
        let convertedAmount = self * rate
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = locale.currencyCode
        

        let localeID = Locale.identifier(fromComponents: [
            NSLocale.Key.languageCode.rawValue: locale.rawValue
        ])
        formatter.locale = Locale(identifier: localeID)
        
       
        if let formatted = formatter.string(from: NSNumber(value: convertedAmount)) {
            return formatted
        }
        
        let roundedAmount = Int(convertedAmount.rounded())
        return "\(locale.currencySymbol)\(roundedAmount)"
    }
}
