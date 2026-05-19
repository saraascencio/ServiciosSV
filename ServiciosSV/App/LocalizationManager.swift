//
//  LocalizationManager.swift
//  ServiciosSV
//
//  Created by Sara Ascencio on 5/5/26.
//
import Foundation
import Combine

@MainActor
final class LocalizationManager: ObservableObject {
    static let shared = LocalizationManager()

    @Published var currentLocale: SupportedLocale = .elSalvador

    private init() {}

    func changeLocale(to locale: SupportedLocale) {
        currentLocale = locale
    }

    // MARK: - Helper
    private func t(_ key: String) -> String {
        guard let path = Bundle.main.path(forResource: currentLocale.rawValue, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            return key
        }
        return bundle.localizedString(forKey: key, value: nil, table: nil)
    }

    // MARK: - Home Screen
    func greetingTitle() -> String      { t("greeting_title") }
    func greetingSubtitle() -> String   { t("greeting_subtitle") }
    func servicesTitle() -> String      { t("services_title") }
    // MARK: - Service Detail
    func priceFromLabel() -> String     { t("price_from") }
    func estimatedTimeLabel() -> String { t("estimated_time") }
    func aboutServiceLabel() -> String  { t("about_service") }
    func closeButton() -> String        { t("close_button") }
    // MARK: - Language Selector
    func languageSelectorTitle() -> String { t("language_selector_title") }
}
