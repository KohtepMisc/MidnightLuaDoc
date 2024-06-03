---@diagnostic disable

---@meta _

---@class Color
--- Class for handling RGBA color data.
---@field r number Red component of the color.
---@field g number Green component of the color.
---@field b number Blue component of the color.
---@field a number Alpha component of the color.
Color = {}

--- Constructors
---@overload fun():Color                                        -- Create a default color (typically black or transparent).
---@overload fun(r:number, g:number, b:number):Color            -- Create a color with specified RGB values and default alpha value.
---@overload fun(r:number, g:number, b:number, a:number):Color  -- Create a color with specified RGBA values.
---@overload fun(rgba:number):Color                             -- Create a color from a 32-bit RGBA integer.

--- Sets the color based on HSV model.
---@param h number Hue component (0-255).
---@param s number Saturation component (0-255).
---@param v number Value component (0-255).
---@param a? number Optional alpha component (0-255).
---@nodiscard
---@overload fun(h:number, s:number, v:number):bool
---@overload fun(h:number, s:number, v:number, a:number):bool
function Color:set_hsv(h, s, v, a) end

--- Sets the color based on HSL model.
---@param h number Hue component (0-255).
---@param s number Saturation component (0-255).
---@param l number Lightness component (0-255).
---@param a? number Optional alpha component (0-255).
---@nodiscard
---@overload fun(h:number, s:number, l:number):bool
---@overload fun(h:number, s:number, l:number, a:number):bool
function Color:set_hsl(h, s, l, a) end

--- Sets the color based on RGB model.
---@param r number Red component.
---@param g number Green component.
---@param b number Blue component.
---@param a? number Optional alpha component.
---@nodiscard
---@overload fun(r:number, g:number, b:number):bool
---@overload fun(r:number, g:number, b:number, a:number):bool
function Color:set_rgb(r, g, b, a) end

--- Retrieves the HSV representation of the color.
---@return tuple Returns a tuple (h, s, v, a) where all values are integers in the range 0-255.
function Color:get_hsv() end

--- Retrieves the HSL representation of the color.
---@return tuple Returns a tuple (h, s, l, a) where all values are integers in the range 0-255.
function Color:get_hsl() end

--- Format a string by replacing color component placeholders with actual color values.
--- Placeholders are '%r', '%g', '%b', '%a' for the red, green, blue, and alpha components respectively.
---@param format string The format string with placeholders for color components.
---@return string Returns the formatted string with placeholders replaced by the actual color component values.
---@nodiscard
function Color:format(format) end

--- Blends this color with another color based on alpha values.
---@param other Color The other color to blend with.
---@return boolean Returns true always, indicating the blend was performed.
function Color:blend(other) end

--- Mixes this color with another color based on a given ratio.
---@param other Color The other color to mix with.
---@param t number The mix ratio from 0.0 to 1.0, where 0.0 is fully this color, and 1.0 is fully the other color.
---@return boolean Returns false if t is out of bounds (not between 0.0 and 1.0), true otherwise.
function Color:mix(other, t) end

--- Lightens the color by a given intensity.
---@param intensity number The intensity to lighten the color, range from 0.0 to 1.0.
---@return boolean Returns false if intensity is out of bounds (not between 0.0 and 1.0), true otherwise.
function Color:lighten(intensity) end

--- Darkens the color by a given intensity.
---@param intensity number The intensity to darken the color, range from 0.0 to 1.0.
---@return boolean Returns false if intensity is out of bounds (not between 0.0 and 1.0), true otherwise.
function Color:darken(intensity) end

--- Inverts the color.
---@return boolean Returns true always, indicating the color was inverted.
function Color:invert() end

--- Adjusts the gamma of the color.
---@param gamma number The gamma value to use; must be positive.
function Color:gamma(gamma) end

--- Converts the color to grayscale.
function Color:grayscale() end

--- Applies a sepia tone to the color.
function Color:sepia() end

--- Calculates the Euclidean distance between this color and another color.
---@param other Color The other color to calculate the distance from.
---@return number The Euclidean distance between the two colors.
function Color:distance(other) end

--- Creates a new Color object. This function has multiple overloads allowing for different ways of specifying color values.
--- @overload fun(): Color Creates an empty color with default values.
--- @overload fun(r: number, g: number, b: number): Color Creates a color using RGB values (0-255).
--- @overload fun(r: number, g: number, b: number, a: number): Color Creates a color using RGBA values (0-255), including alpha.
--- @overload fun(rgba: number): Color Creates a color from a single uint32 value representing RGBA.
--- @overload fun(hex: string): Color Creates a color from a hexadecimal string (e.g., "FF0033" or "#FF0033").
--- @param r? number The red component of the color (0-255).
--- @param g? number The green component of the color (0-255).
--- @param b? number The blue component of the color (0-255).
--- @param a? number The alpha component of the color (0-255).
--- @param rgba? number A uint32 number representing the color in RGBA format.
--- @param hex? string A string representing the color in hexadecimal format.
--- @return Color A new instance of a Color object.
function color() end