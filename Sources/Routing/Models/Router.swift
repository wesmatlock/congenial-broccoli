import SwiftUI

public final class Router<Routes: ViewDisplayable>: NavigationPathManageable {
    public typealias Destination = Routes

    @Published public var path: NavigationPath = .init()
}
