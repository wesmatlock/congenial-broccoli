import SwiftUI

public struct RoutingView<RootView: View, Routes: ViewDisplayable>: View {
    @StateObject private var router: Router<Routes> = .init()
    private let rootView: (Router<Routes>) -> RootView
    
    public init(_ routeType: Routes.Type, @ViewBuilder rootView: @escaping (Router<Routes>) -> RootView) {
        self.rootView = rootView
    }


    public var body: some View {
        NavigationStack(path: $router.path) {
            rootView(router)
                .navigationDestination(for: Router<Routes>.Destination.self) {
                    $0.viewToDisplay
                        .environmentObject(router)
                }
        }
    }
}
