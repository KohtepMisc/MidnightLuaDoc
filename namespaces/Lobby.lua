---@diagnostic disable

---@meta _

---@enum RidJoinMethod
RidJoinMethod = {
	FRIEND = 0,
	PRESENCE = 1
}

---@enum SessionJoinMethod
SessionJoinMethod = {
    PUBLIC = 0,
    NEW_PUBLIC = 1,
    CREW = 12,
    NEW_CREW = 3,
    NEW_CREW_CLOSED = 2,
    FRIENDS = 9,
    NEW_FRIENDS_CLOSED = 6,
    SOLO = 10,
    INVITE = 11
}

---@enum TransitionState
TransitionState = {
    EMPTY = 0,
    SP_SWOOP_UP = 1,
    MP_SWOOP_UP = 2,
    CREATOR_SWOOP_UP = 3,
    PRE_HUD_CHECKS = 4,
    WAIT_HUD_EXIT = 5,
    WAIT_FOR_SUMMON = 6,
    SP_SWOOP_DOWN = 7,
    MP_SWOOP_DOWN = 8,
    CANCEL_JOINING = 9,
    RETRY_LOADING = 10,
    RETRY_LOADING_SLOT_1 = 11,
    RETRY_LOADING_SLOT_2 = 12,
    RETRY_LOADING_SLOT_3 = 13,
    RETRY_LOADING_SLOT_4 = 14,
    WAIT_ON_INVITE = 15,
    PREJOINING_FM_SESSION_CHECKS = 16,
    LOOK_FOR_FRESH_JOIN_FM = 17,
    LOOK_TO_JOIN_ANOTHER_SESSION_FM = 18,
    CONFIRM_FM_SESSION_JOINING = 19,
    WAIT_JOIN_FM_SESSION = 20,
    CREATION_ENTER_SESSION = 21,
    PRE_FM_LAUNCH_SCRIPT = 22,
    FM_TEAMFULL_CHECK = 23,
    START_FM_LAUNCH_SCRIPT = 24,
    FM_TRANSITION_CREATE_PLAYER = 25,
    IS_FM_AND_TRANSITION_READY = 26,
    FM_SWOOP_DOWN = 27,
    POST_BINK_VIDEO_WARP = 28,
    FM_FINAL_SETUP_PLAYER = 29,
    MOVE_FM_TO_RUNNING_STATE = 30,
    FM_HOW_TO_TERMINATE = 31,
    START_CREATOR_PRE_LAUNCH_SCRIPT_CHECK = 32,
    START_CREATOR_LAUNCH_SCRIPT = 33,
    CREATOR_TRANSITION_CREATE_PLAYER = 34,
    IS_CREATOR_AND_TRANSITION_READY = 35,
    CREATOR_SWOOP_DOWN = 36,
    CREATOR_FINAL_SETUP_PLAYER = 37,
    MOVE_CREATOR_TO_RUNNING_STATE = 38,
    PREJOINING_TESTBED_SESSION_CHECKS = 39,
    LOOK_FOR_FRESH_JOIN_TESTBED = 40,
    LOOK_FOR_FRESH_HOST_TESTBED = 41,
    LOOK_TO_JOIN_ANOTHER_SESSION_TESTBED = 42,
    LOOK_TO_HOST_SESSION_TESTBED = 43,
    CONFIRM_TESTBED_SESSION_JOINING = 44,
    WAIT_JOIN_TESTBED_SESSION = 45,
    START_TESTBED_LAUNCH_SCRIPT = 46,
    TESTBED_TRANSITION_CREATE_PLAYER = 47,
    IS_TESTBED_AND_TRANSITION_READY = 48,
    TESTBED_SWOOP_DOWN = 49,
    TESTBED_FINAL_SETUP_PLAYER = 50,
    MOVE_TESTBED_TO_RUNNING_STATE = 51,
    TESTBED_HOW_TO_TERMINATE = 52,
    QUIT_CURRENT_SESSION_PROMPT = 53,
    WAIT_FOR_TRANSITION_SESSION_TO_SETUP = 54,
    TERMINATE_SP = 55,
    WAIT_TERMINATE_SP = 56,
    KICK_TERMINATE_SESSION = 57,
    TERMINATE_SESSION = 58,
    WAIT_TERMINATE_SESSION = 59,
    TERMINATE_SESSION_AND_HOLD = 60,
    TERMINATE_SESSION_AND_MOVE_INTO_HOLDING_STATE = 61,
    TEAM_SWAPPING_CHECKS = 62,
    RETURN_TO_SINGLEPLAYER = 63,
    WAIT_FOR_SINGLEPLAYER_TO_START = 64,
    WAITING_FOR_EXTERNAL_TERMINATION_CALL = 65,
    TERMINATE_MAINTRANSITION = 66,
    WAIT_FOR_DIRTY_LOAD_CONFIRM = 67,
    DLC_INTRO_BINK = 68
}

