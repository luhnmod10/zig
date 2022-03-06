const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const mode = b.standardReleaseOptions();
    const target = b.standardTargetOptions(.{});

    const fmt = b.addFmt(&.{"."});
    const fmt_step = b.step("fmt", "Format code");
    fmt_step.dependOn(&fmt.step);

    const lib = b.addStaticLibrary("luhnmod10", "src/lib.zig");
    lib.setBuildMode(mode);
    lib.setTarget(target);
    lib.install();

    const tests = b.addTest("src/tests.zig");
    tests.setBuildMode(mode);
    tests.setTarget(target);
    const test_step = b.step("test", "Run tests");
    test_step.dependOn(&tests.step);
}
