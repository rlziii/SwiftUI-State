class NetworkManager {
    let cache: CacheManager

    init(cache: CacheManager) {
        self.cache = cache
    }

    func login(username: String, password: String) async throws -> Bool {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return password == "password"
    }
}
