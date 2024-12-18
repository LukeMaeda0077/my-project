//
//  SettingsView.swift
//  SettingApp
//
//  Created by Hajime Maeda on 2024/12/17.
//

import SwiftUI
import AVFAudio

struct SettingsView: View {
    @Binding var isSoundPlaying: Bool
    @Environment(\.presentationMode) var presentationMode
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        VStack {
            Spacer().frame(height: 20)
            
            HStack {
                Toggle("音 On/Off", isOn: $isSoundPlaying)
                    .font(.system(size: 30, weight: .black, design: .default))
                    .padding()
                    .onChange(of: isSoundPlaying) { newValue in
                        playToggleSound(isOn: newValue)
                        UserDefaults.standard.set(newValue, forKey: "isSoundPlaying") // 設定を保存
                    }
                
                Image(systemName: isSoundPlaying ? "speaker.wave.3.fill" : "speaker.slash.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40) // 画像を大きく表示
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
                        .font(.system(size: 25, weight: .black, design: .default))
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
