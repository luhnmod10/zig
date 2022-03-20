fn ReverseIterator(comptime T: type) type {
    return struct {
        t: []const T,
        i: usize,

        pub fn init(t: []const T) @This() {
            return @This(){
                .t = t,
                .i = t.len,
            };
        }

        pub fn next(self: *@This()) ?T {
            if (self.i == 0) return null;
            self.i -= 1;
            return self.t[self.i];
        }
    };
}

pub fn checksum(number: []const u8) u64 {
    var sum: u64 = 0;

    var i = ReverseIterator(u8).init(number);

    while (true) {
        if (i.next()) |c| {
            sum += c - '0';
        } else {
            break;
        }
        if (i.next()) |c| {
            sum += switch (c) {
                '0' => @as(u8, 0),
                '1' => 2,
                '2' => 4,
                '3' => 6,
                '4' => 8,
                '5' => 1,
                '6' => 3,
                '7' => 5,
                '8' => 7,
                '9' => 9,
                else => unreachable,
            };
        } else {
            break;
        }
    }

    return sum;
}

pub fn valid(number: []const u8) bool {
    return checksum(number) % 10 == 0;
}

pub fn checkDigit(number: []const u8) u8 {
    return checksum(number) * 9 % 10;
}
