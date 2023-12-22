import SwiftUI

public protocol ViewDisplayable: Identifiable, Hashable {
    associatedtype ViewType: View

    var id: UUID { get }
    var viewToDisplay: ViewType { get }
}

extension ViewDisplayable {
    public var id: UUID { .init() }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
