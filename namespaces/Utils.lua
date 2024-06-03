---@diagnostic disable

---@meta _

---@module utils
utils = {}

---@enum DateFormat
DateFormat = {
    DD_MM_YYYY = 1,
    MM_DD_YYYY = 2,
    YYYY_MM_DD = 3
}

---@enum TimeFormat
TimeFormat = {
    H12 = 1,
    H24 = 2
}

--- Retrieves text currently stored in the clipboard.
---
--- @return string The text currently in the clipboard.
function utils.get_clipboard() end

--- Sets the specified text to the clipboard.
---
--- @param message string The text to be set to the clipboard.
--- @return boolean True if the text was successfully set to the clipboard, otherwise false.
function utils.set_clipboard(message) end

--- Retrieves the current mouse cursor position.
--- This function checks the position of the cursor in screen coordinates.
--- It returns a tuple where the first element indicates if the position was successfully retrieved,
--- and the second and third elements are the x and y coordinates of the cursor.
---
--- @return boolean, number, number True if the position was retrieved successfully along with the x and y coordinates of the mouse cursor. Returns False, 0.0, 0.0 if unsuccessful.
function utils.get_mouse_pos() end

--- Sets the mouse cursor to a specified position on the screen.
--- This function allows a Lua script to programmatically move the mouse cursor to a specific location.
---
--- @param x integer The x-coordinate to set the mouse cursor.
--- @param y integer The y-coordinate to set the mouse cursor.
--- @return boolean True if the cursor was successfully moved, otherwise false.
function utils.set_mouse_pos(x, y) end

--- Calculates the angles in degrees that will point a given forward vector.
--- This function computes the pitch, yaw, and roll angles from a given forward vector,
--- returning these angles as a tuple.
---
--- @param forward Vector3 The vector representing the forward direction.
--- @return number, number, number The pitch, yaw, and roll angles calculated from the forward vector.
function utils.vector_angles(forward) end

--- Converts a world coordinate to screen coordinates in a game.
--- This function attempts to project a 3D point from the world space into the 2D screen space.
--- It returns a tuple where the first element indicates success of the conversion,
--- and the second and third elements are the x and y screen coordinates.
---
--- @param world Vector3 The world vector to be converted to screen coordinates.
--- @return boolean, number, number True and the x, y screen coordinates if the conversion is successful. Returns False, 0.0, 0.0 if unsuccessful.
function utils.world_to_screen(world) end

--- Checks if the specified key is currently being pressed.
--- This function queries the current state of a specified key and returns true if it is being pressed,
--- and false otherwise.
---
--- @param key integer The numeric code of the key to check.
--- @return boolean True if the key is pressed, false if not.
function utils.get_key_state(key) end

--- Retrieves the name of a key from its numeric code.
--- This function translates a numeric key code into a human-readable string representing the key,
--- considering any modifier keys (Shift, Ctrl, Alt) combined with the main key. The result includes
--- any relevant key names such as 'F1', 'Ctrl+A', or simple character representations like 'A'.
---
--- @param key integer The numeric code of the key.
--- @return string The name of the key including any modifiers.
function utils.get_key_name(key) end

--- Stops the currently executing Lua script.
---
--- @return boolean True if the script was successfully stopped, false if the script was not loaded or could not be stopped.
function utils.stop_script() end

--- Reloads the currently executing Lua script.
---
--- @return boolean True if the script was successfully reloaded, otherwise false.
function utils.reload_script() end

--- Retrieves the current frames per second (FPS) rate.
--- This function returns the number of frames rendered in the last second, which is useful for performance monitoring
--- and debugging purposes. It provides a direct measure of the rendering performance of the application or game.
---
--- @return integer The current FPS value.
function utils.get_fps() end

--- Calculates the current frame rate as the time per frame in seconds.
--- This function returns the duration of each frame in seconds, calculated as the reciprocal of the FPS value.
--- This measure is useful for understanding frame timing and optimizing frame-based operations.
---
--- @return number The time duration of one frame in seconds.
function utils.get_frame_rate() end

--- Retrieves the current date formatted according to the specified format.
--- This function returns the current system date as a tuple (year, month, day), with the order depending on the specified format.
--- It is useful for obtaining formatted date information for logging, user interfaces, or any other date-related functionality.
---
--- @param format DateFormat The desired format of the date output.
--- @return integer, integer, integer The formatted date as year, month, and day, based on the specified format.
function utils.get_current_date(format) end

