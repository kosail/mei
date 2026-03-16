const std = @import("std");
const t_token = @import("token.zig");
const tokenType = @import("token_type.zig");
const TT = tokenType.TokenType;
const ascii = std.ascii;

inline fn hasNext(str: [] const u8) bool {
    return str.len > 0;
}

inline fn scanInteger(str: []const u8) usize {
    var k: usize, var acc: usize = .{0, 0};
    var index: u8 = 0;

    const haystack: [16]u8 = [_]u8{
        '0','1','2','3','4','5','6','7','8','9',
        'a','b','c','d','e','f'
    };
    while(hasNext(str[index..str.len]) and ascii.isHex(str[index])) {
        const pos: ?usize = std.mem.indexOfScalar(u8, &haystack, str[index]);
        if (pos != null) {
            k = pos.?;
            acc = acc * 16 + k;
        }

        index += 1;
    }

    return acc;
}

// This function should return a type Token in the future, but for now just prints everything out to confirm the parser works
pub fn Tokenizer(str: []const u8) void {
    var mem_alloc = std.heap.ArenaAllocator.init(std.heap.smp_allocator);
    const allocator = mem_alloc.allocator();
    var tokenList: std.ArrayList(t_token.Token) = .empty;

    defer mem_alloc.deinit();
    defer tokenList.deinit(allocator);

    var index: usize = 0;
    while(index < str.len) {
        const character = str[index];

        // isWhitespace considers \t, but mei syntax do use \t, so omit checking it
        if (character != '\t' and ascii.isWhitespace(character)) {
            index += 1;
            continue;
        }

        const tok_type: ?TT = switch (character) {
            '\t' => TT.INDENT,

            ';' => TT.SEMICOLON,
            ',' => TT.COMMA,
            ':' => TT.COLON,
            '(' => TT.LPAREN,
            ')' => TT.RPAREN,
            '[' => TT.LBRACKET,
            ']' => TT.RBRACKET,
            '{' => TT.LBRACE,
            '}' => TT.RBRACE,

            '+' => TT.PLUS,
            '-' => TT.MINUS,
            '*' => TT.STAR,
            '/' => TT.SLASH,
            '\\' => TT.BACKSLASH,
            '%' => TT.PERCENT,

            // TODO: I will continue adding them later. First I wanna check if this works
            else => if (ascii.isDigit(character)) TT.INT_LITERAL else null
        };

        // Character is not whitespace, but it is not recognized (like non utf-8 chars)
        if (tok_type != null) {
            const token = t_token.Token {
                .type = tok_type.?,
                .value = if (tok_type.? == TT.INT_LITERAL) &[_]usize{scanInteger(str[index..str.len])} else null
            };

            tokenList.append(allocator, token) catch {
                return;
            };
        }
        index += 1; // Continue to next character
    }

    for (tokenList.items) |token| {
        const value = if (token.value != null) token.value.?[0] else 0;
        std.debug.print("Token: {}\tValue:{d}\n", .{token.type, value});
    }
}