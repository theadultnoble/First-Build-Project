//
//  GameScore.swift
//  First Build Project
//
//  Created by Theadultnoble on 14/05/2023.
//

import Foundation
import ParseSwift

struct GameScore: ParseObject {
    init() {
        self.score = 1
    }
    
    var originalData: Data?
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    
    var score: Int = 0

    init(score: Int) {
        self.score = score
    }

    init(objectId: String?) {
        self.objectId = objectId
    }
}
