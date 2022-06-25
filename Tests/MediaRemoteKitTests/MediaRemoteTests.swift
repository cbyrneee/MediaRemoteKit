//
// Created by Conor Byrne on 25/06/2022.
//

import Foundation
import XCTest
@testable import MediaRemoteKit

class MediaRemoteTests : XCTestCase {
    func testNowPlayingDictionary() async {
        let information = await MediaRemote.shared.nowPlayingDictionary()
        print("Dictionary: \(String(describing: information))")
    }

    func testNowPlayingInfo() async {
        let information = await MediaRemote.shared.nowPlayingInfo()
        print("Information: \(String(describing: information))")
    }

    func testPlaybackState() async {
        let state = await MediaRemote.shared.playbackState()
        print("State: \(state)")
    }
}