--- Retrieves the current system time formatted according to the specified time format.
--- This function returns the current system time as a tuple (hour, minute, second), where the hour is formatted
--- either in a 24-hour or 12-hour format, depending on the specified format.
--- It's useful for displaying time or logging time-dependent events.
---
--- @param format TimeFormat The desired format of the time output.
--- @return integer, integer, integer The formatted time as hour, minute, and second, based on the specified format.
function utils.get_current_time(format) end

--- Retrieves the current time in milliseconds since the Unix epoch (January 1, 1970).
---
--- @return integer The number of milliseconds elapsed since the Unix epoch.
function utils.get_current_time_millis() end

--- Retrieves the current time in seconds since the Unix epoch (January 1, 1970).
---
--- @return integer The number of seconds elapsed since the Unix epoch.
function utils.get_current_unix_time_seconds() end

--- Executes a given Lua function in a separate thread.
--- This function allows asynchronous execution of Lua code in a new thread, which can be useful for performing
--- tasks that are long-running or need to be executed without blocking the main thread. The function ensures
--- that the Lua environment is properly locked during execution to prevent race conditions.
---
--- @param lua_function function The Lua function to be executed asynchronously.
function utils.execute_in_os_thread(lua_function) end

--- Loads a Lua module asynchronously in a separate thread.
---
--- This function starts a new thread to load and execute a Lua file specified by the 'file' parameter using the 'require' function.
--- It is beneficial for loading modules without freezing the main thread, suitable for applications requiring background loading 
--- of resources or modules.
---
--- Upon completion, the specified 'on_load' callback is invoked with the result returned by the 'require' function. If the 'require' 
--- function fails to load the module, 'nil' is passed to the callback.
---
--- @param file string The path to the file within the Lua scripts folder to be loaded (e.g. "lib\json").
--- @param on_load? fun(result):void The optional callback function that is called when the module is loaded. The result of the 'require' 
--- function is passed as an argument to this callback. If the loading fails, 'nil' is passed instead.
function utils.require_async(file, on_load) end

--- Reads data from a file with separated key-value pairs and returns it as a Lua table.
--- The function skips lines that start with '#' and trims whitespace from keys and values.
--- @param filePath string The path to the file to be read.
--- @param separator? string The string used to separate keys from values in the file.
---|> ":"
--- @return table A Lua table containing the data read from the file.
function utils.read_colons_and_tabs_file(filePath, separator) end

--- Writes data to a file using a specified separator between key-value pairs.
--- The function assumes keys and values are strings. If a value is empty, only the key is written followed by a newline.
--- @param filePath string The path to the file to write the data to.
--- @param data table The Lua table containing the data to be written.
--- @param separator? string The string used to separate keys from values in the file.
---|> ": "
--- @return boolean True if the data was successfully written to the file, false otherwise.
function utils.write_colons_file(filePath, data, separator) end

--- Yield the current fiber, causing it to pause execution and allow other fibers to run.
--- This function should be called within a coroutine managed by the fiber system.
function utils.yield() end

--- Put the current fiber to sleep for a specified duration.
--- This function suspends the execution of the current fiber for the given amount of milliseconds,
--- allowing other operations to proceed before resuming.
---@param ms integer The number of milliseconds for which the fiber should sleep.
function utils.sleep(ms) end

--- Runs the given Lua function in a new fiber, but does not repeat after the function completes.
---
--- It is important to note that all callbacks will be executed in the script thread. This means that
--- a fiber is a suitable place for calling natives, as calling them in rendering threads, for example,
--- is prohibited and if there is a need to call them there, these functions can be used.
---
--- Additionally, the callback will not be invoked instantly but only in the next game tick, which means
--- the calling function will not be able to obtain the result of the callback immediately. In cases where
--- the start time of the callback is critical, consider using the `on_script_tick` event from the `events` namespace.
---
---@param func function The Lua function to be executed within a new fiber.
---@return boolean Returns true if the function was successfully registered to run, false otherwise.
---@example Execute a fiber that prints messages with a delay:
--- utils.exec_fiber(function()
---     while true do
---         print('Fiber Loop Begin')
---         utils.sleep(25)  -- Wait for 25 milliseconds
---         print('Fiber Loop End')
---     end
--- end)
function utils.exec_fiber(func) end

