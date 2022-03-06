# Luhn (Mod 10)

[![Go docs](https://img.shields.io/badge/godoc-reference-blue.svg)](https://godoc.org/github.com/luhnmod10/go)

A fast and simple in-place implementation of the [luhn check algorithm](https://en.wikipedia.org/wiki/Luhn_algorithm) in Zig. Implementations in other languages can be found at [github.com/luhnmod10](https://github.com/luhnmod10).

## Usage

```zig
const luhnmod10 = @import("path/to/luhnmod10/src/lib.zig");
```

```zig
const valid = luhnmod10.valid("4242424242424242");
```
