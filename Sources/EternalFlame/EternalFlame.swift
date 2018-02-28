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
                for (index,frame) in  self.frames.enumerated() {
                    let fractionCompleted :Float32 = Float32((index + 1) / self.frames.count)
                    let d = self.easeInOut(t: fractionCompleted) * Float32(self.delay)
                    UpdateCLI(msg: "\(frame)", delay: UInt32(d) )
                }
            }
        }
    }



    // Stops the Animation
    public func takeLife() {
        self.isRunnig = false
    }

    // Easing takes value b/w 0,1
    private func easeInOut(t:Float32) -> Float32 {
       return t < 0.5 ? 4*t*t*t : (t-1)*(2*t-2)*(2*t-2)+1
    }

}
public enum Flametype {
    case ease
    case linear
}
