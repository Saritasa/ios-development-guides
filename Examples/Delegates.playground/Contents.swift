import UIKit
import PlaygroundSupport

// MARK: - View with delegate example

/// A delegate protocol, which contains events of ListView class
protocol ListViewDelegate: AnyObject {

    /// Event action without any additional parameters
    func listViewDidTapDone(_ view: ListView)

    /// Event action with additional parameters
    func listView(_ view: ListView, didSelectItemAt index: Int)
}

/// A class, which produces some actions
class ListView: UIView {

    /// Declare the public delegate
    weak var delegate: ListViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        // Emit tap action in 1 sec
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.tapDone()
        }

        // Emit select item action in 2 sec
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.selectItemAt(index: 1)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func tapDone() {
        // Call the appropriate delegate method
        delegate?.listViewDidTapDone(self)
    }

    private func selectItemAt(index: Int) {
        // Call the appropriate delegate method
        delegate?.listView(self, didSelectItemAt: index)
    }
}

// MARK: - Delegate implementation example

class SomeViewController: UIViewController {
    /// Initialize view
    private let listView = ListView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Subscribe on view actions by public delegate property
        listView.delegate = self
    }
}

/// Delegate methods implementation for ListView
extension SomeViewController: ListViewDelegate {
    func listViewDidTapDone(_ view: ListView) {
        print("Done tapped!")
    }

    func listView(_ view: ListView, didSelectItemAt index: Int) {
        print("Item selected at: \(index)")
    }
}

// MARK: - Run

PlaygroundPage.current.liveView = SomeViewController()
