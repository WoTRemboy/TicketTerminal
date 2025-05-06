//
//  AboutAppViewModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 03/05/2025.
//

import SwiftUI

final class AboutAppViewModel: ObservableObject {
    
    internal func buttonAction(for type: AboutAppCell) {
        switch type {
        case .version:
            do {}
        case .number:
            telephoneCall()
        case .info:
            infoOpen()
        case .address:
            addressOpen()
        }
    }
    
    private func telephoneCall() {
        let tel = "tel://"
        let formattedString = tel + Texts.About.Number.linkTel
        guard let url = URL(string: formattedString) else { return }
        UIApplication.shared.open(url)
    }
    
    private func infoOpen() {
        let formattedString = "https://company.rzd.ru/ru/9350"
        guard let url = URL(string: formattedString) else { return }
        UIApplication.shared.open(url)
    }
    
    private func addressOpen() {
        let formattedString = "maps://?saddr=&daddr=\(55.768971),\(37.651918)"
        guard let url = URL(string: formattedString) else { return }
        UIApplication.shared.open(url)
    }
}
