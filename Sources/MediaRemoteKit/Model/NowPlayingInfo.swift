//
// Created by Conor Byrne on 25/06/2022.
//

import Foundation

public struct NowPlayingInfo {
    public let title: String
    public let artist: String?
    public let album: String?

    public let trackNumber: Int?
    public let genre: String?

    public let startTimestamp: Date?
    public let duration: Double?

    /// This is bugged in MediaRemote and only gets updated when the track is paused and played again
    public let elapsed: Double?

    /// This is populated by MediaRemoteKit, and might be inaccurate
    public let estimatedElapsed: Double?

    public let isMusicApp: Bool
}
