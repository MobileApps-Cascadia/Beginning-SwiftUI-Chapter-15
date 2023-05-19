import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    let name: String
}

struct Dicipline: Identifiable{
    let id = UUID()
    let name: String
    let courses: [Course]
}
struct ExercisesView: View {
    @State var messageOne = ""
    @State var messageTwo = ""
    @State var flag = true
    @State var topExpanded: Bool = false
    @State var message = ""
    @State var selectedCourse: [Course] = []
    
    let dicipl = [
        Dicipline(name: "English", courses: [
            Course(name: "ENG 100"),
            Course(name: "ENG 101"),
            Course(name: "Shakespeare"),
            Course(name: "American 20th Century Literature")
        ]),
        Dicipline(name: "Math", courses: [
            Course(name: "Pre-Calculus"),
            Course(name: "Calculus"),
            Course(name: "Calculus 2"),
            Course(name: "Calculus 3")
        ]),
        Dicipline(name: "BIT", courses: [
            Course(name: "Android Development I"),
            Course(name: "Android Development II"),
            Course(name: "Basics of Web Authoring")
        ])
    ]
    
    var body: some View {
        VStack {
            Text("\(messageOne) is majoring in \(messageTwo) and would like to opt \(flag ? "in" : "out") to recieving emails.")
            DisclosureGroup("College"){
                Text("Your name")
                TextField("Type Here", text: $messageOne)
                    .padding()
                Text("Your major")
                TextField("Type Here", text: $messageTwo)
                    .padding()
                //Text(flag ? "No" : "Yes")
                Toggle(isOn: $flag){
                    Text("Would you like to recieve emails?")
                }
            }
            //  Text("Exercises")
            //      .font(.largeTitle)
            //  Text("Your groups go here")
            //  Text("More text after the form")
                
                DisclosureGroup(topExpanded ? "Tap to close class information" : "Tap to open class information", isExpanded: $topExpanded) {
                    
                    
                    List(dicipl) { dicipl in
                        DisclosureGroup("\(dicipl.name)") {
                            ForEach(dicipl.courses) { course in
                                Button(action: {
                                    toggleCourseSelection(course)
                                }) {
                                    HStack {
                                        Text(course.name)
                                            .padding(.leading)
                                        Spacer()
                                        if selectedCourse.contains(where: { $0.id == course.id }) {
                                            Image(systemName: "checkmark")
                                                .foregroundColor(.blue)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Text("Selected Courses:")
                    .font(.headline)
                    .padding(.top)

                List(selectedCourse) { course in
                    Text(course.name)
                        .padding(.leading)
                }

                Spacer()
            }
            .padding()
        }

        private func toggleCourseSelection(_ course: Course) {
            if selectedCourse.contains(where: { $0.id == course.id }) {
                selectedCourse.removeAll { $0.id == course.id }
            } else {
                selectedCourse.append(course)
        }
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}
