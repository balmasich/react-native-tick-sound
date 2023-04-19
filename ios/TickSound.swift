import Foundation;
import AVFoundation
import UIKit

import AudioToolbox.AudioServices;

@objc(TickSound)
class TickSound: NSObject {
    
    var player: AVAudioPlayer?
    
    @objc(playTickSound:)
    func playTickSound(soundID: NSInteger) -> Void {
        AudioServicesPlaySystemSound(SystemSoundID(soundID));
    }
    
    @objc(stopTickSound)
    func stopTickSound() -> Void {

    }

    @objc(playSound)
    func playSound() -> Void {
        if let asset = NSDataAsset(name: "TagSound") {
            do {
                player = try AVAudioPlayer(data:asset.data, fileTypeHint:"wav")
                player?.play()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}
