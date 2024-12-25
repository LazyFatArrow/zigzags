const std = @import("std");

pub fn main() !void {
    const year1 = 2015;
    const year2 = 1960;
    const year3 = 2000;

    std.debug.print("{}\n", .{isLeapYear(year1)});
    std.debug.print("{}\n", .{isLeapYear(year2)});
    std.debug.print("{}\n", .{isLeapYear(year3)});
}

pub fn isLeapYear(year: u32) bool {
    return year % 4 == 0 and year % 100 != 0 or year % 400 == 0;
}
