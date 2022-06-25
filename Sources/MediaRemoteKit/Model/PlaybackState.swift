//
// Created by Conor Byrne on 26/06/2022.
//

import Foundation

/**
 The state of the application's playback
 */
enum PlaybackState: Int {
    /// The state couldn't be retrieved
    case unknown = 0

    /// The application is playing music
    case playing

    /// The user has paused the playback
    case paused

    /// The playback has been stopped (i.e. the queue has ended)
    case stopped

    /// The playback has been interrupted (i.e. an error occurred)
    case interrupted
}
