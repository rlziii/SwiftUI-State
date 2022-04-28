import SwiftUI

struct ChaptersListView: View {
    @EnvironmentObject var networkManager: NetworkManager
    @StateObject private var viewModel = ChaptersListViewModel()

    var body: some View {
        Group {
            if viewModel.chapters.isEmpty {
                Text("Tap \(Image(systemName: "plus")) to add chapters.")
            } else {
                List(viewModel.chapters) { chapter in
                    VStack {
                        Text(chapter.title)
                            .font(.title2)
                            .multilineTextAlignment(.center)

                        Text(chapter.preview)
                            .lineLimit(2)
                            .font(.headline)
                    }.padding(.vertical)
                }
            }
        }
        .navigationTitle("Chapters")
        .toolbar {
            ToolbarItemGroup {
                Button {
                    Task { await viewModel.loadNextChapter() }
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
        .onAppear {
            viewModel.networkManager = networkManager
        }
    }
}

struct ChaptersListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChaptersListView()
                .environmentObject(NetworkManager())
        }
    }
}
