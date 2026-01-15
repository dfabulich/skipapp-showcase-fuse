//
//  AudioPlayerPlayground.swift
//  skipapp-showcase-fuse
//
//  Created by Dan Fabulich on 1/15/26.
//

import SwiftUI
#if canImport(SkipAV)
import SkipAV
#else
import AVKit
#endif

struct AudioPlayerPlayground: View {
    let audioPlayer = try? AVAudioPlayer(contentsOf: URL(string: "https://dare.wisc.edu/wp-content/uploads/sites/1051/2017/08/HI009clip.mp3")!)
    var body: some View {
        Text("Hello, World!")
            .task {
                logger.log("creating delegate")
                let delegate = AudioPlayerDelegate()
                logger.log("setting delegate")
                audioPlayer?.delegate = delegate
                logger.log("playing")
                audioPlayer?.play()
            }
    }
}

class AudioPlayerDelegate: NSObject, AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("Finished playing")
    }
}
