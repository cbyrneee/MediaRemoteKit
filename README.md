# MediaRemoteKit

A Swift wrapper for the MediaRemote Private Framework.

## Usage

```swift
import MediaRemoteKit

func printTrackInformation() async {
    guard let information = await MediaRemote.shared.nowPlayingInfo() else {
        print("Not playing anything!")
        return
    }
    
    print("\(information.title) by \(information.artist)")
}
```

## License
This project is licensed under the [MIT](https://choosealicense.com/licenses/mit/) license.