import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    let name: String
}

struct Discipline: Identifiable {
    let id = UUID()
    let name: String
    let courses: [Course]
}

struct ExercisesView: View {
    @State private var studentName = ""
    @State private var intendedMajor = ""
    @State private var receiveJunkEmail = false
    @State private var selectedCourses: [Course] = []
    
    let disciplines = [
        Discipline(name: "English", courses: [
            Course(name: "ENG 100"),
            Course(name: "ENG 101"),
            Course(name: "Shakespeare"),
            Course(name: "American 20th Century Literature")
        ]),
        Discipline(name: "Math", courses: [
            Course(name: "Pre-calculus"),
            Course(name: "Calculus"),
            Course(name: "Statistics")
        ]),
        Discipline(name: "IT-Mob", courses: [
            Course(name: "Mobile App Development"),
            Course(name: "Web Design")
        ]),
        Discipline(name: "IT-CS", courses: [
            Course(name: "Introduction to Computer Science"),
            Course(name: "Data Structures"),
            Course(name: "Algorithm Design")
        ])
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Exercises")
                .font(.largeTitle)
            
            DisclosureGroup("Student Information") {
                VStack(alignment: .leading) {
                    TextField("Name", text: $studentName)
                    TextField("Intended Major", text: $intendedMajor)
                    Toggle("Receive Junk Email", isOn: $receiveJunkEmail)
                }
                .padding()
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Student Information:")
                Text("Name: \(studentName)")
                Text("Intended Major: \(intendedMajor)")
                Text("Receive Junk Email: \(receiveJunkEmail ? "Yes" : "No")")
            }
            
            Text("Academic Disciplines:")
                .font(.headline)
                .padding(.top)
            
            List(disciplines) { discipline in
                DisclosureGroup("\(discipline.name)") {
                    ForEach(discipline.courses) { course in
                        Button(action: {
                            toggleCourseSelection(course)
                        }) {
                            HStack {
                                Text(course.name)
                                    .padding(.leading)
                                Spacer()
                                if selectedCourses.contains(where: { $0.id == course.id }) {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
                }
            }
            
            Text("Selected Courses:")
                .font(.headline)
                .padding(.top)
            
            List(selectedCourses) { course in
                Text(course.name)
                    .padding(.leading)
            }
            
            Spacer()
        }
        .padding()
    }
    
    private func toggleCourseSelection(_ course: Course) {
        if selectedCourses.contains(where: { $0.id == course.id }) {
            selectedCourses.removeAll { $0.id == course.id }
        } else {
            selectedCourses.append(course)
        }
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}