--- Registers a Lua function to run in a new fiber and loops it indefinitely.
---
--- It is important to note that all callbacks will be executed in the script thread. This means that
--- a fiber is a suitable place for calling natives, as calling them in rendering threads, for example,
--- is prohibited and if there is a need to call them there, these functions can be used.
---
--- Additionally, the callback will not be invoked instantly but only in the next game tick, which means
--- the calling function will not be able to obtain the result of the callback immediately. In cases where
--- the start time of the callback is critical, consider using the `on_script_tick` event from the `events` namespace.
---
---@param func function The Lua function to be executed within the fiber indefinitely.
---@return boolean Returns true if the function was successfully registered to loop, false otherwise.
---@example Continuously execute a fiber that prints messages with a delay:
--- utils.loop_fiber(function()
---     print('Fiber Begin')
---     utils.sleep(25)  -- Wait for 25 milliseconds
---     print('Fiber End')
--- end)
function utils.loop_fiber(func) end

--- Teleports the local player to specified coordinates.
--- @overload fun(coords: Vector3): Teleports the player to a Vector3 position.
--- @overload fun(x: number, y: number, z: number): Teleports the player to specified x, y, z coordinates.
--- @param coords Vector3 The coordinates to teleport the player to.
--- @param x number The x coordinate to teleport the player to.
--- @param y number The y coordinate to teleport the player to.
--- @param z number The z coordinate to teleport the player to.
function utils.teleport_self(coords) end

--- Teleports an entity to specified coordinates.
--- @overload fun(ent: Entity, coords: Vector3): Teleports the entity to a Vector3 position.
--- @overload fun(ent: Entity, x: number, y: number, z: number): Teleports the entity to specified x, y, z coordinates.
--- @param ent Entity The entity to teleport.
--- @param coords Vector3 The coordinates to teleport the entity to.
--- @param x number The x coordinate to teleport the entity to.
--- @param y number The y coordinate to teleport the entity to.
--- @param z number The z coordinate to teleport the entity to.
function utils.teleport_entity(ent, coords) end

--- Changes the local player's model to the specified pedestrian model.
--- @overload fun(model: integer): Changes the player model using a model hash.
--- @overload fun(model: string): Changes the player model using a model name, which is converted to a hash.
--- @param model integer|string The hash of the model or the model name to set for the player.
--- @return boolean Returns true if the model change process is initiated successfully.
function utils.change_self_model(model) end

--- Calculates the amount of experience points (RP) required to achieve a specified rank.
--- @param level unsigned The level for which to calculate the required RP.
--- @return int The amount of RP needed to reach the specified level.
function utils.get_rp_required_for_rank(level) end

--- Returns a bitflag integer representing the players currently present in the session.
--- Each bit in the result corresponds to a player index, where set bits indicate the presence of the player.
--- For example, if players with indexes 1, 2, and 5 are present, the bits at these positions will be set.
--- The resulting bitflag would be represented as follows:
--- Decimal: 38, Hexadecimal: 0x26, Binary: 0b100110.
--- @param ignoreLocalPlayer boolean? Whether to ignore the local player in the bitflag.
---|> true
--- @return unsigned The bitflag representing the players in the session.
function utils.get_session_players_bitflag(ignoreLocalPlayer) end

--- Retrieves the ground Z coordinate at the specified X, Y location.
--- This function is a wrapper over MISC::GET_GROUND_Z_FOR_3D_COORD, which tries to store the Z coordinate of the highest ground below the given point.
--- It must be called within a fiber; otherwise, it will fail and return 0.0.
--- @param x number The X coordinate of the point.
--- @param y number The Y coordinate of the point.
--- @param z_hint? number A hint for the Z coordinate to optimize the search.
---|> 1000.0
--- @return number The ground Z coordinate at the specified location or 0.0 if the function fails.
function utils.get_ground_z(x, y, z_hint) end

--- Attempts to reverse a JOAAT hash back to a corresponding string using internal hash lists.
--- It is important to note that this function does not guarantee the retrieval of the exact original string from a hash,
--- as hash functions in general, including JOAAT, are irreversible. The search relies on pre-existing hash lists.
--- @param hash integer The JOAAT hash to reverse.
--- @return string A string that corresponds to the hash if found in the internal lists; otherwise, returns an empty string.
function utils.reverse_joaat(hash) end