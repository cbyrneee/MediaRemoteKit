//
// Created by Conor Byrne on 25/06/2022.
//

import Foundation

public struct NowPlayingInfo {
  let title: String
  let artist: String?
  let album: String?

  let trackNumber: Int?
  let genre: String?

  let startTimestamp: Date?
  let duration: Double?

  /// This is bugged in MediaRemote and only gets updated when the track is paused and played again
  let elapsed: Double?

  /// This is populated by MediaRemoteKit, and might be inaccurate
  let estimatedElapsed: Double?

  let isMusicApp: Bool
}
