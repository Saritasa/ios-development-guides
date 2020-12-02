import UIKit
import PlaygroundSupport

// MARK: - Data source pattern example

/// Data source protocol for AnimalsDrawerView
protocol AnimalsDrawerViewDataSource: AnyObject {
    /// Gets the number of items in data source
    func numberOfAnimals(in view: AnimalsDrawerView) -> Int
    /// Gets the item by index
    func animalsDrawerView(_ view: AnimalsDrawerView, animalForIndex index: Int) -> String
}

/// A class to draw animals from source
class AnimalsDrawerView: UIView {

    /// Data source instance
    weak var dataSource: AnimalsDrawerViewDataSource?

    /// Draws animals from data source
    func drawAnimals() {
        // Get the data source
        guard let source = dataSource else {
            print("Data source is not implemented!")
            return
        }

        // Get number of animals
        let count = source.numberOfAnimals(in: self)

        for index in 0..<count {
            // Get the animal by index
            let animal = source.animalsDrawerView(self, animalForIndex: index)
            drawAnimal(animal)
        }
    }

    private func drawAnimal(_ animal: String) {
        print("Draw animal: \(animal)")
    }
}

// MARK: - Data source implementation example

/// A class, which contains animals data for drawing
class AnimalsViewController: UIViewController {

    /// Initialize drawer view
    let drawerView = AnimalsDrawerView()
    /// Initialize animals array
    let animals: [String] = ["Doge", "Cato"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Attach data source
        drawerView.dataSource = self
        // Start drawing
        drawerView.drawAnimals()
    }
}

/// Implement data source protocol
extension AnimalsViewController: AnimalsDrawerViewDataSource {
    func numberOfAnimals(in view: AnimalsDrawerView) -> Int {
        return animals.count
    }

    func animalsDrawerView(_ view: AnimalsDrawerView, animalForIndex index: Int) -> String {
        return animals[index]
    }
}

// MARK: - Run

PlaygroundPage.current.liveView = AnimalsViewController()
