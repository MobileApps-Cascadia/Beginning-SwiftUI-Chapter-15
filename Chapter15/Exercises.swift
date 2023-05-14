import SwiftUI


struct ExercisesView: View {
    @State var messageOne = ""
    
    var body: some View {
        VStack {
            Text("Exercises")
                .font(.largeTitle)
            Text("Your groups go here")
            Text("More text after the form")
        }
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}
