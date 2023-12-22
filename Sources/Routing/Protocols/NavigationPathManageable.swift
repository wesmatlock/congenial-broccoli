import SwiftUI

public protocol NavigationPathManageable: ObservableObject {
    associatedtype Destination: ViewDisplayable

    var path: NavigationPath { get set }

    func pop(_ count: Int)
    func popToRoot()
    func push(_ destination: Destination)
    func push(_ destinations: [Destination])
}

extension NavigationPathManageable {
    /// Removed the specific number of destinations from the navigation path
    /// - Parameter count: The number of views to be popped from the navigation path
    public func pop(_ count: Int = 1) {
        guard count <= path.count else {
            path = .init()
            return
        }

        path.removeLast(count)
    }

    /// Resets the navigation path to its initial value
    public func popToRoot() {
        path = .init()
    }

    /// Pushes a new view into the navigation path
    /// - Parameter destination: The view to be pushed onto the navigation path
    public func push(_ destination: Destination) {
        path.append(destination)
    }

    /// Pushed multiple views onto the navigation path
    /// - Parameter destinations: The views to be pushed onto the navigation path
    public func push(_ destinations: [Destination]) {
        for destination in destinations {
            path.append(destination)
        }
    }
}
