
//: Playground - noun: a place where people can play

import UIKit

/// It's a snippet. You can drag and drop this line to snippets window for faster closures defination
typealias <#closure type name#> = (<#data types for handling#>) -> (<#returning data type#>)

class SomeItem: NSObject {
    
}

class PopupViewController: UIViewController {
    
    // Sometimes we need to use closures for callbacks handling
    typealias PopupDidSelectItem = (PopupViewController, SomeItem) -> ()
    
    var simpleHandler: PopupDidSelectItem?
    
    fileprivate var handlerWithLifehack: PopupDidSelectItem?
    func setHandlerWithLifehack(handler: @escaping PopupDidSelectItem) {
        handlerWithLifehack = handler
    }
}


class MainViewController: UIViewController {
    
    // closures are very useful becaues they are much easier for reading and understanding in a code
    // we define closures near from initialization code and it's good for reading
    // delegates' functions in another part of file and it's not comfortable for reading beacuse you must scroll file
    
    fileprivate func presentPopover() {
        let popover = PopupViewController()
        
        // but sometimes it's not comfortable setting properties of type closure, because there is no autocomplete
        popover.simpleHandler = { (/* Here we try to remember this closure type */) in
        }
        
        
        // here we can define closure property as private property and setter for this property and then we can use autocomplete!
        popover.setHandlerWithLifehack { (<#PopupViewController#>, <#SomeItem#>) in
            <#code#>
        }
    }
    
}
