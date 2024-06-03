---@diagnostic disable

---@meta _

---@module draw
draw = {}

---@enum DrawContextColor
DrawContextColor = {
    COMMON = 0,
    UPPER_LEFT = 1,
    UPPER_RIGHT = 2,
    BOTTOM_LEFT = 3,
    BOTTOM_RIGHT = 4,
}

---@enum DrawList
DrawList = {
    --- This layer is intended for elements that need to be rendered above all other content.
    --- Use this layer for overlays, tooltips, and other UI components that must remain visible on top of main content.
    FOREGROUND = 0,

    --- This layer is used for background elements, which are drawn first and can be overlaid by other UI components.
    --- Ideal for backgrounds, images, or any foundational visuals that support the main UI elements but should not obscure them.
    BACKGROUND = 1
}

---@enum ImDrawCornerFlags
ImDrawCornerFlags = {
    NONE = 0,
    TOP_LEFT = 1, -- 1 << 0, 0x1
    TOP_RIGHT = 2, -- 1 << 1, 0x2
    BOT_LEFT = 4, -- 1 << 2, 0x4
    BOT_RIGHT = 8, -- 1 << 3, 0x8
    TOP = 3, -- (1 << 0) | (1 << 1), 0x3
    BOT = 12, -- (1 << 2) | (1 << 3), 0xC
    LEFT = 5, -- (1 << 0) | (1 << 2), 0x5
    RIGHT = 10, -- (1 << 1) | (1 << 3), 0xA
    ALL = 15 -- 0xF
}

--- @return boolean True if drawing is possible.
function draw.is_ready() end

--- Returns the width of the game window.
--- @return number The width of the window in pixels, or 0 if the resolution cannot be retrieved.
function draw.get_window_width() end

--- Returns the height of the game window.
--- @return number The height of the window in pixels, or 0 if the resolution cannot be retrieved.
function draw.get_window_height() end

--- Returns the width of the screen.
--- @return number The width of the screen in pixels, or 0 if the resolution cannot be retrieved.
function draw.get_screen_width() end

--- Returns the height of the screen.
--- @return number The height of the screen in pixels, or 0 if the resolution cannot be retrieved.
function draw.get_screen_height() end

--- Creates a texture from memory buffer.
--- @param buffer string A buffer containing the texture data.
--- @param len number The length of the buffer.
--- @return number A texture handle if successful, or 0 if the texture could not be created.
function draw.create_texture_from_memory(buffer, len) end

--- Creates a texture from a file.
--- @param file_name string The path to the texture file.
--- @return number A texture handle if successful, or 0 if the texture could not be created.
function draw.create_texture_from_file(file_name) end

--- Creates a texture from a base64 encoded string.
--- @param base64 string The base64 encoded string representing the image data.
--- @return number A texture handle if successful, or 0 if the texture could not be created.
function draw.create_texture_from_base64(base64) end

--- Creates a debug texture with a checkerboard pattern for quick testing and debugging purposes.
--- @overload fun(): number
--- @overload fun(width: number, height: number): number
--- @param width? number The width of the texture in pixels.
---|> 100
--- @param height? number The height of the texture in pixels.
---|> 100
--- @return number A texture handle if successful, or 0 if the texture could not be created.
function draw.create_debug_texture(width, height) end

--- Releases a previously created texture.
--- @param handle number The texture handle to release.
--- @return boolean True if the texture was successfully released, false otherwise.
function draw.release_texture(handle) end

--- Draws a texture on the screen at the specified coordinates.
--- Width and height are optional; if not specified, the image will be drawn at its original size.
--- @param handle number The texture handle to draw.
--- @param x number The x-coordinate on the screen.
--- @param y number The y-coordinate on the screen.
--- @param width number? The width of the image to draw.
--- @param height number? The height of the image to draw.
--- @return boolean True if the texture was successfully drawn, false otherwise.
function draw.texture(handle, x, y, width, height) end

--- Sets the current drawing color using HSV values, with an optional alpha component.
--- @param color DrawContextColor The drawing context color type.
--- @param h number The hue component of the color (0-1).
--- @param s number The saturation component of the color (0-1).
--- @param v number The value component of the color (0-1).
--- @param a number? The alpha component of the color (0-1).
---|> 1
function draw.set_hsv(color, h, s, v, a) end

