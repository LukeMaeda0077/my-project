//
//  SettingsView.swift
//  SettingApp
//
//  Created by Hajime Maeda on 2024/12/17.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer?
    @State private var isSoundPlaying = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 50) // 上部にスペースを追加してボタンを下に移動
                
                Text("サウンド設定画面サンプル")
                    .font(.system(size: 30))
                    .padding(.bottom, 10)
                
                Button(action: {
                    playSound()
                }) {
                    HStack {
                        Text("Play Sound")
                        Image(systemName: isSoundPlaying ? "speaker.wave.3.fill" : "speaker.slash.fill")
                    }
                }
                .padding(.bottom, 20) // ボタンの下にスペースを追加
                
                Spacer()
                
                HStack {
                    Spacer()
                    NavigationLink(destination: SettingsView(isSoundPlaying: $isSoundPlaying)) {
                        Image(systemName: "gearshape.fill")
                            .imageScale(.large)
                            .padding()
                    }
                }
            }
            .padding()
            .onAppear {
                audioPlayer = setupAudioPlayer(withResource: "sound", ofType: "mp3")
            }
        }
    }
    
    private func playSound() {
        if isSoundPlaying {
            audioPlayer?.play()
        }
    }
}

#Preview {
    ContentView()
}
