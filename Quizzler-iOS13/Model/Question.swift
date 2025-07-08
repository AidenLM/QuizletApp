//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Mehmet Akif LM on 8.07.2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct Question: Codable {
    let text: String
    let answers: Int
    
    init(q: String, a: Int) {
        text = q
        answers = a
    }

}
