// Modified Exercise.swift
import SwiftUI


struct ExercisesView: View {
    @State var messageOne = ""
    @State var studentName = ""
       @State var intendedMajor = ""
       @State var receiveJunkEmail = false
    
    // Academic disciplines and their areas and courses
       let academicDisciplines: [AcademicDiscipline] = [
           AcademicDiscipline(name: "English", areas: [
               Area(name: "Composition", courses: ["ENG 100", "ENG 101"]),
               Area(name: "Literature", courses: ["ENG 200", "ENG 201"])
           ]),
           AcademicDiscipline(name: "Math", areas: [
               Area(name: "Pre-calculus", courses: ["MATH 101", "MATH 102"]),
               Area(name: "Calculus", courses: ["MATH 200", "MATH 201"]),
               Area(name: "Statistics", courses: ["MATH 300", "MATH 301"])
           ]),
         
       ]
    
    @State var selectedCourses: [String] = []
    
    var body: some View {
        VStack {
            Text("Exercises")
                .font(.largeTitle)
            // Displaying user choices above the DisclosureGroup
            Text("Student Name: \(studentName)")
            Text("Intended Major: \(intendedMajor)")
            Text("Receive Junk Email: \(receiveJunkEmail.description)")
            
            DisclosureGroup("Student Information") {
                // Form elements within the DisclosureGroup
                TextField("Student Name", text: $studentName)
                    .padding()
                TextField("Intended Major", text: $intendedMajor)
                    .padding()
                Toggle("Receive Junk Email", isOn: $receiveJunkEmail)
                    .padding()
            }
            // List of academic disciplines
            List(academicDisciplines) { discipline in
                DisclosureGroup(discipline.name) {
                    // List of areas within each discipline
                    List(discipline.areas) { area in
                        DisclosureGroup(area.name) {
                            // List of courses within each area
                            ForEach(area.courses, id: \.self) { course in
                                Text(course)
                                    .onTapGesture {
                                        selectedCourses.append(course)
                                    }
                            }
                        }
                    }
                }
            }
            
            
            // Selected courses Text view
                      Text("Selected Courses: \(selectedCourses.joined(separator: ", "))")
                          .padding()
            
           
            
            // Outline group for academic disciplines and areas
            OutlineGroup(academicDisciplines, children: \.areas) { discipline in
                Text(discipline.name)
            }
        label: { discipline in
                        Text(discipline.name)
                    }
                    .onTapGesture {
                        if let course = outlineItem.course {
                            selectedCourses.append(course)
                        }
                    }
                    
            
            Text("More text after the form")
        }
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}

struct AcademicDiscipline: Identifiable {
    let id = UUID()
    let name: String
    let areas: [Area]
}

struct Area: Identifiable {
    let id = UUID()
    let name: String
    let courses: [String]
}

extension OutlineGroupItem {
    var course: String? {
        switch self {
        case let .item(item):
            return item.courses.first
        default:
            return nil
        }
    }
}
