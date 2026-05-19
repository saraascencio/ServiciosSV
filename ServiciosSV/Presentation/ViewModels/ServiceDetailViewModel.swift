//
//  ServiceDetailViewModel.swift
//  ServiciosSV
//
//  Created by Sara Ascencio on 5/5/26.
//
import Foundation
import Combine

@MainActor
final class ServiceDetailViewModel: ObservableObject {
    let service: Service
    let formattedPrice: String
    
    init(service: Service, formattedPrice: String) {
        self.service = service
        self.formattedPrice = formattedPrice
    }
}
