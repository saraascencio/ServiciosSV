//
//  HomeViewModel.swift
//  ServiciosSV
//
//  Created by Sara Ascencio on 5/5/26.
//
import Foundation
import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var services: [Service] = []
    @Published var currentLocale: SupportedLocale = .elSalvador
    @Published var greetingTitle: String = ""
    @Published var greetingSubtitle: String = ""
    @Published var dateString: String = ""
    @Published var servicesTitle: String = ""
   
    private let repository: ServiceRepository
    private let localizationManager = LocalizationManager.shared
   
    init(repository: ServiceRepository) {
        self.repository = repository
        updateContent()
    }
   
    func changeLocale(to locale: SupportedLocale) {
        currentLocale = locale
        localizationManager.changeLocale(to: locale)
        updateContent()
    }
   
    private func updateContent() {
        // Cargar servicios según el idioma actual
        services = repository.getAllServices(for: currentLocale)
        // Obtener textos traducidos desde LocalizationManager
        greetingTitle = localizationManager.greetingTitle()
        greetingSubtitle = localizationManager.greetingSubtitle()
        servicesTitle = localizationManager.servicesTitle()
        // Fecha localizada
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: currentLocale.rawValue)
        formatter.dateStyle = .long
        dateString = formatter.string(from: Date())
    }
   
    func formattedPrice(for service: Service) -> String {
        service.basePriceUSD.toCurrency(locale: currentLocale)
    }
}
