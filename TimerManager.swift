import SwiftUI
import Foundation
import AVFoundation

class TimerManager: ObservableObject {
    @Published var timerMode: TimerMode = .initial
    @Published var secondsLeft = UserDefaults.standard.integer(forKey: "timerLength")
    var timer = Timer()
    //音声ファイル管理機能
    var soundPath = Bundle.main.bundleURL.appendingPathComponent("Alert3.mp3")
    //音鳴らす機能
    var soundPlayer = AVAudioPlayer()
    
    func soundPlay(_ sender: Any) {
        do{
            //音声ファイルを音鳴らす機能に取り込む
            soundPlayer = try AVAudioPlayer(contentsOf: soundPath, fileTypeHint: nil)
            //音鳴らす
            soundPlayer.play()
            
        } catch {
//            print{"エラー発生しました"}
        }
    }
    
    func start() {
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {  timer in if self.secondsLeft == 0 {
            self.pause()
            //アラーム音鳴らす
            self.soundPlay(self.soundPath)
            timer.invalidate()
            return
        }
            self.secondsLeft -= 1
        })
    }
    
    func setTimerLength(minutes: Int) {
        let defaults = UserDefaults.standard
        defaults.set(minutes, forKey: "timerLength")
        secondsLeft = minutes
    }
    
    func reset() {
        soundPlayer.pause()
        self.timerMode = .initial
        self.secondsLeft = UserDefaults.standard.integer(forKey: "timerLength")
        timer.invalidate()
    }
    
    func pause() {
        soundPlayer.pause()
        self.timerMode = .paused
        timer.invalidate()
    }
}
