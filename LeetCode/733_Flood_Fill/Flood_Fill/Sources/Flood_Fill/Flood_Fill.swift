public class Solution {
        
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        var outputImage = image
        
        let color = image[sr][sc]
        if color != newColor {
            dfs(&outputImage, sr, sc, color, newColor)
        }
        
        return outputImage
    }
    
    private func dfs(_ image: inout [[Int]], _ r: Int, _ c: Int,_ color: Int, _ newColor: Int) {
        if color == image[r][c] {
            image[r][c] = newColor
            if (r >= 1) { dfs(&image, r - 1, c, color, newColor) }
            if (c >= 1) { dfs(&image, r, c - 1, color, newColor) }
            if (r+1 < image.count) { dfs(&image, r + 1, c, color, newColor) }
            if (c+1 < image[0].count) { dfs(&image, r, c + 1, color, newColor) }
        }
    }
}
