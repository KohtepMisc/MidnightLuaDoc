---@diagnostic disable

---@meta _

---@module bit
bit = {}

--- Sets a bit in an integer.
---@param var integer The integer value.
---@param bit integer The bit position to set.
---@return integer The new integer value with the bit set.
function bit.set(var, bit) end

--- Checks if a bit is set in an integer.
---@param var integer The integer value.
---@param bit integer The bit position to check.
---@return boolean Whether the bit is set.
function bit.is_set(var, bit) end

--- Resets a bit in an integer.
---@param var integer The integer value.
---@param bit integer The bit position to reset.
---@return integer The new integer value with the bit reset.
function bit.reset(var, bit) end

--- Toggles a bit in an integer.
---@param var integer The integer value.
---@param bit integer The bit position to toggle.
---@return integer The new integer value with the bit toggled.
function bit.toggle(var, bit) end

--- Clears all bits in an integer.
---@param var integer The integer value.
---@return integer The integer value with all bits cleared (0).
function bit.clear(var) end

--- Sets all bits in an integer.
---@param var integer The integer value.
---@return integer The integer value with all bits set.
function bit.fill(var) end

--- Counts set bits in an integer.
---@param var integer The integer value.
---@return integer The count of bits set.
function bit.count(var) end

--- Inverts all bits in an integer.
---@param var integer The integer value.
---@return integer The integer value with all bits inverted.
function bit.invert(var) end

--- Finds the first set bit in an integer.
---@param var integer The integer value.
---@return integer The position of the first set bit, or -1 if no bits are set.
function bit.find_first_set(var) end

--- Finds the first reset bit in an integer.
---@param var integer The integer value.
---@return integer The position of the first reset bit.
function bit.find_first_reset(var) end

--- Rotates the bits of an integer to the left.
---@param var integer The integer value.
---@param n integer The number of positions to rotate.
---@return integer The integer value after the bits have been rotated left.
function bit.rotate_left(var, n) end

--- Rotates the bits of an integer to the right.
---@param var integer The integer value.
---@param n integer The number of positions to rotate.
---@return integer The integer value after the bits have been rotated right.
function bit.rotate_right(var, n) end

--- Swaps two bits in an integer.
---@param var integer The integer value.
---@param pos1 integer The first bit position.
---@param pos2 integer The second bit position.
---@return integer The integer value after the bits have been swapped.
function bit.swap(var, pos1, pos2) end

--- Reverses all bits in an integer.
---@param var integer The integer value.
---@return integer The integer value with all bits reversed.
function bit.reverse(var) end

--- Calculates the parity of an integer.
---@param var integer The integer value.
---@return boolean The parity of the integer (true if even, false if odd).
function bit.parity(var) end