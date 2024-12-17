import AVFoundation

func setupAudioPlayer(withResource resource: String, ofType type: String) -> AVAudioPlayer? {
    if let soundURL = Bundle.main.url(forResource: resource, withExtension: type) {
        do {
            return try AVAudioPlayer(contentsOf: soundURL)
        } catch {
            print("Failed to initialize audio player: \(error)")
        }
    }
    return nil
} 