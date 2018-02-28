import Foundation
import Eraser

public class EternalFlame {
    var frames:[String];
    var delay:UInt32;
    var isRunnig:Bool = false;
    let queue = DispatchQueue(label: "EternalFlame")
    public init(frames:[String],delay:UInt32) {
        self.frames = frames
        self.delay = delay
    }

    // starts the animations
    public func giveLife() {
        self.isRunnig = true
        queue.async {
            while self.isRunnig {
                for frame in self.frames {
                    UpdateCLI(msg: "\(frame)", delay: self.delay)
                }
            }
        }
    }



    // Stops the Animation
    public func takeLife() {
        self.isRunnig = false
    }

}
