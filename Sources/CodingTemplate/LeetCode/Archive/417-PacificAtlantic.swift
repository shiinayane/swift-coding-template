class Solution417 {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        let rows = heights.count
        let cols = heights[0].count
        let directions = [
            (1, 0),
            (-1, 0),
            (0, 1),
            (0, -1)
        ]
        
        var pacific = Array(repeating: Array(repeating: false, count: cols), count: rows)
        var atlantic = pacific
        
        func dfs(_ r: Int, _ c: Int, _ visited: inout [[Bool]]) {
            visited[r][c] = true
            
            for (dr, dc) in directions {
                let nr = r + dr
                let nc = c + dc
                
                if nr < 0 || nr >= rows || nc < 0 || nc >= cols ||
                    visited[nr][nc] ||
                    heights[nr][nc] < heights[r][c] {
                    continue
                }
                
                dfs(nr, nc, &visited)
            }
        }
        
        for r in 0..<rows {
            dfs(r, 0, &pacific)
            dfs(r, cols - 1, &atlantic)
        }
        
        for c in 0..<cols {
            dfs(0, c, &pacific)
            dfs(rows - 1, c, &atlantic)
        }
        
        var result: [[Int]] = []
        
        for r in 0..<rows {
            for c in 0..<cols {
                if pacific[r][c] && atlantic[r][c] {
                    result.append([r, c])
                }
            }
        }

        return result
    }
}
