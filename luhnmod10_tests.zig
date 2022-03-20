const std = @import("std");
const expect = std.testing.expect;

const luhnmod10 = @import("luhnmod10.zig");

test "benchmark" {
    const count: i64 = 14_000;
    var timer = try std.time.Timer.start();
    var i: i64 = 0;
    while (i < count) : (i += 1) {
        const number = "4242424242424242";
        _ = luhnmod10.valid(number);
    }
    const ns = timer.read();
    std.log.warn("count {}", .{i});
    const nsOp = @divTrunc(ns, count);
    std.log.warn("{} ns/op", .{nsOp});
}

test {
    const number = "0";
    const valid = luhnmod10.valid(number);
    try expect(valid == true);
}

test {
    const number = "00";
    const valid = luhnmod10.valid(number);
    try expect(valid == true);
}

test {
    const number = "18";
    const valid = luhnmod10.valid(number);
    try expect(valid == true);
}

test {
    const number = "0000000000000000";
    const valid = luhnmod10.valid(number);
    try expect(valid == true);
}

test {
    const number = "4242424242424240";
    const valid = luhnmod10.valid(number);
    try expect(valid == false);
}

test {
    const number = "4242424242424241";
    const valid = luhnmod10.valid(number);
    try expect(valid == false);
}

test {
    const number = "4242424242424242";
    const valid = luhnmod10.valid(number);
    try expect(valid == true);
}

test {
    const number = "4242424242424243";
    const valid = luhnmod10.valid(number);
    try expect(valid == false);
}

test {
    const number = "4242424242424244";
    const valid = luhnmod10.valid(number);
    try expect(valid == false);
}

test {
    const number = "4242424242424245";
    const valid = luhnmod10.valid(number);
    try expect(valid == false);
}

test {
    const number = "4242424242424246";
    const valid = luhnmod10.valid(number);
    try expect(valid == false);
}

test {
    const number = "4242424242424247";
    const valid = luhnmod10.valid(number);
    try expect(valid == false);
}

test {
    const number = "4242424242424248";
    const valid = luhnmod10.valid(number);
    try expect(valid == false);
}

test {
    const number = "4242424242424249";
    const valid = luhnmod10.valid(number);
    try expect(valid == false);
}

test {
    const number = "42424242424242426";
    const valid = luhnmod10.valid(number);
    try expect(valid == true);
}

test {
    const number = "424242424242424267";
    const valid = luhnmod10.valid(number);
    try expect(valid == true);
}

test {
    const number = "4242424242424242675";
    const valid = luhnmod10.valid(number);
    try expect(valid == true);
}

test {
    const number = "000000018";
    const valid = luhnmod10.valid(number);
    try expect(valid == true);
}

test {
    const number = "99999999999999999999";
    const valid = luhnmod10.valid(number);
    try expect(valid == true);
}

test {
    const number = "99999999999999999999999999999999999999999999999999999999999999999997";
    const valid = luhnmod10.valid(number);
    try expect(valid == true);
}
