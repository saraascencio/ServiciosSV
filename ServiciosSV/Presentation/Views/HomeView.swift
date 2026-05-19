//
//  HomeView.swift
//  ServiciosSV
//
//  Created by Sara Ascencio on 5/5/26.
//
import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel
    @State private var showLanguageSheet = false
    @State private var selectedService: Service?

    init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 28) {

                    // Header
                    VStack(alignment: .leading, spacing: 4) {
                        Text(viewModel.dateString)
                               .font(.subheadline)
                               .foregroundStyle(.secondary)
                               .kerning(0.3)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text(viewModel.greetingTitle)
                                .font(.title2)
                                .fontWeight(.bold)

                            Text(viewModel.greetingSubtitle)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)

                    // Sección de servicios
                    VStack(alignment: .leading, spacing: 12) {
                        Text(viewModel.servicesTitle)
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(.secondary)
                            .textCase(.uppercase)
                            .kerning(0.6)
                            .padding(.horizontal)

                        VStack(spacing: 1) {
                            ForEach(viewModel.services) { service in
                                ServiceRow(
                                    service: service,
                                    formattedPrice: viewModel.formattedPrice(for: service)
                                )
                                .onTapGesture {
                                    selectedService = service
                                }
                            }
                        }
                        .background(AppTheme.cardBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .padding(.horizontal)
                    }
                }
                .padding(.bottom, 32)
            }
            .background(Color(.systemGroupedBackground))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showLanguageSheet = true
                    } label: {
                        HStack(spacing: 5) {
                            Text(viewModel.currentLocale.flag)
                            Text(viewModel.currentLocale.currencyCode)
                                .font(.subheadline)
                                .fontWeight(.medium)
                        }
                        .foregroundStyle(.primary)
                    }
                }
            }
            .sheet(isPresented: $showLanguageSheet) {
                LanguageSelectorView(currentLocale: viewModel.currentLocale) { newLocale in
                    viewModel.changeLocale(to: newLocale)
                }
            }
            // Detalle del Servicio
            .sheet(item: $selectedService) { service in
                ServiceDetailView(
                    service: service,
                    formattedPrice: viewModel.formattedPrice(for: service),
                    locale: viewModel.currentLocale
                )
            }
        }
    }
}

// MARK: - Language Selector
struct LanguageSelectorView: View {
    let currentLocale: SupportedLocale
    let onSelect: (SupportedLocale) -> Void
    
    private let localization = LocalizationManager.shared
    
    var body: some View {
        NavigationStack {
            List(SupportedLocale.allCases) { locale in
                Button {
                    onSelect(locale)
                } label: {
                    HStack(spacing: 16) {
                        Text(locale.flag)
                            .font(.system(size: 40))
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(locale.displayName)
                                .font(.headline)
                            Text(locale.currencyCode)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        
                        if locale == currentLocale {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.blue)
                                .font(.title2)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle(localization.languageSelectorTitle())
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
