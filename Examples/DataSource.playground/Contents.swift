
// MARK: - Data source pattern example

/// Data source protocol for PetsEnumerator
protocol PetsEnumeratorDataSource: AnyObject {
    /// Gets the number of items in data source
    func numberOfItems(in enumerator: PetsEnumerator) -> Int
    /// Gets the item by index
    func petsEnumerator(_ enumerator: PetsEnumerator, itemForIndex index: Int) -> String
}

/// A class to enumerate pets from array
class PetsEnumerator {

    /// Data source instance
    weak var dataSource: PetsEnumeratorDataSource?

    /// Enumerates pets from data source
    func enumerate() {
        // Get the data source
        guard let source = dataSource else {
            print("Data source is not implemented!")
            return
        }

        // Get number of pets
        let count = source.numberOfItems(in: self)

        for index in 0..<count {
            // Get the pet by index
            let value = source.petsEnumerator(self, itemForIndex: index)
            print("Value: \(value)")
        }
    }
}

// MARK: - Data source implementation example

class PetsSource {

    /// Initialize enumerator
    let enumerator = PetsEnumerator()
    /// Initialize pets array
    let pets: [String] = ["Doge", "Good Boyo", "Bad Boyo"]

    /// Starts the enumeration
    func start() {
        // Attach data source
        enumerator.dataSource = self
        // Start enumeration
        enumerator.enumerate()
    }
}

/// Implement data source protocol
extension PetsSource: PetsEnumeratorDataSource {
    func numberOfItems(in enumerator: PetsEnumerator) -> Int {
        // Pass number of pets
        return pets.count
    }

    func petsEnumerator(_ enumerator: PetsEnumerator, itemForIndex index: Int) -> String {
        // Pass pet for index
        return pets[index]
    }
}

// MARK: - Run

let source = PetsSource()
source.start()
