import UIKit

/// Main purpose of this class is to override `backgroundColor` property and not set it,
/// instead provide `specialBackgroundColor` property and set `backgroundColor` there.
/// That way we prevent changing background color by iOS in some cases, for example cells on selection.
class SpecialBackgroundColorView: UIView {

    /// This property doesn't change background color of the view.
    /// Use `specialBackgroundColor` instead.
    override var backgroundColor: UIColor? {
        set {

        }
        get {
            return super.backgroundColor
        }
    }

    /// Background color of this view.
    var specialBackgroundColor: UIColor? {
        set {
            super.backgroundColor = newValue
        }
        get {
            return super.backgroundColor
        }
    }
}
