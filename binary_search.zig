const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const arr = [_]i32{ 1, 3, 5, 9, 11, 32, 55, 96 };
    const exists = binary_search(arr[0..], 75);

    try stdout.print("The number you are looking for exists?: {}!\n", .{exists});
}

fn binary_search(arr: []const i32, num: i32) bool {
    var left: usize = 0;
    var right: usize = arr.len - 1;

    while (left < right) {
        const mid = left + (right - left) / 2;

        if (arr[mid] == num) {
            return true;
        } else if (arr[mid] < num) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }

    return false;
}
