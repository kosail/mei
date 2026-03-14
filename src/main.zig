const std = @import("std");

const LANG_NAME = "mei";
const LANG_VERSION = "0.0.0";

const COMPILER_STARTUP_MSG = std.fmt.comptimePrint("{s} compiler v{s}", .{LANG_NAME, LANG_VERSION});

pub fn main() !void {
    // Get args passed down to the binary
    var arena_alloc_args = std.heap.ArenaAllocator.init(std.heap.smp_allocator);
    const args_alloc = arena_alloc_args.allocator();
    defer arena_alloc_args.deinit();

    const args = try std.process.argsAlloc(args_alloc);
    defer std.process.argsFree(args_alloc, args);

    // If no args are passed down, then exit
    if (args.len < 2) {
        std.log.err("\n{s}\nIncorrect usage!\n\n", .{COMPILER_STARTUP_MSG});
        std.log.info("\nUSAGE: mei <input.mei>\n", .{});
        std.process.exit(1);
    }


    // Open the source code file
    var arena_alloc_file = std.heap.ArenaAllocator.init(std.heap.smp_allocator);
    const file_alloc =  arena_alloc_file.allocator();
    defer arena_alloc_file.deinit();

    const file_data = try std.fs.cwd().readFileAlloc(file_alloc, args[1], 1024  * 1024);

    std.debug.print("Bytes read: {d}\nContents: {s}\n", .{file_data.len, file_data});
}