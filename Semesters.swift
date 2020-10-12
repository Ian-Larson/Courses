//
//  Semesters.swift
//  Courses
//
//  Created by Ian Larson on 6/30/20.
//  Copyright © 2020 Ian Larson. All rights reserved.
//

import Foundation
import SwiftUI

struct SemesterSection: Codable, Identifiable {
    var id = UUID()
    var name: String
    var classes: [CourseItem]
}

struct CourseItem: Identifiable, Codable {
    var id = UUID()
    var shortName: String
    var fullName: String
    var creditHours: Int
    var semester: String
    var year: String
    var grade: String
    var prof: String
    
    static var example = CourseItem(shortName: "COMP 1210", fullName: "Object Oriented Programming I", creditHours: 3, semester: "Spring", year: "2020", grade: "A", prof: "Cross")
}
