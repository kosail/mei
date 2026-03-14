const std = @import("std");

pub fn main() !void {
    // Get args passed down to the binary
    var arena = std.heap.ArenaAllocator.init(std.heap.smp_allocator);
    const allocator = arena.allocator();
    defer _ = arena.deinit();

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    std.debug.print("{s}\n", .{args[1]});
}