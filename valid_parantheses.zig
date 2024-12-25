const std = @import("std");

pub fn main() !void {
    std.debug.print("{}\n", .{try isValid("(){}[]")}); // Valid
    std.debug.print("{}\n", .{try isValid("()")}); // Valid
    std.debug.print("{}\n", .{try isValid("(")}); // Invalid
}

fn isValid(str: []const u8) !bool {
    var stack = std.ArrayList(u8).init(std.heap.page_allocator);
    defer stack.deinit();

    var map = std.AutoHashMap(u8, u8).init(std.heap.page_allocator);
    defer map.deinit();

    try map.put(')', '(');
    try map.put('}', '{');
    try map.put(']', '[');

    for (str) |c| {
        if (c == '(' or c == '[' or c == '{') {
            try stack.append(c);
        } else {
            const last = stack.pop();

            if (map.get(c)) |val| {
                if (val != last) {
                    return false;
                }
            }
        }
    }

    return stack.items.len == 0;
}
