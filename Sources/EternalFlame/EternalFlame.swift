import Foundation
import Eraser

public class EternalFlame {
    var frames:[String];
    var delay:UInt32;
    var msg:String;
    var isRunnig:Bool = false;
    var type:Flametype;
    let queue = DispatchQueue(label: "EternalFlame")
    
    public init(frames:[String],delay:UInt32,msg:String,type:Flametype) {
        self.frames = frames
        self.msg = msg
        self.delay = delay
        self.type = type
        
    }

    // starts the animations
    public func giveLife() {
        self.isRunnig = true
        queue.async {
            while self.isRunnig {
                for (index,frame) in  self.frames.enumerated() {
                    var d:Float32
                    switch self.type {
                    case .ease:
                        let fractionCompleted :Float32 = Float32((index + 1)) / Float32(self.frames.count)
                        d = self.easeInOut(t: fractionCompleted) * Float32(self.delay)
                    case .linear:
                        d = Float32(self.delay)
                    }

                    UpdateCLI(msg: "\(frame) \(self.msg)", delay: UInt32(d) )
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

// Animation Type
public enum Flametype {
    case ease
    case linear
}
