//
//  ContentView.swift
//  Courses
//
//  Created by Ian Larson on 6/29/20.
//  Copyright © 2020 Ian Larson. All rights reserved.
//

import SwiftUI

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}

struct CourseItem: Identifiable, Codable {
    var id = UUID()
    let shortName: String
    let fullName: String
    let creditHours: Int
    let semester: String
    let year: String
    let grade: String
    let prof: String
    
    static let example = CourseItem(shortName: "COMP 1210", fullName: "Object Oriented Programming I", creditHours: 3, semester: "Spring", year: "2020", grade: "A", prof: "Cross")
}

class Course: ObservableObject {
    @Published var items = [CourseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try?
                encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            
            if let decoded = try?
                decoder.decode([CourseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}

struct ContentView: View {
    @ObservedObject var course = Course()
    @State private var showingAddClass = false
    
    var body: some View {
        NavigationView {
                    List {
                        ForEach(course.items) { item in
                            
                            ItemRow(item: item)
                        }
                            .onDelete(perform: removeItems)
                    }
                        .navigationBarTitle("Classes")
                        .navigationBarItems(trailing:
                            Button(action: {
                        self.showingAddClass = true
                    }) {
                        Text("Add Class")
                        }
                    )
                        .sheet(isPresented: $showingAddClass) {
                            //Show AddView Here
                            AddView(course: self.course)
                    }
            
                    
                }
            }
            
            func removeItems(at offsets: IndexSet) {
                withAnimation {
                    course.items.remove(atOffsets: offsets)
                }
            }
    
            func moveItems(from: IndexSet, to: Int) {
                withAnimation {
                    course.items.move(fromOffsets: from, toOffset: to)
                }
            }
        }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
