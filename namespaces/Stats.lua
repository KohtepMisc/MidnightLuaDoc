---@diagnostic disable

---@meta _

---@module stats
stats = {}

--- Checks if a specific game stat exists.
--- @param stat integer The hash for the stat.
--- @return boolean True if the stat exists, false otherwise.
function stats.exists(stat) end

--- Retrieves the type of a specified stat as an integer code.
--- This function returns an integer representing the type of stat (e.g., integer, float, boolean, etc.),
--- which is useful for ensuring that stat modifications are type-appropriate.
--- @param stat integer The hash for the stat.
--- @return integer The integer code of the stat type, or -1 if the stat does not exist.
function stats.get_stat_type(stat) end

--- Retrieves the name of the stat type as a string.
--- This function provides a human-readable name of the stat type, which can be used for logging, debugging, or user interfaces.
--- @param stat integer The hash for the stat.
--- @return string The name of the stat type, or nil if the stat does not exist.
function stats.get_stat_type_name(stat) end

--- Sets a boolean value for a specified stat.
--- This function is used to modify boolean stats. It will fail if the stat does not exist or if the stat is not a boolean type.
--- Errors will be logged for non-existent stats or incorrect type assignments.
--- @param stat integer The hash for the stat.
--- @param value boolean The boolean value to set for the stat.
--- @return boolean True if the stat was successfully set, false otherwise.
function stats.set_bool(stat, value) end

--- Sets an unsigned 8-bit integer value for a specified stat.
--- This function is used to modify 8-bit unsigned integer stats. It will fail if the stat does not exist or if the stat is not an 8-bit unsigned integer type.
--- Errors will be logged for non-existent stats or incorrect type assignments.
--- @param stat integer The hash for the stat.
--- @param value integer The integer value to set for the stat.
--- @return boolean True if the stat was successfully set, false otherwise.
function stats.set_u8(stat, value) end

--- Sets an unsigned 16-bit integer value for a specified stat.
--- This function is used to modify 16-bit unsigned integer stats. It will fail if the stat does not exist or if the stat is not a 16-bit unsigned integer type.
--- Errors will be logged for non-existent stats or incorrect type assignments.
--- @param stat integer The hash for the stat.
--- @param value integer The integer value to set for the stat.
--- @return boolean True if the stat was successfully set, false otherwise.
function stats.set_u16(stat, value) end

--- Sets an unsigned 32-bit integer value for a specified stat.
--- This function is used to modify 32-bit unsigned integer stats. It will fail if the stat does not exist or if the stat is not a 32-bit unsigned integer type.
--- Errors will be logged for non-existent stats or incorrect type assignments.
--- @param stat integer The integer identifier for the stat.
--- @param value integer The integer value to set for the stat.
--- @return boolean True if the stat was successfully set, false otherwise.
function stats.set_u32(stat, value) end

--- Sets an unsigned 64-bit integer value for a specified stat.
--- This function is used to modify 64-bit unsigned integer stats. It will fail if the stat does not exist or if the stat is not a 64-bit unsigned integer type.
--- Errors will be logged for non-existent stats or incorrect type assignments.
--- @param stat integer The hash for the stat.
--- @param value integer The integer value to set for the stat.
--- @return boolean True if the stat was successfully set, false otherwise.
function stats.set_u64(stat, value) end

--- Sets a floating-point value for a specified stat.
--- This function is used to modify floating-point stats. It will fail if the stat does not exist or if the stat is not a floating-point type.
--- Errors will be logged for non-existent stats or incorrect type assignments.
--- @param stat integer The hash for the stat.
--- @param value float The floating-point value to set for the stat.
--- @return boolean True if the stat was successfully set, false otherwise.
function stats.set_float(stat, value) end

--- Sets a string value for a specified stat.
--- This function is used to modify string stats. It will fail if the stat does not exist or if the stat is not a string type.
--- Errors will be logged for non-existent stats or incorrect type assignments.
--- @param stat integer The integer identifier for the stat.
--- @param value string The string value to set for the stat.
--- @return boolean True if the stat was successfully set, false otherwise.
function stats.set_string(stat, value) end

--- Retrieves the boolean value of a specified stat.
--- This function returns the boolean value of the stat identified by its hash. It will fail if the stat does not exist or if the stat is not a boolean type.
--- Errors will be logged for non-existent stats or incorrect type access.
--- @param stat_hash hash The hash identifier for the stat.
--- @return boolean The boolean value of the specified stat, or nil if the stat does not exist or has a different type.
function stats.get_bool(stat_hash) end

