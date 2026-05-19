//
//  ServiceRepository.swift
//  ServiciosSV
//
//  Created by Sara Ascencio on 5/5/26.
//
protocol ServiceRepository {
    func getAllServices(for locale: SupportedLocale) -> [Service]
}