---@module lobby
lobby = {}

--- Checks if the current network session is active.
--- This function calls the NETWORK::NETWORK_IS_SESSION_ACTIVE function to determine the active status of the session.
---@return boolean Returns true if the session is active, false otherwise.
function lobby.is_session_active() end

--- Joins a session by Rockstar ID. This function allows specifying a method variant via an enum parameter.
---@param rid number The Rockstar ID of the session to join.
---@param method RidJoinMethod Specifies join method.
function lobby.join_by_rid(rid, method) end

--- Joins a new session.
--- @param session SessionJoinMethod
function lobby.join_session(session) end

--- Checks if the global "Off the Radar" mode is active.
--- This mode hides all players in the lobby from the global game map.
---@return boolean Returns true if the global OTR mode is active, false otherwise.
function lobby.is_global_otr() end

--- Activates the global "Off the Radar" mode.
--- This mode hides all players in the lobby from the global game map.
function lobby.global_otr_on() end

--- Deactivates the global "Off the Radar" mode.
--- This disables the effect that hides all players in the lobby from the global game map.
function lobby.global_otr_off() end

--- Checks if the session is currently locked.
---@return boolean Returns true if the session is locked, preventing new players from joining.
function lobby.is_locked() end

--- Checks if notifications for locker operations are enabled.
---@return boolean Returns true if locker notifications are enabled.
function lobby.is_locker_notify_on() end

--- Locks the session to prevent new players from joining.
--- Returns true if the lock operation was successful or if the player is not in an online lobby.
---@return boolean Returns true if the session was successfully locked or if not in an online lobby.
function lobby.lock() end

--- Checks if the host lock method is active.
--- This method is used when the local player is the session host.
---@return boolean Returns true if the host lock method is active.
function lobby.is_host_lock() end

--- Checks if the non-host lock method is active.
--- This method can be bypassed by players with certain capabilities and is used when the local player is not the session host.
---@return boolean Returns true if the non-host lock method is active.
function lobby.is_non_host_lock() end

--- Checks if the smart lock method is active.
--- This method automatically chooses the locking method based on the session conditions.
---@return boolean Returns true if the smart lock method is active.
function lobby.is_smart_lock() end

--- Sets the locking method to host.
--- This is the most secure and recommended method, effective only when the local player is the host.
function lobby.set_lock_method_host() end

--- Sets the locking method to non-host.
--- This method can be bypassed and is used when the local player is not the host.
function lobby.set_lock_method_nonhost() end

--- Sets the locking method to smart.
--- Automatically selects the lock method based on the current session conditions.
function lobby.set_lock_method_smart() end

--- Turns all players in the lobby into beasts.
function lobby.turn_all_into_beast() end

--- Turns a specific player into a beast.
---@param player player_t The player to transform into a beast.
function lobby.turn_into_beast(player) end

--- Kicks all players marked as modders from the lobby.
function lobby.kick_all_modders() end

--- Kicks a random player from the lobby.
function lobby.kick_random_player() end

--- Quits the current lobby.
function lobby.quit() end

--- Forces a quit from the current lobby and loads the most recent save.
--- This function can be particularly useful if a player is stuck during the loading process, such as being stuck in the clouds when entering a lobby.
function lobby.quit_forced() end

--- Kicks the current script host.
function lobby.kick_script_host() end

--- Kicks the current session host of the 'freemode' script.
function lobby.kick_session_host() end

--- Performs a quick exit from the lobby, similar to being kicked.
function lobby.kick_me() end

---@return TransitionState Current transition state.
function lobby.get_transition_state() end

--- Starts spectating a specific player.
---@param player player_t The player to start spectating.
function lobby.start_spectate(player) end

--- Stops spectating the currently spectated player.
function lobby.stop_spectate() end

--- Checks if the local player is in spectator mode.
---@return boolean Returns true if the local player is in spectator mode, false otherwise.
function lobby.is_spectating() end

--- Checks if the current session is a mission session.
--- The function searches for specific mission script hashes, including 'fm_mission_controller' and 'am_mission_launch'.
---@return boolean Returns true if the session is a mission, otherwise false.
function lobby.is_mission() end

--- Checks if a matchmaking search is currently in progress.
--- This function verifies if the matchmaking query has started and the player list is available but not fully populated yet.
--- It is important to note that player information cannot be fetched through native functions during this state.
---@return boolean Returns true if a matchmaking search is in progress, otherwise returns false.
function lobby.is_searching() end

--- Checks if a network session has fully started.
--- Indicated that the player list is available and fully populated.
---@return boolean Returns true if the network session has started, otherwise returns false.
function lobby.is_session_started() end