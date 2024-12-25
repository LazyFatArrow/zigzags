const std = @import("std");

pub fn main() void {
    const str = "racecar";
    std.debug.print("{}", .{isPalindrome(str)});
}

fn isPalindrome(str: []const u8) bool {
    var left: usize = 0;
    var right: usize = str.len - 1;

    while (left < right) {
        if (str[left] != str[right]) {
            return false;
        }

        left += 1;
        right -= 1;
    }

    return true;
}
