# EternalFlame 🔥🔥
Give life 😇To Dead 💀Terminal with EternalFlame 🔥
## ⚙️ Installation

```swift
import PackageDescription

let package = Package(
    name: "MyPackage",
    dependencies: [
        .package(url: "http://github.com/aniket965/EternalFlame.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "MyPackage",
            dependencies: ["EternalFlame"]
        )
    ]
)
```
## 📗 Usage
```swift
import EternalFlame

let flame = EternalFlame(frames:["🌎 ","🌏 ","🌍 "],delay:100000)
flame.giveLife()
sleep(3)
flame.takeLife()

```
