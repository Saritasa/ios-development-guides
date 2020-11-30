import Foundation

// MARK: - Public optional delegate example

/// A delegate protocol, which contains events of Actor1 class
protocol Actor1Delegate: AnyObject {

    /// Event action without any additional parameters
    func actor1DidSomething(_ actor: Actor1)

    /// Event action with additional parameters
    func actor1(_ actor: Actor1, didSomethingWithValue value: Int)
}

/// Actor class, which produces some actions
class Actor1: NSObject {

    /// Declare the public delegate
    weak var delegate: Actor1Delegate?

    override init() {
        super.init()

        /// Emit some action in 1 sec
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.doSomething()
        }

        /// Emit another action in 2 sec
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.doSomethingWithValue(value: 1)
        }
    }

    private func doSomething() {
        /// Call the appropriate delegate method
        delegate?.actor1DidSomething(self)
    }

    private func doSomethingWithValue(value: Int) {
        /// Call the appropriate delegate method
        delegate?.actor1(self, didSomethingWithValue: value)
    }
}

// MARK: - Private optional delegate example

/// A delegate protocol, which contains events of Actor2 class
protocol Actor2Delegate: AnyObject {
    /// Event action without any additional parameters
    func actor2DidSomething(_ actor: Actor2)
}

class Actor2: NSObject {

    /// Declare the private delegate
    private weak var delegate: Actor2Delegate?

    override init() {
        super.init()

        /// Emit the action in 3 sec
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            self?.doSomething()
        }
    }

    /// Public method with delegate parameter
    func subscribeOn(delegate: Actor2Delegate) {
        self.delegate = delegate
    }

    private func doSomething() {
        /// Call the appropriate delegate method
        delegate?.actor2DidSomething(self)
    }
}

// MARK: - Delegate implementation

class Adopter: NSObject {

    /// Initialize actors
    private let actor1 = Actor1()
    private let actor2 = Actor2()

    func start() {
        // Subscribe on actor1 actions by public delegate property
        actor1.delegate = self
        // Subscribe on actor2 actions through public method (delegate is still private)
        actor2.subscribeOn(delegate: self)
    }

}

/// Delegate implementation for Actor1
extension Adopter: Actor1Delegate {
    func actor1DidSomething(_ actor: Actor1) {
        print("Actor1 did something")
    }

    func actor1(_ actor: Actor1, didSomethingWithValue value: Int) {
        print("Actor1 did something with value: \(value)")
    }
}

/// Delegate implementation for Actor2
extension Adopter: Actor2Delegate {
    func actor2DidSomething(_ actor: Actor2) {
        print("Actor2 did something")
    }
}

// MARK: - Run

let adopter = Adopter()
adopter.start()