--- Retrieves the unsigned 8-bit integer value of a specified stat.
--- This function returns the unsigned 8-bit integer value of the stat identified by its hash. It will fail if the stat does not exist or if the stat is not an unsigned 8-bit integer type.
--- Errors will be logged for non-existent stats or incorrect type access.
--- @param stat_hash hash The hash identifier for the stat.
--- @return integer The unsigned 8-bit integer value of the specified stat, or 0 if the stat does not exist or has a different type.
function stats.get_u8(stat_hash) end

--- Retrieves the unsigned 16-bit integer value of a specified stat.
--- This function returns the unsigned 16-bit integer value of the stat identified by its hash. It will fail if the stat does not exist or if the stat is not an unsigned 16-bit integer type.
--- Errors will be logged for non-existent stats or incorrect type access.
--- @param stat_hash hash The hash identifier for the stat.
--- @return integer The unsigned 16-bit integer value of the specified stat, or 0 if the stat does not exist or has a different type.
function stats.get_u16(stat_hash) end

--- Retrieves the unsigned 32-bit integer value of a specified stat.
--- This function returns the unsigned 32-bit integer value of the stat identified by its hash. It will fail if the stat does not exist or if the stat is not an unsigned 32-bit integer type.
--- Errors will be logged for non-existent stats or incorrect type access.
--- @param stat_hash hash The hash identifier for the stat.
--- @return integer The unsigned 32-bit integer value of the specified stat, or 0 if the stat does not exist or has a different type.
function stats.get_u32(stat_hash) end

--- Retrieves the unsigned 64-bit integer value of a specified stat.
--- This function returns the unsigned 64-bit integer value of the stat identified by its hash. It will fail if the stat does not exist or if the stat is not an unsigned 64-bit integer type.
--- Errors will be logged for non-existent stats or incorrect type access.
--- @param stat_hash hash The hash identifier for the stat.
--- @return integer The unsigned 64-bit integer value of the specified stat, or 0 if the stat does not exist or has a different type.
function stats.get_u64(stat_hash) end

--- Retrieves the floating-point value of a specified stat.
--- This function returns the floating-point value of the stat identified by its hash. It will fail if the stat does not exist or if the stat is not a floating-point type.
--- Errors will be logged for non-existent stats or incorrect type access.
--- @param stat_hash hash The hash identifier for the stat.
--- @return float The floating-point value of the specified stat, or 0.0 if the stat does not exist or has a different type.
function stats.get_float(stat_hash) end

--- Retrieves the string value of a specified stat.
--- This function returns the string value of the stat identified by its hash. It will fail if the stat does not exist or if the stat is not a string type.
--- Errors will be logged for non-existent stats or incorrect type access.
--- @param stat_hash hash The hash identifier for the stat.
--- @return string The string value of the specified stat, or nil if the stat does not exist or has a different type.
function stats.get_string(stat_hash) end

--- Checks if a masked value of a specified stat is valid.
--- This function checks if the masked value of the stat identified by its hash is valid according to the provided offset and mask. The offset parameter indicates the number of bits counting from the right where the value is going to be set, and the mask parameter indicates the number of bits that should be changed.
--- It will fail if the stat does not exist.
--- Errors will be logged for non-existent stats.
--- @param stat_hash hash The hash identifier for the stat.
--- @param offset number The number of bits counting from the right where the value is going to be set.
--- @param mask number The number of bits that should be changed.
--- @return boolean True if the masked value is valid, false otherwise.
function stats.is_masked_valid(stat_hash, offset, mask) end

--- Retrieves a masked integer value of a specified stat.
--- This function retrieves the masked integer value of the stat identified by its hash. The offset parameter indicates the number of bits counting from the right where the value is going to be set, and the mask parameter indicates the number of bits that should be changed.
--- It will return 0 if the stat does not exist.
--- Errors will be logged for non-existent stats.
--- @param stat_hash hash The hash identifier for the stat.
--- @param offset number The number of bits counting from the right where the value is going to be set.
--- @param mask number The number of bits that should be changed.
--- @return integer The masked integer value of the specified stat, or 0 if the stat does not exist.
function stats.get_masked_int(stat_hash, offset, mask) end

--- Sets a masked integer value of a specified stat.
--- This function sets the masked integer value of the stat identified by its hash. The offset parameter indicates the number of bits counting from the right where the value is going to be set, and the mask parameter indicates the number of bits that should be changed.
--- It will return true if the operation was successful, false otherwise.
--- Errors will be logged for non-existent stats.
--- @param stat_hash hash The hash identifier for the stat.
--- @param stat_value integer The integer value to set.
--- @param offset number The number of bits counting from the right where the value is going to be set.
--- @param mask number The number of bits that should be changed.
--- @return boolean True if the operation was successful, false otherwise.
function stats.set_masked_int(stat_hash, stat_value, offset, mask) end

