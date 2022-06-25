//
// Created by Conor Byrne on 25/06/2022.
//

import Foundation

enum MediaRemoteFrameworkKeys: String {
    /// The title of the track
    case title = "kMRMediaRemoteNowPlayingInfoTitle"

    /// The artist of the track
    case artist = "kMRMediaRemoteNowPlayingInfoArtist"

    /// The album the track belongs to
    case album = "kMRMediaRemoteNowPlayingInfoAlbum"

    /// The track's number in the queue
    case trackNumber = "kMRMediaRemoteNowPlayingInfoTrackNumber"

    /// The genre of the track
    case genre = "kMRMediaRemoteNowPlayingInfoGenre"

    /// If the music source is the Apple Music application
    case isMusicApp = "kMRMediaRemoteNowPlayingInfoIsMusicApp"

    /// The time that the current track started at
    case timestamp = "kMRMediaRemoteNowPlayingInfoTimestamp"

    /// The amount of time in seconds that has elapsed in the track's playback
    case elapsed = "kMRMediaRemoteNowPlayingInfoElapsedTime"

    /// The duration of the track in seconds
    case duration = "kMRMediaRemoteNowPlayingInfoDuration"
}

extension Dictionary where Key: ExpressibleByStringLiteral {
    subscript(key: MediaRemoteFrameworkKeys) -> Value? {
        get {
            self[key.rawValue as! Key]
        }

        set {
            self[key.rawValue as! Key] = newValue
        }
    }
}
