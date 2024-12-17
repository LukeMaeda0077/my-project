import SwiftUI
import AVFoundation

struct SettingsView: View {
    @Binding var isSoundPlaying: Bool
    @Environment(\.presentationMode) var presentationMode
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        VStack {
            Spacer().frame(height: 20)
            
            HStack {
                Toggle("音 On/Off", isOn: $isSoundPlaying)
                    .padding()
                    .onChange(of: isSoundPlaying) { newValue in
                        playToggleSound(isOn: newValue)
                    }
                
                Image(systemName: isSoundPlaying ? "speaker.wave.3.fill" : "speaker.slash.fill")
                    .padding(.trailing)
            }
            
            Spacer()
        }
        .navigationTitle("設定")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("戻る")
                }
            }
        }
    }
    
    private func playToggleSound(isOn: Bool) {
        let soundName = isOn ? "toggle_on" : "toggle_off"
        if let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("音声ファイルの再生に失敗しました: \(error)")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView(isSoundPlaying: .constant(true))
        }
    }
}

#Preview {
    SettingsView(isSoundPlaying: .constant(true))
}
