import SwiftUI

struct SuperCoolButtonView: View {
    @State private var buttonColor: Color?
    var body: some View {
        VStack(spacing: 20) {
            Button {
                buttonColor = randomColor()
            } label: {
                HStack {
                    Image(systemName: "star")
                    Text("Super Cool Button")
                    Image(systemName: "star")
                }
                .font(.title)
                .foregroundColor(buttonColor)
            }

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
        .navigationBarTitleDisplayMode(.inline)
    }

    func randomColor() -> Color {
        let colors: [Color] = [
            .blue,
            .brown,
            .cyan,
            .gray,
            .green,
            .indigo,
            .mint,
            .orange,
            .pink,
            .purple,
            .red,
            .teal,
            .yellow,
        ]

        return colors.shuffled().first { $0 != buttonColor } ?? .primary
    }
}

struct SuperCoolButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SuperCoolButtonView()
    }
}
