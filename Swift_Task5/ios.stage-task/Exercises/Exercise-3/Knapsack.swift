import Foundation

public typealias Supply = (weight: Int, value: Int)

public final class Knapsack {
    let maxWeight: Int
    let drinks: [Supply]
    let foods: [Supply]
    var maxKilometers: Int {
        findMaxKilometres()
    }
    
    init(_ maxWeight: Int, _ foods: [Supply], _ drinks: [Supply]) {
        self.maxWeight = maxWeight
        self.drinks = drinks
        self.foods = foods
    }
    
    func findMaxKilometres() -> Int {
        guard maxWeight > 0, maxWeight <= 2500 else { return 0 }
        
        var total = 0
        let foods = get(foods)
        let drinks = get(drinks)
        
        for i in 0 ... maxWeight {
            total = max(total, min(foods[self.foods.count][i],
                                   drinks[self.drinks.count][maxWeight - i]))
        }
        
        return total
    }
    
    // MARK: - Private methods
    
    private func get(_ items: [Supply]) -> [[Int]] {
        var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: maxWeight + 1),
                                    count: items.count + 1)
        
        for i in 0 ... items.count {
            for j in 0 ... maxWeight {
                if i != 0, j != 0 {
                    if items[i - 1].weight > j {
                        matrix[i][j] = matrix[i - 1][j]
                    } else {
                        matrix[i][j] = max(matrix[i - 1][j],
                                           items[i - 1].value + matrix[i - 1][j - items[i - 1].weight])
                    }
                }
            }
        }
        
        return matrix
    }
}
