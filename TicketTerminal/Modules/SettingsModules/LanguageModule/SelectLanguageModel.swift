//
//  SelectLanguageModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 06/05/2025.
//

import Foundation
import SwiftUI

struct Language: Identifiable {
    let id = UUID()
    let name: String
    let flag: Image
    let code: String
    
    static internal var languages: [Language] = [
        .init(name: Texts.Language.Russian.name,
              flag: Image.Language.russian,
              code: Texts.Language.Russian.code
             ),
        .init(name: Texts.Language.English.name,
              flag: Image.Language.english,
              code: Texts.Language.English.code
             ),
        .init(name: Texts.Language.Chinese.name,
              flag: Image.Language.chinese,
              code: Texts.Language.Chinese.code
             )
    ]
}
