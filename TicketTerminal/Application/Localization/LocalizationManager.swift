//
//  LocalizationManager.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 06/05/2025.
//

import Foundation
import SwiftUI

final class LocalizationManager: ObservableObject {
    
    @AppStorage(Texts.UserDefaults.Language.selectedLanguage)
    internal var selectedLanguage: String = Locale.current.language.languageCode?.identifier ?? Texts.Language.English.code {
        didSet {
            Bundle.setLanguage(selectedLanguage)
            objectWillChange.send()
        }
    }
    
    static let shared = LocalizationManager()
    
    internal func changeLanguage(to code: String) {
        selectedLanguage = code
    }
}

private var bundleKey: UInt8 = 0

extension Bundle {
    static internal func setLanguage(_ language: String) {
        defer {
            object_setClass(Bundle.main, PrivateBundle.self)
        }
        objc_setAssociatedObject(Bundle.main, &bundleKey, language, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    final class PrivateBundle: Bundle {
        override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
            guard let language = objc_getAssociatedObject(self, &bundleKey) as? String,
                  let path = Bundle.main.path(forResource: language, ofType: "lproj"),
                  let bundle = Bundle(path: path) else {
                return super.localizedString(forKey: key, value: value, table: tableName)
            }
            
            return bundle.localizedString(forKey: key, value: value, table: tableName)
        }
    }
}

extension String {
    internal var localized: String {
        NSLocalizedString(self, comment: String())
    }
}
