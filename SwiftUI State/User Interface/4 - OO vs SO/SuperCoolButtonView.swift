import SwiftUI

struct SuperCoolButtonView: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "star")
                Text("Super Cool Button")
                Image(systemName: "star")
            }
            .font(.title)
        }
    }
}

struct SuperCoolButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SuperCoolButtonView(action: {})
    }
}
