const std = @import("std");

pub fn checksum(number: []const u8) u64 {
    var sum: u64 = 0;

    if (number.len == 0) {
        return sum;
    }

    var i = number.len - 1;
    while (true) {
        const n = number[i] - '0';
        sum += n;
        if (i <= 1) {
            break;
        }
        i -= 2;
    }

    if (number.len == 1) {
        return sum;
    }

    i = number.len - 2;
    while (true) {
        var n = number[i] - '0';
        n *= 2;
        if (n > 9) {
            n -= 9;
        }
        sum += n;
        if (i <= 1) {
            return sum;
        }
        i -= 2;
    }
}

pub fn valid(number: []const u8) bool {
    return checksum(number) % 10 == 0;
}

pub fn checkDigit(number: []const u8) u8 {
    return checksum(number) * 9 % 10;
}
