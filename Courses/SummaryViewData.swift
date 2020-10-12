//
//  SummaryViewData.swift
//  Courses
//
//  Created by Ian Larson on 6/30/20.
//  Copyright © 2020 Ian Larson. All rights reserved.
//

import Foundation
import SwiftUI

class Summary: ObservableObject {
    @Published var items = [CourseItem]()
    
    var totalHours: Int {
        if items.count > 0 {
            return items.reduce(0) {_,_ in 0 + 1.creditHours }
            }
        }
    }
}
