// Grid point definition
struct Point {
    var row: Int
    var column: Int
}

/*
private func minimumStepsInGrid(_ currentPoint: Point,
                                _ endPoint: Point,
                                _ grid: [[Int]],
                                _ stepsCache: inout [[Int]]) -> Int {

    let x = currentPoint.x
    let y = currentPoint.y

    print("Walk to x:\(x), y:\(y)")

    if x == endPoint.x, y == endPoint.y {
        return 0
    }

    if x >= grid.count || y >= grid[x].count {
        return 0
    }

    if stepsCache[x][y] != -1 {
        return stepsCache[x][y]
    }

    let valueUpper = minimumStepsInGrid(Point(x: x, y: y + 1), endPoint, grid, &stepsCache)
    let valueLower = minimumStepsInGrid(Point(x: x, y: y - 1), endPoint, grid, &stepsCache)
    let valueLeft = minimumStepsInGrid(Point(x: x + 1, y: y), endPoint, grid, &stepsCache)
    let valueRight = minimumStepsInGrid(Point(x: x - 1, y: y), endPoint, grid, &stepsCache)

    let minimumSteps = 1 + min(min(valueUpper, valueLower), min(valueLeft, valueRight))
    stepsCache[x][y] = minimumSteps

    return minimumSteps
}
 */

func findMinStepsFrom(start: Point, toEnd end: Point, inGrid grid: [[Int]]) -> Int {

    let rowCount = grid.count
    let columnCount = grid[0].count
    
    // Create visited grid
    var visitedGrid = [[Bool]]()
    for _ in 0..<rowCount {
        visitedGrid.append(Array(repeating: false, count: columnCount))
    }
    
    // Create step count grid
    var stepCountGrid = [[Int?]]()
    for _ in 0..<rowCount {
        stepCountGrid.append(Array(repeating: nil, count: columnCount))
    }
    stepCountGrid[start.row][start.column] = 1
    
    // Start to visit all possible grid
    var queue = [Point]()
    queue.append(start)
    
    while (queue.count > 0) {
        // Pop first element
        let pivot = queue.first!
        queue.removeFirst()
        
        // Check if pivot element is visited
        if true == visitedGrid[pivot.row][pivot.column] {
            // If it is alread visited, continue the loop
            continue
        }
        
        visitedGrid[pivot.row][pivot.column] = true
        debugPrint("[Debug] Visiting pivot, row: \(pivot.row), column: \(pivot.column)")
        
        if pivot.row == end.row && pivot.column == end.column {
            break
        }
        
        let pivotStep = stepCountGrid[pivot.row][pivot.column]!
        
        // If it was not visited, set steps on its adjacent grid point
        // Can go to upper
        if pivot.row - 1 >= 0 {
            let nextPivot = Point(row: pivot.row - 1, column: pivot.column)
            if let nextStep = stepCountGrid[nextPivot.row][nextPivot.column] {
                if pivotStep + 1 < nextStep {
                    stepCountGrid[nextPivot.row][nextPivot.column] = pivotStep + 1
                    queue.append(nextPivot)
                }
            }
            else {
                stepCountGrid[nextPivot.row][nextPivot.column] = pivotStep + 1
                queue.append(nextPivot)
            }
        }
        
        // Can go to lower
        if pivot.row + 1 < rowCount {
            let nextPivot = Point(row: pivot.row + 1, column: pivot.column)
            if let nextStep = stepCountGrid[nextPivot.row][nextPivot.column] {
                if pivotStep + 1 < nextStep {
                    stepCountGrid[nextPivot.row][nextPivot.column] = pivotStep + 1
                    queue.append(nextPivot)
                }
            }
            else {
                stepCountGrid[nextPivot.row][nextPivot.column] = pivotStep + 1
                queue.append(nextPivot)
            }
        }
        
        // Can go to left
        if pivot.column - 1 >= 0 {
            let nextPivot = Point(row: pivot.row, column: pivot.column - 1)
            if let nextStep = stepCountGrid[nextPivot.row][nextPivot.column] {
                if pivotStep + 1 < nextStep {
                    stepCountGrid[nextPivot.row][nextPivot.column] = pivotStep + 1
                    queue.append(nextPivot)
                }
            }
            else {
                stepCountGrid[nextPivot.row][nextPivot.column] = pivotStep + 1
                queue.append(nextPivot)
            }
        }
        
        // Can go to right
        if pivot.column + 1 < columnCount {
            let nextPivot = Point(row: pivot.row, column: pivot.column + 1)
            if let nextStep = stepCountGrid[nextPivot.row][nextPivot.column] {
                if pivotStep + 1 < nextStep {
                    stepCountGrid[nextPivot.row][nextPivot.column] = pivotStep + 1
                    queue.append(nextPivot)
                }
            }
            else {
                stepCountGrid[nextPivot.row][nextPivot.column] = pivotStep + 1
                queue.append(nextPivot)
            }
        }
        
    }
    
    return stepCountGrid[end.row][end.column]!
}
