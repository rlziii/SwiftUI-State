import Foundation

actor NetworkManager: ObservableObject {
    func fetchChapter(for id: Int) async -> ChapterInfo? {
        // Wait for 0.25 seconds.
        try? await Task.sleep(nanoseconds: 250_000_000)

        if ChapterInfo.previews.indices.contains(id - 1) {
            return ChapterInfo.previews[id - 1]
        } else {
            return nil
        }
    }
}
