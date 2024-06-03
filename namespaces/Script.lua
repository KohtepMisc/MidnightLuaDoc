---@diagnostic disable

---@meta _

---@module script
script = {}

---@enum ScriptEventId
ScriptEventId = {
    ISLAND = 0,
    INTERIOR_TELEPORT = 1,
    SEND_TO_MISSION = 2,
    SEND_TO_MISSION_ALT = 3,
    CHAT_MESSAGE_SPOOF_DETECT = 4,
    CRASH = 5,
    NETBAIL_KICK = 6,
    CEO_KICK = 7,
    CEO_MONEY = 8,
    MARK_AS_BEAST = 9,
    CEO_BAN = 10,
    BANNER_SCREEN = 11,
    TRANSACTION_ERROR = 12,
    DESTROY_PERSONAL_VEHICLE = 13,
    PERSONAL_VEHICLE_DESTROYED = 14,
    KICK_FROM_PERSONAL_VEHICLE = 15,
    DISOWN_PERSONAL_VEHICLE = 16,
    VEHICLE_EMP = 17,
    OFF_THE_RADAR = 18,
    CLEAR_WANTED_LEVEL = 19,
    COPS_BLIND_EYE = 20,
    NOTIFY = 21,
    SUB_SCRIPT_ACTION_ROTATE_CAM = 22,
    BOUNTY = 23,
    CASINO_CUTSCENE = 24,
    BLOCK_PASSIVE = 25,
    SEND_TO_WAREHOUSE = 26,
    SEND_TO_VEHICLE_WAREHOUSE = 27,
    INDIRECT_SH_KICK = 28,
    INDIRECT_FREEMODE_CRASH = 29,
    TELEPORT_TO_INTERIOR = 30,
    TELEPORT_TO_CLUB_HOUSE_EXIT = 31,
    SE_SOUND_BEEP = 32,
    INVITE_TO_INTERIOR_AS_PLAYER = 33,
    INVITE_TO_INTERIOR_AS_NPC = 34,
    SEND_UNLOCKS = 35,
    SCRIPT_CRASH = 36,
    SCRIPT_CRASH_VIA_GLOBAL = 37,
    PLAY_SOUND = 38,
    GLOBAL_BUFFER_OVERWRITE_1 = 39,
    GLOBAL_BUFFER_OVERWRITE_2 = 40,
    START_SCRIPT_BEGIN = 41,
    START_SCRIPT_PROCEED = 42,
    INTERIOR_STATE = 43,
    TRIGGER_RAID = 44,
    KICK_FROM_INTERIOR = 45,
    LEVEL_CHANGE = 46,
    COORD_CRASH = 47,
    TELEPORT_TO_CAYO = 48,
    GTA_BANNER = 49,
    SPECTATE = 50,
}

--- Checks if script globals are available. Can be used to check when it is possible to work with functions like `script.get_global`.
---@return boolean Returns true if script globals are available.
function script.ready() end

--- Checks if a script is loaded by hash or name.
---@overload fun(hash:number):boolean
---@overload fun(name:string):boolean
---@return boolean Returns true if the script is loaded.
function script.is_loaded(hash_or_name) end

--- Checks if a script is currently running by hash or name.
---@overload fun(hash:number):boolean
---@overload fun(name:string):boolean
---@return boolean Returns true if the script is running.
function script.is_running(hash_or_name) end

--- Requests loading a script by hash or name.
---@overload fun(hash:number)
---@overload fun(name:string)
function script.request(hash_or_name) end

--- Starts a script by hash or name with an optional stack size and additional arguments.
---@param hash_or_name Hash|string The script hash or name.
---@param stack_size number The stack size for the new script.
---@param ... any Additional arguments to pass to the script.
---@return integer Returns the thread ID of the started script.
function script.start(hash_or_name, stack_size, ...) end

--- Spoofs a script by hash or name using a callback function.
---@overload fun(hash:number, callback:function):boolean
---@overload fun(name:string, callback:function):boolean
---@return boolean Returns true if the spoof was successful.
function script.spoof(hash_or_name, callback) end

--- Forces migration to local player a script by hash or name, with an optional callback for completion.
---@overload fun(hash:number, on_migration_finish:function)
---@overload fun(name:string, on_migration_finish:function)
---@overload fun(hash:number)
---@overload fun(name:string)
function script.force_host(hash_or_name, on_migration_finish) end

--- Returns a table containing information about all YSC scripts available in the game.
--- This table can be used to manage scripts or missions, such as starting them.
---
--- @return table A table with the following fields for each script:
---     - name (string): The name of the script.
---     - hash (number): The joaat hash of the name.
---     - index (number): The index of the script, which is used to write to globals.
---     - group (number): The group to which the script belongs.
---     - stack_size (number): The amount of stack memory allocated for the script.
---
--- Example of an element in the returned table:
--- {
---     "name" = "AM_TAXI",
---     "hash" = 1163912414,
---     "index" = 22,
---     "group" = 6,
---     "stack_size" = 5050
--- }
function script.get_yscs() end

