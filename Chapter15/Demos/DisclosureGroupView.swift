import SwiftUI
struct DisclosureGroupView: View {
    @State var sliderValue = 0.0
    @State var message = ""
    @State var flag = true
    
    @State var topExpanded: Bool = true
    
    var body: some View {
        ScrollView(Axis.Set.vertical, showsIndicators: true, content: {
            
            DisclosureGroup(topExpanded ? "Tap to close" : "Tap to open", isExpanded: $topExpanded) {
                
                
                Text("You typed = \(message)")
                TextField("Type here", text: $message)
                    .padding()
                Text(flag ? "Toggle = true" : "Toggle = false")
                Toggle(isOn: $flag) {
                    Text("Toggle")
                }.padding()
                Text("The slider value = \(sliderValue)")
                Slider(value: $sliderValue, in: 0...15)
                    .padding()
                
                ForEach(0..<40) {
                    Text("Item #\($0)     ")
                }
            }
        })
    }
}

struct DisclosureGroupView_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureGroupView()
    }
}
