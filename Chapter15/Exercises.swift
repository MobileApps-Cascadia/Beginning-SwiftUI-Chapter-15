import SwiftUI


struct ExercisesView: View {
    @State var name = ""
    @State var major = ""
    @State var email = "yes"
    @State var flag = true
    @State var topExpanded: Bool = true
    
    /*@State var Classes: [Discipline] = [Discipline(name: "Information Technology - Mobile", abbreviation: "IT-MOB",
                                                   groupList: [Group(title: "Android", courseList: [Course(title: "Android Applications Development I", courseNumber: 371, enrolled: false), Course(title: "Android Applications Development I", courseNumber: 372, enrolled: false)]),
                                                               Group(title: "iOS", courseList: [Course(title: "iOS Application Development II", courseNumber: 381, enrolled: false), Course(title: "iOS Application Development II", courseNumber: 382, enrolled: false)]),
                                                               Group(title: "General", courseList: [Course(title: "Mobile User Interface Design", courseNumber: 271, enrolled: false), Course(title: "Trends in Mobile Ecosystems", courseNumber: 480, enrolled: false), Course(title: "Software Design Patterns and Techniques", courseNumber: 350, enrolled: false)])]),
                                        Discipline(name: "English", abbreviation: "ENGL",
                                                   groupList: [Group(title: "Composition", courseList: [Course(title: "English Composition I", courseNumber: 101, enrolled: false), Course(title: "Composition II", courseNumber: 102, enrolled: false)]),
                                                               Group(title: "Literature", courseList: [Course(title: "Introduction to Literature", courseNumber: 111, enrolled: false), Course(title: "Film and Literature", courseNumber: 0, enrolled: false)])]),
                                        Discipline(name: "Math", abbreviation: "MATH",
                                                   groupList: [Group(title: "Algebra", courseList: [Course(title: "Introduction to Algebra", courseNumber: 75, enrolled: false), Course(title: "Essentials of Intermediate Algebra", courseNumber: 0, enrolled: false), Course(title: "Algebra for Precalculus", courseNumber: 95, enrolled: false), Course(title: "Linear Algebra", courseNumber: 208, enrolled: false)]),
                                                               Group(title: "Calculus", courseList: [Course(title: "Precalculus I", courseNumber: 141, enrolled: false), Course(title: "Precalculus II", courseNumber: 142, enrolled: false), Course(title: "Calculus I", courseNumber: 151, enrolled: false), Course(title: "Calculus II", courseNumber: 152, enrolled: false), Course(title: "Calculus 3", courseNumber: 163, enrolled: false), Course(title: "Calculus 4", courseNumber: 264, enrolled: false)]),
                                                               Group(title: "Statistics", courseList: [Course(title: "Introduction to Statistics", courseNumber: 146, enrolled: false)])])]*/
    var Disciplines: [Discipline] = [
            Discipline(name: "Information Technology - Mobile", isClass: false, groupList: [
                Discipline(name: "Android", isClass: false, groupList: [Discipline(name: "Android Applications Development I", isClass: true),Discipline(name: "Android Applications Development II", isClass: true)]),
                Discipline(name: "iOS", isClass: false, groupList: [Discipline(name: "iOS Application Development I", isClass: true),Discipline(name: "iOS Application Development II", isClass: true)]),
                Discipline(name: "General", isClass: false, groupList: [Discipline(name: "Mobile User Interface Design", isClass: true),Discipline(name: "Trends in Mobile Ecosystems", isClass: true),Discipline(name: "Software Design Patterns and Techniques", isClass: true)]),]),
            Discipline(name: "English", isClass: false, groupList: [
                Discipline(name: "Composition", isClass: false, groupList: [Discipline(name: "English Composition I", isClass: true),Discipline(name: "Composition II", isClass: true)]),
                Discipline(name: "Literature", isClass: false, groupList: [Discipline(name: "Introduction to Literature", isClass: true),Discipline(name: "Film and Literature", isClass: true)])]),
            Discipline(name: "Math", isClass: false, groupList: [
                Discipline(name: "Algebra", isClass: false, groupList: [Discipline(name: "Introduction to Algebra", isClass: true),Discipline(name: "Essentials of Intermediate Algebra", isClass: true),Discipline(name: "Algebra for Precalculus", isClass: true),Discipline(name: "Linear Algebra", isClass: true)]),
                Discipline(name: "Calculus", isClass: false, groupList: [Discipline(name: "Precalculus I", isClass: true),Discipline(name: "Precalculus II", isClass: true),Discipline(name: "Calculus I", isClass: true),Discipline(name: "Calculus II", isClass: true),Discipline(name: "Calculus 3", isClass: true),Discipline(name: "Calculus 4", isClass: true)]),
                Discipline(name: "Statistics", isClass: false, groupList: [Discipline(name: "Introduction to Statistics", isClass: true)]),])]
    
    @State var classes = [Discipline]()
    var body: some View {
        VStack {
            Text("Exercises")
                .font(.largeTitle)
            Text(flag ? "Name: \(name) Intended Major: \(major) Mail: Yes" : "Name: \(name) Intended Major: \(major) Mail: No")
            DisclosureGroup(topExpanded ? "Tap to close" : "Tap to open", isExpanded: $topExpanded) {
                
                TextField("Name", text: $name)
                    .textFieldStyle(.plain)
                    .autocorrectionDisabled()
                    .padding()
                
                TextField("Intended major", text: $major)
                    .padding()
                
                Toggle(isOn: $flag) {
                    Text("Would you like to recieve junk mail?")
                    
                }.padding()
            }
            .padding()
            List {
                OutlineGroup(Disciplines, id: \.id, children: \.groupList) { group in
                    Text(group.name)
                        .onTapGesture {
                            if(group.isClass){
                                classes.append(group)
                            }
                        }
                }
            }
            Form{
                
                Text("Classes:").font(.title)
                List {
                    ForEach(classes){ course in
                        Text(course.name)
                    }
                }
            }
        }
    }
}

// Like "IT-MOB", or "ENG" (English) or "MATH"
class Discipline: Identifiable {
    let id = UUID()
    // add properties here
    let name: String
    //let abbreviation: String
    let isClass: Bool
    var groupList: [Discipline]?
    init(name: String, isClass: Bool, groupList: [Discipline]? = nil) {
        self.name = name
        //self.abbreviation = abbreviation
        self.isClass = isClass
        self.groupList = groupList
    }
}
/*class Group: Identifiable {
    let id = UUID()
    let title: String
    var courseList: [Course]
    init(title: String, courseList: [Course]) {
        self.title = title
        self.courseList = courseList
    }
}*/

// Like "IT-MOB 381" or "ENG 101" or "MATH &107"
/*struct Course: Identifiable {
    let id = UUID()
    // add properties here
    let title: String
    let courseNumber: Int
    var enrolled: Bool
    init(title: String, courseNumber: Int, enrolled: Bool) {
        self.title = title
        self.courseNumber = courseNumber
        self.enrolled = enrolled
    }
}*/

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}
