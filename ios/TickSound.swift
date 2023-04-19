import Foundation;
import AVFoundation
import UIKit

import AudioToolbox.AudioServices;

@objc(TickSound)
class TickSound: NSObject {
    
    var player: AVAudioPlayer?
    
    @objc(playSound:)
    func playSound(rate: NSInteger) -> Void {
        if let asset = NSDataAsset(name: "beep") {
            do {
                player = try AVAudioPlayer(data:asset.data);
                player?.enableRate = true;
                player?.prepareToPlay();
                player?.rate = Float(truncating: rate as NSNumber);
                player?.play();
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        } else {
            print("Not Found")
        }
    }
    
    @objc(stopSound)
    func stopSound() -> Void {
        if ((player) != nil) {
            player?.stop();
        }
    }
    
}