--- Starts a freemode event (mission) by its name or hash.
--- Not all missions retrieved from script.get_yscs can be started; some might not be valid for initiation.
--- This function must be run within a fiber context.
---
--- @param name_or_hash string|number The name or joaat hash of the mission to start. Use a string for the name, or a number for the joaat hash.
---
--- @return boolean True if the mission was successfully started, false if the mission could not be found or started.
---
--- @overload fun(hash: number): boolean
--- @overload fun(name: string): boolean
---
--- @usage script.start_mission("AM_TAXI")
--- @usage script.start_mission(1163912414)
function script.start_mission(name_or_hash) end

--- Returns the Script Event hash used in the 'trigger_script_event' function.
--- This function can assist in writing a Lua script that will more stably
--- withstand game updates.
---
--- The ScriptEventId enumeration provides a list of constant values for some
--- script events that the product works with.
---
--- @param index ScriptEventId The index of the script event.
---
--- @return integer The current hash for the specified script event.
---
--- @usage local hash = script.get_tse(ScriptEventId.ISLAND) -- Will return '373376135' (1.68)
function script.get_tse(index) end

--- Returns a special magic number used for sending certain script events like 'off the radar' or 'clear wanted level'.
--- @param player number|player_t The player identifier or player object.
--- @return number The magic number for the specified player. Returns 0 if the player object is nil.
function script.get_script_magic(player) end

--- Triggers a script event for the specified player with given event hash and arguments.
--- @param player number|player_t The player identifier or player object.
--- @param hash Hash The hash of the script event to trigger.
--- @param args table A table of basic Lua types (number, integer, string, boolean, nil) to be sent as event parameters.
--- Note: The player index, usually required after the event hash, is automatically filled by the function.
--- Example:
--- local ply = player.get_random()
--- if ply ~= nil then
---     local eventArgs = {NETWORK.GET_NETWORK_TIME(), 0, ply:get_index_bit(), script.get_script_magic(ply)}
---     script.trigger_script_event(ply, script.get_tse(ScriptEventId.OFF_THE_RADAR), eventArgs)
--- end
function script.trigger_script_event(player, hash, args) end

--- @class ScrVar : CMemHandle
--- ScrVar is a base class for handling script variables tied to specific memory locations.
local ScrVar = {}

--- Accesses an element at a specific index relative to the variable's memory location.
--- @param index number The index offset from the current variable position.
--- @return ScrVar A new ScrVar instance representing the variable at the calculated position.
function ScrVar:at(index) end

--- Accesses an element at a specific index with a stride, calculated as `index * size + 1`.
--- @param index number The index offset from the current variable position.
--- @param size number The stride size for calculating the exact memory location.
--- @return ScrVar A new ScrVar instance representing the variable at the calculated position.
function ScrVar:at(index, size) end

--- Returns the numeric address to which the ScrVar object is bound. Based on this address,
--- the calculation of the final variable address (base + index) occurs.
---
--- For ScrLocal objects, this method returns the stack address belonging to the script.
--- For ScrGlobal objects, this method always returns the address of the global variables (ScriptGlobals).
---
--- @return base number The base address as a number.
function ScrVar:get_base() end

--- Returns the offset relative to the base address of the ScrVar object.
---
--- For ScrLocal objects, it returns the actual offset, determining the index of the stack cell.
--- For ScrGlobal objects, it returns an encoded number containing the block index and the cell index
--- of the variable in global memory.
---
--- @return index number The index of the script variable.
function ScrVar:get_index() end

--- @return result boolean Returns true if the object is a ScrLocal class, false otherwise.
function ScrVar:is_local() end

--- @return result boolean Returns true if the object is a ScrGlobal class, false otherwise.
function ScrVar:is_global() end

--- @class ScrGlobal : ScrVar
--- Represents global script variables.
ScrGlobal = {}

--- @class ScrLocal : ScrVar
--- Represents local script variables specific to script threads.
ScrLocal = {}

--- Retrieves a global script variable.
--- @param index number The index of the global variable.
--- @return ScrGlobal A ScrGlobal instance representing the global variable at the given index.
function script.get_global(index) end

--- Retrieves a local script variable by name or hash and index.
--- @overload fun(name: string, index: number): ScrLocal
--- @overload fun(hash: integer, index: number): ScrLocal
--- @param string_or_hash string|integer The script thread name or hash to identify the local script context.
--- @param index number The index of the local variable within the specified script or thread context.
--- @return ScrLocal A ScrLocal instance representing the local variable at the given index in the specified script context.
function script.get_local(string_or_hash, index) end