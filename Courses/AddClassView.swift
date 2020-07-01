//
//  AddClassView.swift
//  Courses
//
//  Created by Ian Larson on 6/29/20.
//  Copyright © 2020 Ian Larson. All rights reserved.
//


import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var course: Course
    
    @State private var shortName = ""
    @State private var fullName = ""
    @State private var semester: String = "Fall"
    @State private var year: String = "2019"
    @State private var creditHours = 2
    @State private var grade: String = "A"
    @State private var prof = ""
    
    let semesters = ["Spring", "Summer", "Fall"]
    let grades = ["A", "B", "C", "D", "F"]
    let hours = [0, 1, 2, 3, 4, 5]
    let years = ["2019", "2020", "2021", "2022", "2023", "2024"]
    
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Basic Info")) {
                    TextField("Class Code: ", text: $shortName)
                    
                    TextField("Full Class Name: ", text: $fullName)
                    
                    TextField("Professor: ", text: $prof)
                    }
                
                Section(header: Text("Select a semester")) {
                    Picker("Semester", selection: $semester) {
                        ForEach(semesters, id: \.self) { semester in
                            Text(semester)
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Select a year")) {
                    Picker("Year", selection: $year) {
                        ForEach(years, id: \.self) { year in
                            Text(year)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                
                Section(header: Text("Credit hours")) {
                    Picker("Credit Hours", selection: $creditHours) {
                        ForEach(0 ..< hours.count) {
                            Text("\(self.hours[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Select your grade")) {
                    Picker("Grade", selection: $grade) {
                        ForEach(grades, id: \.self) { grade in
                        Text(grade)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                
                
                //TextField("Amount", text: $amount)
                    //.keyboardType(.numberPad)
            }
            .navigationBarTitle("Add New Class")
            .navigationBarItems(trailing: Button("Save") {
                //if let actualYear = Int(self.year)
                //{
                    let item = CourseItem(shortName: self.shortName, fullName: self.fullName, creditHours: self.creditHours, semester: self.semester, year: self.year, grade: self.grade, prof: self.prof)
                    self.course.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
               // }
                }
            )
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(course: Course())
    }
}
