//
//  SettingsView.swift
//  SettingApp
//
//  Created by Hajime Maeda on 2024/12/17.
//
// 【SwiftUI】フォントの指定方法（font）
// https://capibara1969.com/1981/#toc2

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer?
    @State private var isSoundPlaying = false
    private let defaultImageName = "speaker.wave.3.fill"
    private let defaultImageSize: CGFloat = 150.0

    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 50)
                
                Text("サウンド設定サンプル")
                    //.font(.system(size: 30))
                    .font(.system(size: 35, weight: .black, design: .default))
                    .padding(.bottom, 10)
                
                // 音量アイコンの表示
                HStack {
                    Spacer()
                    Image(systemName: isSoundPlaying ? "speaker.wave.3.fill" : "speaker.slash.fill") // isSoundPlayingに応じた画像を表示
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200) // 画像を大きく表示
                    Spacer()
                }
                .padding(.bottom, 20)

                Button(action: {
                    playSound()
                }) {
                    HStack {
                        Text("Play Sound")
                            .font(.system(size: 30, weight: .black, design: .default))
                        Image(systemName: isSoundPlaying ? "speaker.wave.3.fill" : "speaker.slash.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50) // 画像を大きく表示
                    }
                }
                .padding(.bottom, 20)
                
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
                isSoundPlaying = UserDefaults.standard.bool(forKey: "isSoundPlaying") // 起動時に保存された状態を読み込む
            }
        }
    }
    
    private func playSound() {
        if isSoundPlaying {
            audioPlayer?.play()
        }
    }
    
    private func getImageName() -> String {
        let imageName = UserDefaults.standard.string(forKey: "imageName") ?? defaultImageName
        print("Image Name: \(imageName)") // デバッグ用に画像名を出力
        return imageName
    }
    
    private func getImageSize() -> CGFloat {
        return CGFloat(UserDefaults.standard.float(forKey: "imageSize")) ?? defaultImageSize
    }
}

#Preview {
    ContentView()
}