--- Sets the current drawing color. This function can be called with different sets of parameters:
--- 1. Set the color using a number value that encapsulates RGBA components in a single four-byte number.
--- 2. Set the color using RGBA components.
--- 3. Set the color using RGB components, assuming full opacity.
--- @overload fun(color: EDrawContextColor, value: number)
--- @overload fun(color: EDrawContextColor, r: number, g: number, b: number, a: number)
--- @overload fun(color: EDrawContextColor, r: number, g: number, b: number)
function draw.set_color(color, ...) end

--- Retrieves the current RGBA color values for a specified drawing context.
--- Returns the color as RGBA components, each scaled to the range 0-255.
--- @param color EDrawContextColor The specific drawing context color to retrieve.
--- @return number, number, number, number Four integers representing the RGBA components of the color.
---
--- @example
--- local r, g, b, a = draw.get_colors(DrawContextColor.COMMON)
--- print("Current common color RGBA: ", r, g, b, a)
function draw.get_colors(color) end

--- Sets the line thickness for drawing operations.
--- @param value number The thickness to set.
function draw.set_thickness(value) end

--- Retrieves the current line thickness used in drawing operations.
--- @return number The current line thickness.
function draw.get_thickness() end

--- Sets the rounding radius for drawing operations that require rounded corners.
--- @param value number The rounding radius to set.
function draw.set_rounding(value) end

--- Retrieves the current rounding radius used in drawing operations.
--- @return number The current rounding radius.
function draw.get_rounding() end

--- Sets the radius for drawing operations that involve circular elements.
--- @param value number The radius to set for circles and arcs.
function draw.set_radius(value) end

--- Retrieves the current radius used in drawing operations for circles and arcs.
--- @return number The current radius.
function draw.get_radius() end

--- Sets the number of segments used for drawing rounded elements.
--- @param value number The number of segments to set.
function draw.set_num_segments(value) end

--- Retrieves the current number of segments used for rounded elements.
--- @return number The current number of segments.
function draw.get_num_segments() end

--- Sets drawing flags for customizing the behavior of drawing operations. These flags are based on the ImDrawCornerFlags enum.
--- @param value number The flags to set, as defined by ImDrawCornerFlags.
function draw.set_flags(value) end

--- Retrieves the current drawing flags, as defined by the ImDrawCornerFlags enum.
--- @return number The current flags.
function draw.get_flags() end

--- Sets the minimum texture coordinate (UV) for texturing operations.
--- @param value number The minimum UV to set.
function draw.set_min_uv(value) end

--- Retrieves the current minimum texture coordinate (UV) used in texturing operations.
--- @return number The current minimum UV.
function draw.get_min_uv() end

--- Sets the maximum texture coordinate (UV) for texturing operations.
--- @param value number The maximum UV to set.
function draw.set_max_uv(value) end

--- Retrieves the current maximum texture coordinate (UV) used in texturing operations.
--- @return number The current maximum UV.
function draw.get_max_uv() end

--- Queues a font for loading and invokes a callback when the font is successfully loaded.
---
--- This function does not load the font immediately but schedules it for the next drawing tick.
---
--- It first tries to find the font in the product folder; if not found, it searches in the system fonts directory.
---
--- @overload fun(font_name: string, font_size: number, on_requested: fun(font: ImFont*)):boolean
--- @overload fun(font_name: string, on_requested: fun(font: ImFont*)):boolean
---
--- @param font_name string The name of the font file. If the path is not specified, searches in the product directory and system fonts.
--- @param font_size number? The size of the font.
---|> 14
--- @param on_requested fun(font: ImFont*) The callback function that is invoked when the font is loaded. Receives an ImFont pointer as an argument.
---
--- @return boolean True if the font is successfully queued for loading, false if there is an error.
function draw.create_font(font_name, font_size, on_requested) end

--- Sets the current font for drawing operations.
--- @param font ImFont* The font to set for drawing.
function draw.set_font(font) end

--- Calculates the size of the given text using the current font.
--- @param text string The text for which to calculate the size.
--- @return number, number The width and height of the text in pixels, respectively.
function draw.get_text_size(text) end

--- Calculates the width of the given text using the current font.
--- @param text string The text for which to calculate the width.
--- @return number The width of the text in pixels.
function draw.get_text_size_x(text) end

