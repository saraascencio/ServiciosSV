//
//  ServiceDetailView.swift
//  ServiciosSV
//
//  Created by Sara Ascencio on 5/5/26.
//
import SwiftUI

struct ServiceDetailView: View {
    let service: Service
    let formattedPrice: String
    let locale: SupportedLocale
    
    @Environment(\.dismiss) private var dismiss
    
    private let localization = LocalizationManager.shared
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    
                    // Hero header
                    VStack(alignment: .leading, spacing: 12) {
                        Image(systemName: service.iconName)
                            .font(.system(size: 28, weight: .medium))
                            .foregroundStyle(AppTheme.primaryBlue)
                            .frame(width: 56, height: 56)
                            .background(AppTheme.primaryBlue.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                        
                        Text(service.title)
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text(service.description)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .lineSpacing(3)
                    }
                    .padding(.horizontal)
                    .padding(.top, 24)
                    .padding(.bottom, 28)
                    
                    Divider()
                    
                    VStack(spacing: 0) {
                        InfoRow(icon: "tag",
                                label: localization.priceFromLabel(),
                                value: formattedPrice,
                                valueColor: .primary)
                        Divider().padding(.leading, 52)
                        InfoRow(icon: "clock",
                                label: localization.estimatedTimeLabel(),
                                value: service.estimatedTime,
                                valueColor: .secondary)
                    }
                    .background(AppTheme.cardBackground)
                    .padding(.top, 1)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(localization.aboutServiceLabel())
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(.secondary)
                            .textCase(.uppercase)
                            .kerning(0.5)
                        
                        Text(service.longDescription)
                            .font(.subheadline)
                            .lineSpacing(5)
                    }
                    .padding()
                    .padding(.top, 12)
                }
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle(service.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(localization.closeButton()) {
                        dismiss()
                    }
                    .fontWeight(.medium)
                }
            }
        }
    }
}

// MARK: - Info Row (sin cambios)
private struct InfoRow: View {
    let icon: String
    let label: String
    let value: String
    let valueColor: Color
    
    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(AppTheme.primaryBlue)
                .frame(width: 28, height: 28)
                .background(AppTheme.primaryBlue.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 7))
            
            Text(label)
                .font(.subheadline)
            
            Spacer()
            
            Text(value)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundStyle(valueColor)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 13)
    }
}
