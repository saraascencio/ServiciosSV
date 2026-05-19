//
//  ServiceDTO.swift
//  ServiciosSV
//
//  Created by Sara Ascencio on 5/5/26.
//
import Foundation

struct ServiceDTO: Codable {
    let title: String
    let description: String
    let basePriceUSD: Double
    let iconName: String
    let estimatedTime: String
    let longDescription: String
}
