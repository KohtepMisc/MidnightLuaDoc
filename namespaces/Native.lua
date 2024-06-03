---@diagnostic disable

---@meta _

---@module native
native = {}

--- Enum for defining the return type of native functions.
NativeReturnType = {
    NONE = 0,     -- The function returns void.
    BOOL = 1,     -- The function returns a boolean.
    INT = 2,      -- The function returns an integer.
    FLOAT = 3,    -- The function returns a floating point number.
    STRING = 4,   -- The function returns a string.
    VECTOR3 = 5   -- The function returns a Vector3 object.
}

--- Invokes a game native function using its hash.
--- This function is a wrapper for calling in-game script functions.
--- @param return_type NativeReturnType The numeric type of the result expected from the native call.
--- @param id integer The hash identifier of the native function to call.
--- @param ... The arguments to pass to the native function.
--- @return any The result of the native function call. The type of the result depends on the `return_type`.
--- Example:
--- local player = 0  -- Example player ID, typically obtained from the game.
--- local ped = native.invoke(NativeReturnType.INT, 0x43A66C31C68491C0, player)
--- -- This example calls PLAYER.GET_PLAYER_PED, which returns the ped handle for the given player ID.
function native.invoke(return_type, id, ...) end

--- Checks if the native function invoker is ready for calling script functions.
--- @return boolean True if native functions can be called via the invoker, false otherwise.
function native.is_invoker_ready() end

--- Retrieves the simple name of a native function based on its hash.
--- This function returns only the function name without namespace or any additional qualifiers.
--- @param hash integer The hash identifier of the native function.
--- @return string The simple name of the native function if found, empty string otherwise.
--- Example:
--- local name = native.get_native_name(0x43A66C31C68491C0)
--- print(name) -- Output: GET_PLAYER_PED
function native.get_native_name(hash) end

--- Retrieves the full name of a native function based on its hash.
--- This function returns the fully qualified name including any namespaces and additional qualifiers.
--- @param hash integer The hash identifier of the native function.
--- @return string The full name of the native function if found, empty string otherwise.
--- Example:
--- local fullName = native.get_native_name_full(0x43A66C31C68491C0)
--- print(fullName) -- Output: PLAYER::GET_PLAYER_PED
function native.get_native_name_full(hash) end

--- Retrieves the namespace of a native function based on its hash.
--- This function returns the namespace to which the native function belongs.
--- @param hash integer The hash identifier of the native function.
--- @return string The namespace of the native function if found, empty string otherwise.
--- Example:
--- local namespace = native.get_native_namespace(0x43A66C31C68491C0)
--- print(namespace) -- Output: PLAYER
function native.get_native_namespace(hash) end