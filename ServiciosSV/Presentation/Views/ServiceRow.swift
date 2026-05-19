//
//  ServiceRow.swift
//  ServiciosSV
//
//  Created by Sara Ascencio on 5/5/26.
//
import SwiftUI

struct ServiceRow: View {
    let service: Service
    let formattedPrice: String

    var body: some View {
        HStack(alignment: .top, spacing: 14) {

            // Ícono
            Image(systemName: service.iconName)
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(AppTheme.primaryBlue)
                .frame(width: 42, height: 42)
                .background(AppTheme.primaryBlue.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.top, 2)

            // Info
            VStack(alignment: .leading, spacing: 4) {
                Text(service.title)
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)

                Text(service.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)

                Text(service.estimatedTime)
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(AppTheme.primaryBlue)
                    .padding(.top, 2)
            }

            Spacer()

            // Precio
            VStack(alignment: .trailing, spacing: 3) {
                Text(formattedPrice)
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)

                Image(systemName: "chevron.right")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.quaternary)
                    .padding(.top, 2)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .overlay(alignment: .bottom) {
            Divider()
                .padding(.leading, 72)
        }
    }
}
