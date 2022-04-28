import SwiftUI

struct OOvsSOView: View {
    @State private var buttonColor: Color?

    var body: some View {
        VStack(spacing: 20) {
            SuperCoolButtonView {
                buttonColor = randomColor()
            }
            .foregroundColor(buttonColor)

            VStack {
                Text("With ObservedObject")
                    .font(.body.monospaced())
                ObservedObjectCounterView()
            }

            VStack {
                Text("With StateObject")
                    .font(.body.monospaced())
                StateObjectCounterView()
            }
        }
        .navigationTitle("OO vs SO")
    }

    func randomColor() -> Color {
        Color.all.shuffled().first { $0 != buttonColor } ?? .primary
    }
}

struct OOvsSOView_Previews: PreviewProvider {
    static var previews: some View {
        OOvsSOView()
    }
}
