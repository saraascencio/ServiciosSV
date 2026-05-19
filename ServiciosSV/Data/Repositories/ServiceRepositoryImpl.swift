//
//  ServiceRepositoryImpl.swift
//  ServiciosSV
//
//  Created by Sara Ascencio on 5/5/26.
//
import Foundation
import Combine
final class ServiceRepositoryImpl: ServiceRepository {

    private func t(_ key: String, locale: SupportedLocale) -> String {
        guard let path = Bundle.main.path(forResource: locale.rawValue, ofType: "lproj"),
              let bundle = Bundle(path: path) else { return key }
        return bundle.localizedString(forKey: key, value: nil, table: nil)
    }

    func getAllServices(for locale: SupportedLocale) -> [Service] {
        let s = { [weak self] (key: String) -> String in
            self?.t(key, locale: locale) ?? key
        }

        return [
            Service(id: UUID(), title: s("service_gardening_title"), description: s("service_gardening_desc"), longDescription: s("service_gardening_long"), basePriceUSD: 15, iconName: "leaf.fill", estimatedTime: s("service_gardening_time")),
            Service(id: UUID(), title: s("service_locksmith_title"), description: s("service_locksmith_desc"), longDescription: s("service_locksmith_long"), basePriceUSD: 20, iconName: "key.fill", estimatedTime: s("service_locksmith_time")),
            Service(id: UUID(), title: s("service_electrician_title"), description: s("service_electrician_desc"), longDescription: s("service_electrician_long"), basePriceUSD: 20, iconName: "bolt.fill", estimatedTime: s("service_electrician_time")),
            Service(id: UUID(), title: s("service_plumber_title"), description: s("service_plumber_desc"), longDescription: s("service_plumber_long"), basePriceUSD: 25, iconName: "drop.fill", estimatedTime: s("service_plumber_time")),
            Service(id: UUID(), title: s("service_painter_title"), description: s("service_painter_desc"), longDescription: s("service_painter_long"), basePriceUSD: 18, iconName: "paintbrush.fill", estimatedTime: s("service_painter_time"))
        ]
    }
}
