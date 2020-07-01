//
//  ItemRow.swift
//  Courses
//
//  Created by Ian Larson on 6/30/20.
//  Copyright © 2020 Ian Larson. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    static let colors: [String: Color] = [
        "A":.green,
        "B":.yellow,
        "C":.orange,
        "D":.pink,
        "F":.red
        ]
    
    
    var item: CourseItem
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(item.shortName)
                        .font(.headline)
                        .fontWeight(.heavy)
                    Text("(\(item.fullName))")
                        .font(.subheadline)
                        .fontWeight(.regular)
                    
                }
                HStack {
                    Text("\(item.creditHours) Credits,")
                        .font(.subheadline)
                        .fontWeight(.regular)
                    Text("\(item.semester) \(item.year)")
                        .font(.subheadline)
                        .fontWeight(.regular)
                }
            }
            //.padding(.leading)
            Spacer()
            Spacer()
            VStack(alignment: .trailing) {
                //Text("(\(item.semester) \(item.year))")
                Text(item.grade)
                    .font(.headline)
                    .padding(.all, 5)
                    .foregroundColor(.white)
                    .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous).fill(
                        Self.colors[item.grade, default: .green]))
                
                    //.background(Self.colors[item.grade, default: .white])
                    //.foregroundColor(.white)
            }
            .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous).fill(
                Self.colors[item.grade, default: .white]))
        }
        
        
    }
}


struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: CourseItem.example)
    }
}
