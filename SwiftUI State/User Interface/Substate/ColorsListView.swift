import SwiftUI

class ColorsViewModel: ObservableObject {
    @Published var colorNames: [Color] = [
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

    @Published var renderAsColors = false
}

struct ColorsListView: View {
    @StateObject private var viewModel = ColorsViewModel()

    var body: some View {
        List {
            Section {
                ColorsListBodyView(viewModel: viewModel)
            } header: {
                ColorsListHeaderView(viewModel: viewModel)
            }

        }
        .navigationTitle("Colors List")
    }
}

struct ColorsListBodyView: View {
    @ObservedObject var viewModel: ColorsViewModel

    var body: some View {
        ForEach(viewModel.colorNames.shuffled(), id: \.description) { color in
            Text(color.description)
                .foregroundColor(viewModel.renderAsColors ? color : nil)
        }
    }
}

struct ColorsListHeaderView: View {
    @ObservedObject var viewModel: ColorsViewModel

    var body: some View {
        Toggle("Toggle Color Mode", isOn: $viewModel.renderAsColors)
    }
}
