import SwiftUI

class ChaptersListViewModel: ObservableObject {
    @Published var chapters: [ChapterInfo] = []
    var networkManager: NetworkManager?

    @MainActor @Sendable
    func loadNextChapter() async {
        if let chapter = await networkManager?.fetchChapter(for: chapters.count + 1) {
            withAnimation {
                chapters.append(chapter)
            }
        }
    }
}
