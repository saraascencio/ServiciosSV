//
//  GetServicesUseCase.swift
//  ServiciosSV
//
//  Created by Sara Ascencio on 5/5/26.
//
protocol GetServicesUseCaseProtocol {
    func execute(for locale: SupportedLocale) -> [Service]
}

final class GetServicesUseCase: GetServicesUseCaseProtocol {
    private let repository: ServiceRepository
   
    init(repository: ServiceRepository) {
        self.repository = repository
    }
   
    func execute(for locale: SupportedLocale) -> [Service] {
        repository.getAllServices(for: locale)
    }
}
