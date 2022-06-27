//
// Created by Conor Byrne on 25/06/2022.
//

import Foundation

struct MediaRemoteFramework {
    public static let shared = try! MediaRemoteFramework()
    private static let bundle = CFBundleCreate(
        kCFAllocatorDefault,
        NSURL(fileURLWithPath: "/System/Library/PrivateFrameworks/MediaRemote.framework")
    )

    let getNowPlayingInfo: @convention(c) (DispatchQueue, @escaping ([String: Any]) -> Void) -> Void
    let getNowPlayingApplicationPlaybackState: @convention(c) (DispatchQueue, @escaping (Int) -> Void) -> Void

    private init() throws {
        let getNowPlayingInfoPointer = try MediaRemoteFramework.getPointer(for: "MRMediaRemoteGetNowPlayingInfo")
        getNowPlayingInfo = MediaRemoteFramework.defineFunction(pointer: getNowPlayingInfoPointer)

        let getNowPlayingApplicationPlaybackStatePointer = try MediaRemoteFramework.getPointer(
            for: "MRMediaRemoteGetNowPlayingApplicationPlaybackState"
        )
        getNowPlayingApplicationPlaybackState = MediaRemoteFramework.defineFunction(
            pointer: getNowPlayingApplicationPlaybackStatePointer
        )
    }

    private static func getPointer(for name: String) throws -> UnsafeMutableRawPointer {
        guard let pointer = CFBundleGetDataPointerForName(bundle, name as NSString) else {
            throw MediaRemoteFrameworkError.failedToGetFunctionPointer
        }

        return pointer
    }

    private static func defineFunction<T>(pointer: UnsafeMutableRawPointer) -> T {
        unsafeBitCast(pointer, to: T.self)
    }
}
