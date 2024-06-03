---@diagnostic disable

---@meta _

--- Enumeration for mouse buttons.
MouseButton = {
    --- Left mouse button.
    LBUTTON = 0,

    --- Right mouse button.
    RBUTTON = 1,

    --- Middle mouse button.
    MBUTTON = 2,
}

--- Enumeration for mouse click regions.
MouseClickRegion = {
    --- Mouse click within the game area.
    GAME = 0,

    --- Mouse click within the menu area.
    MENU = 1,
}

---@module events
events = {}

--- Registers a callback that is called when a player joins.
--- @param callback fun(ply: player_t):void
function events.on_player_join(callback) end

--- Registers a callback that is called when a player leaves.
--- @param callback fun(ply: player_t):void
function events.on_player_left(callback) end

--- Registers a callback that is called when a player becomes active.
--- @param callback fun(ply: player_t):void
function events.on_player_active(callback) end

--- Registers a callback that is called when adding a player.
--- This callback may return a boolean to determine whether to block the player's entry.
--- @param callback fun(name: string, rid: number):boolean|nil
function events.on_player_adding(callback) end

--- Registers a callback that is called when a session is joined.
--- @param callback fun():void
function events.on_session_join(callback) end

--- Registers a callback that is called when a session is left.
--- @param callback fun():void
function events.on_session_left(callback) end

--- Registers a callback that is called when the game state changes.
--- @param callback fun(prev_state: number, cur_state: number):void
function events.on_game_state(callback) end

--- Registers a callback that is called when the local player is spawned.
--- This callback can determine if the spawn was in an online session or single-player.
--- @param callback fun(is_online: boolean):void
function events.on_spawn(callback) end

--- Registers a callback that is called when the local player dies.
--- @param callback fun():void
function events.on_death(callback) end

--- Registers a callback that is called when a script starts.
--- @param callback fun(script_name: string):void
function events.on_script_started(callback) end

--- Registers a callback that is called when a script stops.
--- The reason parameter indicates why the script stopped:
--- 0 = stopped using SCRIPT::TERMINATE_THIS_THREAD
--- 1 = exited from the main function of the script (script ended normally)
--- 2 = script terminated unexpectedly
--- @param callback fun(script_name: string, reason: number):void
function events.on_script_stopped(callback) end

--- Registers a callback that is called on key state change.
--- @param callback fun(key: string, is_down: boolean):void
function events.on_key_state(callback) end

--- Registers a callback that is called at the end of the transition to online or single-player mode.
--- This event usually signifies that the player gains control over the character.
--- In single-player, this typically occurs after the main character's cutscene ends,
--- and in online, after the camera descends from the sky.
--- @param callback fun(is_online: boolean):void
function events.on_transition_end(callback) end

--- Registers a callback that is called when the player fully enters single-player for the first time.
--- @param callback fun():void
function events.on_first_singleplayer_join(callback) end

--- Registers a callback that is called for the game window's WindowProc.
--- Returning a value from this callback can stop further processing of the Windows message.
--- @param callback fun(hwnd: number, uMsg: number, wParam: number, lParam: number):number|nil
function events.on_window_proc(callback) end

--- Registers a callback that is called when a player shoots a weapon.
--- @param callback fun(ply: player_t, weapon: number):void
function events.on_player_shot(callback) end

--- Registers a callback that is called when a player is detected as a modder.
--- The `params` argument is a key-value table that provides additional details about the detection.
--- This table may contain nested tables, and each value is formatted based on its type.
--- @param callback fun(ply: player_t, flag: number, params: table):void
function events.on_modder_detected(callback) end

--- Registers a callback that is called when a script migrates to another player.
--- @param callback fun(is_freemode: boolean, is_you: boolean, script_name: string, ply: player_t):void
function events.on_script_migrate(callback) end

--- Registers a callback that is called when synchronization is blocked for a player.
--- @param callback fun(ply: player_t, reason: string, ban_time: number):void
function events.on_sync_blocked(callback) end

--- Registers a callback that is called when a script event is received.
--- The `args` table contains script arguments starting from index 2 (ignoring the header and sender's index).
--- @param callback fun(ply: player_t, hash: number, args: table):void
function events.on_script_event(callback) end

--- Registers a callback that is called when the session host changes.
--- @param callback fun(ply: player_t):void
function events.on_session_host_changed(callback) end

--- Registers a callback that is called when a pedestrian receives a weapon.
--- @param callback fun(ped: number, weapon_hash: number, ammo_count: number):void
function events.on_weapon_received(callback) end

--- Registers a callback that is called when a chat message is received from a player.
--- @param callback fun(ply: player_t, text: string):void
function events.on_chat_msg(callback) end

--- Registers a callback that is called during the UI drawing call of the product.
--- Drawing using the draw namespace and other namespaces that handle drawing is allowed here.
--- @param callback fun():void
function events.on_frame(callback) end

--- Registers a callback that is called every script tick.
--- Usage of functions like sleep and yield, and infinite loops are prohibited here.
--- @param callback fun():void
function events.on_script_tick(callback) end

--- Registers a callback that is called when exiting a vehicle.
--- @param callback fun(vehicle: number, was_driver: boolean):void
function events.on_vehicle_leave(callback) end

--- Registers a callback that is called when entering a vehicle.
--- @param callback fun(vehicle: number, is_driver: boolean):void
function events.on_vehicle_enter(callback) end

--- Registers a callback that is called every time the UI of the product is "compiled".
--- @param callback fun():void
function events.on_build_ui(callback) end

--- Registers a callback that is called for networked game events.
--- The `event_info` table contains the event id and name.
--- @param callback fun(ply: player_t, event_info: {id: number, name: string}, buf: CBitBufferRead):void
function events.on_net_game_event(callback) end

--- Registers a callback that is called when a player joins using your RockstarID.
--- @param callback fun(rid: number):void
function events.on_player_rid_join(callback) end

--- Registers a callback that is called when a player stops spectating another player.
--- @param callback fun(ply: player_t, ply_target: player_t, is_you: boolean):void
function events.on_stop_spectating(callback) end

--- Registers a callback that is called when a player starts spectating another player.
--- @param callback fun(ply: player_t, ply_target: player_t, is_you: boolean):void
function events.on_spectating(callback) end

--- Registers a callback that is called when the script initializes.
--- @param callback fun():void
function events.on_init(callback) end

--- Registers a callback that is called when the script is completed.
--- @param callback fun():void
function events.on_done(callback) end

--- Registers a callback that is called to determine whether synchronization data can be applied to an entity.
--- @param callback fun(ply: player_t, node: SyncDataNode, ent: entity_t):boolean|nil
function events.on_sync_can_apply(callback) end

--- Registers a callback that is called when a mouse click occurs within the game window or menu.
--- If a click occurs in the menu area, the x and y coordinates will be relative to the menu's
--- position. If it occurs in the game area, the coordinates are relative to the game window.
---
--- @param callback fun(button: MouseButton, region: MouseClickRegion, x: number, y: number): void
function events.on_mouse_click(callback) end