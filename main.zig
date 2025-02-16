const raylib = @cImport(@cInclude("raylib.h"));
const std = @import("std");

pub fn main() void {
    const screenWidth = 800;
    const screenHeight = 600;
    raylib.InitWindow(screenWidth, screenHeight, "Compression Géométrique");
    defer raylib.CloseWindow();
    const radius = 100.0;
    const compressionX: f32 = 1.0;
    var compressionY: f32 = 1.0;
    while (!raylib.WindowShouldClose()) {
        compressionY = 1.0 + 0.5 * @as(f32, @floatCast(std.math.cos(@as(f64,@floatCast(raylib.GetTime())))));
        raylib.BeginDrawing();
        defer raylib.EndDrawing();
        raylib.ClearBackground(raylib.DARKGRAY);
        raylib.DrawEllipse(screenWidth / 2, screenHeight / 2,
            radius * compressionX, radius * compressionY, raylib.DARKGREEN);
    }
}
