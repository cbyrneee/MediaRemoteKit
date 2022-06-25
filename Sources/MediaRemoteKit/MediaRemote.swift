//
// Created by Conor Byrne on 25/06/2022.
//

import Foundation

public struct MediaRemote {
    public static let shared = MediaRemote()

    private init() {
    }

    /**
     Gets the now playing information for any app on the system
     - Returns: A dictionary of keys (String) to their types
     */
    func nowPlayingDictionary() async -> [String: Any] {
        await withCheckedContinuation { continuation in
            MediaRemoteFramework.shared.getNowPlayingInfo(DispatchQueue.main) { result in
                continuation.resume(returning: result)
            }
        }
    }

    /**
     This is a simplified version of the `getNowPlayingInfo` function.
     - Returns: If `MediaRemoteFrameworkKeys.title` is nil, a `nil` object will be returned. Otherwise, a simplified now playing information object
     */
    func nowPlayingInfo() async -> NowPlayingInfo? {
        let information = await nowPlayingDictionary()

        // Title is the only required key, the rest are nullable
        guard let title = information[MediaRemoteFrameworkKeys.title] as? String else {
            return nil
        }

        let startTimestamp = information[MediaRemoteFrameworkKeys.timestamp] as? Date

        var estimatedElapsed: Double? = nil;
        if let startTimestamp = startTimestamp {
            let currentTime = Date().timeIntervalSince1970
            let startTime = startTimestamp.timeIntervalSince1970

            estimatedElapsed = currentTime - startTime
        }

        return NowPlayingInfo(
            title: title,
            artist: information[MediaRemoteFrameworkKeys.artist] as? String,
            album: information[MediaRemoteFrameworkKeys.album] as? String,
            trackNumber: information[MediaRemoteFrameworkKeys.trackNumber] as? Int,
            genre: information[MediaRemoteFrameworkKeys.genre] as? String,
            startTimestamp: startTimestamp,
            duration: information[MediaRemoteFrameworkKeys.duration] as? Double,
            elapsed: information[MediaRemoteFrameworkKeys.elapsed] as? Double,
            estimatedElapsed: estimatedElapsed,
            isMusicApp: information[MediaRemoteFrameworkKeys.isMusicApp] as? Bool ?? false
        )
    }

    /**
     Gets the state of the application that's playing music on the system.
     - Returns: A `PlaybackState` value, or `.unknown` if an error occurred
     */
    func playbackState() async -> PlaybackState {
        await withCheckedContinuation { continuation in
            MediaRemoteFramework.shared.getNowPlayingApplicationPlaybackState(DispatchQueue.main) { result in
                let state = PlaybackState(rawValue: result)
                continuation.resume(returning: state ?? .unknown)
            }
        }
    }
}
