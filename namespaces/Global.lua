---@diagnostic disable

---@meta _

--- Converts an integer to a floating-point number.
--- Note: This function uses a binary reinterpretation of the integer value.
---@param value integer The integer value to convert.
---@return number The floating-point number obtained from the binary representation of the integer.
function i2f(value) end

--- Converts a floating-point number to an integer.
--- Note: This function uses a binary reinterpretation of the floating-point value.
---@param value number The floating-point number to convert.
---@return integer The integer obtained from the binary representation of the floating-point number.
function f2i(value) end

--- Converts a string to a floating-point number.
--- Note: This function converts a numeric string into a floating-point number.
--- Returns NaN if the string is not a valid numeric representation.
---@param value string The string representation of a number.
---@return number The floating-point number represented by the string or NaN if conversion is not possible.
function s2f(value) end

--- Converts a pointer to a string into the actual string content.
--- This function is crucial for handling strings returned from C++ as pointers.
--- It safely checks if the pointer is valid before attempting to read the string.
--- If the pointer is invalid, it returns an empty string.
--- @param pointer number The integer representation of the pointer to the string.
--- @return string The string content at the pointer location. Returns an empty string if the pointer is invalid.
function str(pointer) end

--- Returns the absolute path of the Lua script file.
-- This is the full path where the script file is stored on the disk.
-- @return string The absolute file path of the script.
-- @usage local absPath = SCRIPT_NAME_ABSOLUTE
-- @example C:\scripts\example.lua
SCRIPT_NAME_ABSOLUTE = nil

--- Returns the full name of the Lua script file including its extension.
-- This name corresponds to the file name as stored on the disk.
-- @return string The full name of the script file.
-- @usage local fullName = SCRIPT_NAME_FULL
-- @example example.lua
SCRIPT_NAME_FULL = nil

--- Returns the base name of the Lua script file, excluding its file extension.
-- This name is derived by removing the extension from the full script name.
-- @return string The name of the script file without the extension.
-- @usage local name = SCRIPT_NAME
-- @example example
SCRIPT_NAME = nil