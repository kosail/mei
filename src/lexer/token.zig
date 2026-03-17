const tokenType = @import("token_type.zig");

pub const Token = struct {
    type: tokenType.TokenType,
    value: ?[]const u8
};