--- Retrieves the packed mask for a specified stat enum.
--- This function returns the packed mask for the specified stat enum. It calculates the index of the packed mask using the provided stat enum.
--- For packed stats, the packed mask is used to determine the index of the packed integer value associated with the stat enum.
--- @param statEnum integer The enum value for the stat.
--- @return integer The packed mask for the specified stat enum.
--- @usage The packed mask is calculated using the following formula:
--- --- local NUM_PACKED_BOOL_PER_STAT = 64
--- --- local NUM_PACKED_INT_PER_STAT = 8
--- --- local function PACKED_STAT_GET_INT_STAT_INDEX(statEnum)
--- ---     return math.floor(statEnum / NUM_PACKED_INT_PER_STAT)
--- --- end
--- --- local packedMask = stats.get_packed_mask(statEnum)
function stats.get_packed_mask(statEnum) end

--- Retrieves the packed integer value for a specified index and character slot.
--- @param index integer The index value for the packed stat.
--- @param characterSlot integer The character slot associated with the packed stat.
--- @return integer The packed integer value for the specified index and character slot.
function stats.get_packed_stat_int(index, characterSlot) end

--- Retrieves the packed boolean value for a specified index and character slot.
--- @param index integer The index value for the packed stat.
--- @param characterSlot integer The character slot associated with the packed stat.
--- @return boolean The packed boolean value for the specified index and character slot.
function stats.get_packed_stat_bool(index, characterSlot) end

--- Sets the packed integer value for a specified index and character slot.
--- @param index integer The index value for the packed stat.
--- @param value integer The integer value to set.
--- @param characterSlot integer The character slot associated with the packed stat.
function stats.set_packed_stat_int(index, value, characterSlot) end

--- Sets the packed boolean value for a specified index and character slot.
--- @param index integer The index value for the packed stat.
--- @param value boolean The boolean value to set.
--- @param characterSlot integer The character slot associated with the packed stat.
function stats.set_packed_stat_bool(index, value, characterSlot) end

--- Sets a packed boolean value for the specified index.
--- This function sets a packed boolean value for the specified index.
--- @param index integer The index of the packed stat.
--- @param value boolean The boolean value to set.
--- @param characterSlot integer The character slot associated with the stat.
function stats.set_packed_stat_bool(index, value, characterSlot) end

--- Sets the key for a packed integer stat.
--- This function sets the key for a packed integer stat using the provided index and character information.
--- @param index integer The index of the packed stat.
--- @param spStat boolean Specifies whether the stat is a single-player stat.
--- @param charStat boolean Specifies whether the stat is a character stat.
--- @param character integer The character associated with the stat.
--- @return hash The hash key for the packed integer stat.
function stats.set_packed_int_stat_key(index, spStat, charStat, character) end

--- Sets the date for the specified stat with optional parameters.
--- This function sets the date for the specified stat using the provided year, month, day, hour, minute, second, and millisecond values.
--- @param stat_hash integer The hash value representing the stat.
--- @param year? integer The year value for the date.
---|> 0
--- @param month? integer The month value for the date.
---|> 0
--- @param day? integer The day value for the date.
---|> 0
--- @param hour? integer The hour value for the time.
---|> 0
--- @param minute? integer The minute value for the time.
---|> 0
--- @param second? integer The second value for the time.
---|> 0
--- @param millisecond? integer The millisecond value for the time.
---|> 0
--- @return boolean True if the date was successfully set, false otherwise.
function stats.set_date(stat_hash, year, month, day, hour, minute, second, millisecond) end

--- Retrieves the date components stored in a specified stat.
--- This function retrieves the date components (year, month, day, hour, minute, second, and millisecond) stored in the specified stat.
--- If the stat does not exist or is not a date stat, an empty Lua table is returned.
--- @param stat_hash hash The hash identifier for the stat.
--- @return table A Lua table containing the date components if the stat exists and is valid; otherwise, an empty table.
--- @example
--- -- Example usage:
--- local stat_hash = 0x12345678
--- local date = stats.get_date(stat_hash, _G)
--- if next(date) then
---     print("Date:", date.year, date.month, date.day)
---     print("Time:", date.hour, date.minute, date.second, date.millisecond)
--- else
---     print("Stat does not exist or is not a date stat.")
--- end
function stats.get_date(stat_hash, lua) end

--- Retrieves the character index of the last multiplayer character.
--- Basically returns "MPPLY_LAST_MP_CHAR" stat value.
--- @return integer The character index.
function stats.get_character_index() end