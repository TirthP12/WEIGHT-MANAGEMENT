import SwiftUI

struct ContentView: View {
    @StateObject var fm = FirebaseManager()
    
    @State private var oneosixWeight = ""
    @State private var onethirteentWeight = ""
    @State private var onetwentyWeight = ""
    @State private var onetwentysixWeight = ""
    @State private var onethirtytwoWeight = ""
    @State private var onethirtyeightWeight = ""
   
    @State private var weightEntries: [Double] = []
    
    var body: some View {
        VStack {
            Text("Weight Management JV I")
                .foregroundColor(.lightBlue)
                
            VStack {
    
                TextField("Oneosix Weight", text: $oneosixWeight)
                TextField("Onetwenty Weight", text: $onetwentyWeight)
            }

            Button("Save") {
               
                if let onetwentyValue = Double(onetwentyWeight), let oneosixValue = Double(oneosixWeight) {
                
                    weightEntries.append(onetwentyValue)
                    weightEntries.append(oneosixValue)
                    
                   
                    oneosixWeight = ""
                    onetwentyWeight = ""
                    
                    fm.push(onetwentyWeight, under: "weight")
                    
                    
                    // Here you would implement the code to save weightEntries to Firebase.
                    // You need to integrate Firebase and use Firebase APIs for this.
                }
            }

            Spacer()

            List(weightEntries, id: \.self) { entry in
                Text(String(entry))
            }
        }
    }
}

extension Color {
    static let lightBlue = Color(red: 103/255, green: 216/255, blue: 255/255)
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}

