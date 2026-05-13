class Solution81 {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var left = 0
        var right = nums.count - 1

        while left <= right {
            let middle = left + (right - left) / 2

            if nums[middle] == target {
                return true
            }

            if nums[left] == nums[middle], nums[middle] == nums[right] {
                left += 1
                right -= 1
            } else if nums[left] <= nums[middle] {
                if nums[left] <= target, target < nums[middle] {
                    right = middle - 1
                } else {
                    left = middle + 1
                }
            } else {
                if nums[middle] < target, target <= nums[right] {
                    left = middle + 1
                } else {
                    right = middle - 1
                }
            }
        }

        return false
    }
}
