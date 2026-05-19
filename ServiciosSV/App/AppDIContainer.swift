//
//  AppDIContainer.swift
//  ServiciosSV
//
//  Created by Sara Ascencio on 5/5/26.
//
import Foundation
final class AppDIContainer {
    
  
    private let serviceRepository: ServiceRepository = ServiceRepositoryImpl()
    private lazy var getServicesUseCase = GetServicesUseCase(repository: serviceRepository)
    
    // MARK: - ViewModels
    func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel(repository: serviceRepository)   
    }
}