--- Calculates the height of the given text using the current font.
--- @param text string The text for which to calculate the height.
--- @return number The height of the text in pixels.
function draw.get_text_size_y(text) end

--- Draws a line between two points.
--- @param x1 number The x-coordinate of the first point.
--- @param y1 number The y-coordinate of the first point.
--- @param x2 number The x-coordinate of the second point.
--- @param y2 number The y-coordinate of the second point.
function draw.line(x1, y1, x2, y2) end

--- Draws text at a specified location.
--- @param x number The x-coordinate where the text starts.
--- @param y number The y-coordinate where the text starts.
--- @param text string The text to draw.
function draw.text(x, y, text) end

--- Draws an unfilled rectangle.
--- @param x1 number The x-coordinate of the first corner.
--- @param y1 number The y-coordinate of the first corner.
--- @param x2 number The x-coordinate of the opposite corner.
--- @param y2 number The y-coordinate of the opposite corner.
function draw.rect(x1, y1, x2, y2) end

--- Draws a filled rectangle.
--- @param x1 number The x-coordinate of the first corner.
--- @param y1 number The y-coordinate of the first corner.
--- @param x2 number The x-coordinate of the opposite corner.
--- @param y2 number The y-coordinate of the opposite corner.
function draw.rect_filled(x1, y1, x2, y2) end

--- Draws a filled rectangle with multiple colors.
--- @param x1 number The x-coordinate of the first corner.
--- @param y1 number The y-coordinate of the first corner.
--- @param x2 number The x-coordinate of the opposite corner.
--- @param y2 number The y-coordinate of the opposite corner.
function draw.rect_filled_multi_color(x1, y1, x2, y2) end

--- Draws an unfilled quadrilateral.
--- @param x1 number The x-coordinate of the first corner.
--- @param y1 number The y-coordinate of the first corner.
--- @param x2 number The x-coordinate of the second corner.
--- @param y2 number The y-coordinate of the second corner.
--- @param x3 number The x-coordinate of the third corner.
--- @param y3 number The y-coordinate of the third corner.
--- @param x4 number The x-coordinate of the fourth corner.
--- @param y4 number The y-coordinate of the fourth corner.
function draw.quad(x1, y1, x2, y2, x3, y3, x4, y4) end

--- Draws a filled quadrilateral.
--- @param x1 number The x-coordinate of the first corner.
--- @param y1 number The y-coordinate of the first corner.
--- @param x2 number The x-coordinate of the second corner.
--- @param y2 number The y-coordinate of the second corner.
--- @param x3 number The x-coordinate of the third corner.
--- @param y3 number The y-coordinate of the third corner.
--- @param x4 number The x-coordinate of the fourth corner.
--- @param y4 number The y-coordinate of the fourth corner.
function draw.quad_filled(x1, y1, x2, y2, x3, y3, x4, y4) end

--- Draws an unfilled triangle.
--- @param x1 number The x-coordinate of the first corner.
--- @param y1 number The y-coordinate of the first corner.
--- @param x2 number The x-coordinate of the second corner.
--- @param y2 number The y-coordinate of the second corner.
--- @param x3 number The x-coordinate of the third corner.
--- @param y3 number The y-coordinate of the third corner.
function draw.triangle(x1, y1, x2, y2, x3, y3) end

--- Draws a filled triangle.
--- @param x1 number The x-coordinate of the first corner.
--- @param y1 number The y-coordinate of the first corner.
--- @param x2 number The x-coordinate of the second corner.
--- @param y2 number The y-coordinate of the second corner.
--- @param x3 number The x-coordinate of the third corner.
--- @param y3 number The y-coordinate of the third corner.
function draw.triangle_filled(x1, y1, x2, y2, x3, y3) end

--- Draws an unfilled circle at a specified location.
--- @param x number The x-coordinate of the circle's center.
--- @param y number The y-coordinate of the circle's center.
function draw.circle(x, y) end

--- Draws a filled circle at a specified location.
--- @param x number The x-coordinate of the circle's center.
--- @param y number The y-coordinate of the circle's center.
function draw.circle_filled(x, y) end

--- Sets the current draw list for drawing elements.
--- @param list DrawList The draw list to be set.
--- @return DrawList The previous DrawList that was set.
function draw.set_draw_list(list) end

--- Retrieves the current draw list for drawing elements.
--- @return DrawList The current draw list.
function draw.get_draw_list() end