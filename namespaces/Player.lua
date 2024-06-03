---@diagnostic disable

---@meta _

---@enum PlayersSort
PlayersSort = {
    NO_SORT = 0, -- No sorting applied.
    NAME = 1, -- Sort by player's name.
    HOST_QUEUE = 2, -- Sort by host queue position.
    DISTANCE = 3, -- Sort by distance to the player.
    RANK = 4, -- Sort by player's rank.
    MONEY_IN_TOTAL = 5, -- Sort by total amount of money.
    KD_RATIO = 6, -- Sort by kill/death ratio.
    CONNECTION_TIME = 7 -- Sort by connection time.
}

---@class player_t
player_t = {}

--- Returns the entity handle of the player.
---@return number The entity handle of the player.
function player_t:get_id() end

--- Returns the network handle of the player.
---@return number The network handle (ObjectId) of the player.
function player_t:get_netid() end

--- Retrieves the index of the player.
--- This index ranges from 0 to 31, representing the player's slot in the game.
---@return integer The index of the player.
function player_t:get_index() end

--- Returns a pointer to the underlying rage::fwEntity object.
---@return userdata A pointer to the rage::fwEntity object.
function player_t:get_entity_ptr() end

--- Returns a pointer to the underlying rage::netObject.
---@return userdata A pointer to the rage::netObject.
function player_t:get_netobj_ptr() end

--- Returns the handle of the player's interior.
---@return integer The handle of the interior in which the player is located.
function player_t:get_interior() end

--- Checks if the player is currently rendered on the screen.
---@return boolean Returns true if the player is on the screen, false otherwise.
function player_t:is_on_screen() end

--- Retrieves the world coordinates of the player.
---@return number, number, number The x, y, and z coordinates of the player in the game world.
function player_t:get_coords() end

--- Retrieves the screen coordinates of the player.
---@return number, number The x and y coordinates of the player on the screen.
function player_t:get_screen() end

--- Retrieves the angles of the player in Euler angles (pitch, yaw, roll).
---@return number, number, number The pitch, yaw, and roll angles of the player.
function player_t:get_angles() end

--- Retrieves the minimum bounding coordinates of the player.
---@return number, number, number The minimum x, y, and z coordinates of the player's bounding box.
function player_t:get_mins() end

--- Retrieves the maximum bounding coordinates of the player.
---@return number, number, number The maximum x, y, and z coordinates of the player's bounding box.
function player_t:get_maxs() end

--- Retrieves the forward vector of the player.
---@return number, number, number The x, y, and z components of the forward vector.
function player_t:get_forward() end

--- Retrieves the right vector of the player.
---@return number, number, number The x, y, and z components of the right vector.
function player_t:get_right() end

--- Retrieves the up vector of the player.
---@return number, number, number The x, y, and z components of the up vector.
function player_t:get_up() end

--- Gets the heading of the player in degrees.
---@return number The heading of the player, representing the direction it is facing.
function player_t:get_heading() end

--- Calculates the distance from the local player to the another player.
---@return number The distance from the local player to the another player.
function player_t:get_distance() end

--- Retrieves the current health of the player.
---@return integer The current health of the player.
function player_t:get_health() end

--- Retrieves the maximum health of the player.
---@return integer The maximum health of the player.
function player_t:get_health_max() end

--- Checks if the player is alive.
---@return boolean Returns true if the player is alive, false if dead or the health is zero or below.
function player_t:is_alive() end

--- Checks if the player is dead.
---@return boolean Returns true if the player's health is zero or below, false otherwise.
function player_t:is_dead() end

--- Returns a bitmask corresponding to the player's index.
--- The bitmask is calculated as '1 << get_index()'.
---@return integer The bitmask for the player's index.
function player_t:get_index_bit() end

--- Returns 0 if the player is not in any vehicle.
---@return integer The handle of the vehicle or 0 if the player is not in a vehicle.
function player_t:get_vehicle() end

--- Gets the model hash of the player.
---@return integer The model hash of the player.
function player_t:get_model() end

--- Checks if the player is active.
--- A player is considered active if they are currently connected and have a pedestrian entity.
---@return boolean Returns true if the player is active, false otherwise.
function player_t:is_active() end

--- Validates the player's object.
--- Performs several checks to ensure the player's data structures are properly initialized and valid.
---@return boolean Returns true if the player is considered valid, false otherwise.
function player_t:is_valid() end

--- Returns a pointer to the CPlayerInfo object.
---@return userdata A pointer to the CPlayerInfo object.
function player_t:get_playerinfo_ptr() end

--- Checks if the player is an animal.
---@return boolean Returns true if the player is an animal, false otherwise.
function player_t:is_animal() end

--- Checks if the player is the driver of a vehicle.
---@return boolean Returns true if the player is currently driving a vehicle, false otherwise.
function player_t:is_driver() end

--- Retrieves the current armor value of the player.
---@return integer The current armor value of the player.
function player_t:get_armor() end

--- Retrieves the name of the player.
---@return string The name of the player.
function player_t:get_name() end

--- Checks if the player is sync blocked.
---@return boolean Returns true if the player is blocked.
function player_t:is_blocked() end

--- Checks if the player is marked as a modder.
---@return boolean Returns true if the player is marked as a modder.
function player_t:is_modder() end

--- Checks if this is the local player.
---@return boolean Returns true if this is the local player.
function player_t:is_local() end

--- Checks if the player is the session host.
---@return boolean Returns true if the player is the session host.
function player_t:is_session_host() end

--- Checks if the player is the script host.
---@return boolean Returns true if the player is the script host.
function player_t:is_script_host() end

--- Checks if the player is in godmode.
---@return boolean Returns true if the player is in godmode.
function player_t:is_godmode() end

--- Checks if the player is added as a friend.
---@return boolean Returns true if the player is a friend.
function player_t:is_friend() end

--- Checks if the player is marked as a cheater.
---@return boolean Returns true if the player is marked as a cheater.
function player_t:is_marked_as_cheater() end

--- Checks if the player has the Rockstar employee flag.
--- This function verifies if the player is flagged as a Rockstar employee through the native NETWORK::NETWORK_PLAYER_IS_ROCKSTAR_DEV.
--- It's important to note that the presence of this flag does not guarantee the player is an actual Rockstar employee;
--- it is more likely that a modder has tampered with their player information to appear as such.
---@return boolean Returns true if the player is marked as an admin (potentially a Rockstar employee), otherwise returns false.
function player_t:is_marked_as_admin() end

--- Checks if the player is a genuine Rockstar administrator.
--- This function verifies the player's status by comparing their RockstarID and name against an internal list.
--- This method ensures that the player is indeed a Rockstar employee and not just a modder with tampered credentials.
---@return boolean Returns true if the player is confirmed as a genuine Rockstar administrator, otherwise returns false.
function player:is_admin() end

--- Checks if the player is currently inside an interior.
---@return boolean Returns true if the player is in an interior.
function player_t:is_in_interior() end

--- Checks if the player is currently inside a vehicle.
---@return boolean Returns true if the player is in a vehicle.
function player_t:is_in_vehicle() end

--- Checks if the player is slated to be the next session host.
---@return boolean Returns true if the player is slated to be the next host.
function player_t:is_next_host() end

--- Checks if the player is currently in a falling animation.
---@return boolean Returns true if the player is falling.
function player_t:is_falling() end

--- Checks if the player is swimming on the surface of the water.
---@return boolean Returns true if the player is swimming.
function player_t:is_swimming() end

--- Checks if the player is submerged underwater.
---@return boolean Returns true if the player is underwater.
function player_t:is_underwater() end

--- Checks if the player is currently firing their weapon.
---@return boolean Returns true if the player is shooting.
function player_t:is_shooting() end

--- Checks if the player is aiming their weapon.
---@return boolean Returns true if the player is aiming.
function player_t:is_aiming() end

--- Checks if the player is driving a vehicle that is not yet legally obtainable in the game.
---@return boolean Returns true if the player is driving an unreleased vehicle.
function player_t:is_drive_unreleased_vehicle() end

--- Checks if the player is using a weapon that is modded and not legally obtainable in the game.
---@return boolean Returns true if the player is using a modded weapon.
function player_t:is_use_modded_weapon() end

--- Checks if the player is using a vehicle that is modded and not legally obtainable in the game.
---@return boolean Returns true if the player is using a modded vehicle.
function player_t:is_use_modded_vehicle() end

--- Checks if the player's vehicle is exceeding the maximum legitimate speed values.
---@return boolean Returns true if the player is using super drive capabilities.
function player_t:is_use_super_drive() end

--- Checks if the player's vehicle is currently in a godmode state, meaning it cannot be destroyed.
---@return boolean Returns true if the player's vehicle is using godmode.
function player_t:is_use_godmode_vehicle() end

--- Checks if the player has unusual or mismatched host key values.
---@return boolean Returns true if the player has the force host flag.
function player_t:has_flag_force_host() end

--- Checks if the player has spawned money in-game.
---@return boolean Returns true if the player has the money drop flag.
function player_t:has_flag_money_drop() end

--- Checks if the player's client has reported use of unauthorized products.
---@return boolean Returns true if the player has the update function flag.
function player_t:has_flag_update_fxn() end

--- Checks if there is a memory modification mismatch in the player's game client.
---@return boolean Returns true if the player has the CRCs mismatch flag.
function player_t:has_flag_crcs_mismatch() end

--- Checks if the player has sent a script event classified as malicious.
---@return boolean Returns true if the player has the malformed script flag.
function player_t:has_flag_malformed_script() end

--- Checks if the player is using modifications to jump unusually high.
---@return boolean Returns true if the player has the super jump flag.
function player_t:has_flag_super_jump() end

--- Checks if the player is using a model that cannot be normally set for players.
---@return boolean Returns true if the player has the wrong model flag.
function player_t:has_flag_wrong_model() end

--- Checks if the player has bypassed content censors.
---@return boolean Returns true if the player has the censor bypass flag.
function player_t:has_flag_censor_bypass() end

--- Checks if the player's armor values are incorrect or manipulated.
---@return boolean Returns true if the player has the malformed armor flag.
function player_t:has_flag_malformed_armor() end

--- Checks if the player has attempted to kick other players from the lobby.
---@return boolean Returns true if the player has the network kick flag.
function player_t:has_flag_network_kick() end

--- Checks if the player has attempted to crash the game for other players.
---@return boolean Returns true if the player has the crash attempt flag.
function player_t:has_flag_crash_attempt() end

--- Retrieves the game statistics of the player.
--- Returns a table containing various game statistics such as RP, GlobalRP, Rank, KdRatio, etc.
---@return table The table of game statistics.
function player_t:get_game_stats() end

--- Retrieves metadata associated with the player's CEO role.
--- Returns a table containing detailed information about the player's role in the CEO organization:
--- - owner (Player): The player index of the CEO boss.
--- - is_owner (boolean): Indicates if the current player is the boss.
--- - owner_name (string): The name of the CEO boss.
--- - is_banned (boolean): Indicates if the player is banned from CEO activities.
--- - ban_time (integer): The time remaining on the CEO ban.
--- - type (integer): Numeric identifier of the CEO role.
--- - type_str (string): String representation of the CEO role (e.g., "Vice President", "Road Captain").
--- - name (string): General name of the CEO organization.
--- - name_mc (string): Name associated with the Motorcycle Club.
--- - name_ss (string): Name associated with the SecuroServ organization.
--- - vehicle_hash (integer): Hash of the last vehicle called by the CEO.
--- - vehicle_name (string): Name of the last vehicle called by the CEO.
--- - members_count (integer): Total number of members in the CEO organization.
--- - members (table): Contains Player instances of each member.
--- - language (integer): Language setting of the player within the CEO organization.
---@return table The table of CEO metadata.
function player_t:get_ceo_meta() end

--- Checks if the player is part of a CEO organization.
---@return boolean Returns true if the player is in a CEO organization.
function player_t:is_in_ceo() end

--- Checks if the player is banned from CEO activities.
---@return boolean Returns true if the player is banned from CEO activities.
function player_t:is_ceo_banned() end

--- Checks if the player is the boss of a CEO organization.
---@return boolean Returns true if the player is the CEO boss.
function player_t:is_ceo_boss() end

--- Retrieves the time remaining on the player's CEO ban.
---@return integer The time remaining on the CEO ban in seconds.
function player_t:get_ceo_ban_time() end

--- Retrieves the player's role within the CEO organization.
---@return integer Numeric identifier of the player's CEO role.
function player_t:get_ceo_role() end

--- Retrieves the name of the CEO organization.
---@return string The name of the CEO organization.
function player_t:get_ceo_name() end

--- Retrieves the index of the CEO owner.
---@return integer The index of the CEO owner.
function player_t:get_ceo_owner() end

--- Retrieves the name of the CEO owner.
---@return string The name of the CEO owner.
function player_t:get_ceo_owner_name() end

--- Retrieves the name of the Motorcycle Club associated with the CEO.
---@return string The name of the Motorcycle Club.
function player_t:get_ceo_clubhouse_name() end

--- Retrieves the name of the SecuroServ gang associated with the CEO.
---@return string The name of the SecuroServ gang.
function player_t:get_ceo_gang_name() end

--- Retrieves the total number of members in the CEO organization.
---@return integer The total number of members.
function player_t:get_ceo_members_total() end

--- Retrieves the language setting of the CEO organization.
---@return integer The language setting as a numeric code.
function player_t:get_ceo_language() end

--- Retrieves the name of the last vehicle called by the CEO.
---@return string The name of the last called vehicle.
function player_t:get_ceo_last_called_vehicle_name() end

--- Retrieves the hash of the last vehicle called by the CEO.
---@return integer The hash of the last vehicle called.
function player_t:get_ceo_last_called_vehicle() end

--- Retrieves a list of members in the CEO organization.
---@return table A table containing the player instances of each member.
function player_t:get_ceo_members() end

--- Checks if a specified player is a member of the CEO organization of the current player.
--- This function can accept a player object or a player index as the second argument.
---@overload fun(target:player_t):boolean
---@overload fun(target_index:integer):boolean
---@param target player_t|integer The target player or the target player's index.
---@return boolean Returns true if the target player is a member of the current player's CEO organization.
function player_t:is_player_a_member_of_players_ceo(target) end

--- Retrieves detailed information about the player's outfit, including clothing and props.
--- Returns a table with the following structure:
--- {
---   variations = {
---     [1] = {model = integer, models = integer, texture = integer, textures = integer, palette = integer},
---     [2] = {model = integer, models = integer, texture = integer, textures = integer, palette = integer},
---     ... up to 12 entries
---   },
---   props = {
---     [1] = {model = integer, models = integer, texture = integer, textures = integer},
---     [2] = {model = integer, models = integer, texture = integer, textures = integer},
---     ... up to 9 entries
---   }
--- }
---@return table A table containing arrays for variations and props with detailed info about each item.
function player_t:get_outfit() end

--- Retrieves the Rockstar ID of the player.
---@return integer The Rockstar ID of the player.
function player_t:get_rockstar_id() end

--- Attempts to kick the player from the lobby.
function player_t:kick() end

--- Attempts to crash the player's game.
function player_t:crash() end

--- Blocks all synchronization with the player.
function player_t:sync_block() end

--- Unblocks synchronization with the player, if it was previously blocked.
function player_t:sync_unblock() end

--- Checks if synchronization with the player is currently blocked.
---@return boolean Returns true if synchronization is blocked, false otherwise.
function player_t:is_sync_blocked() end

--- Retrieves detailed information about the player's clan.
--- Returns a table with the following structure:
--- {
---   clan_member_id (integer): The member ID of the player in the clan.
---   clan_id (integer): The unique identifier of the clan.
---   clan_color (integer): The color code of the clan.
---   clan_member_count (integer): Total number of members in the clan.
---   clan_created_time (integer): The creation time of the clan.
---   is_system_clan (boolean): Indicates if it is a system-managed clan.
---   is_clan_open (boolean): Indicates if the clan is open for new members.
---   clan_name (string): The name of the clan.
---   clan_tag (string): The tag of the clan.
---   clan_motto (string): The motto of the clan.
---   clan_rank_name (string): The rank name of the player in the clan.
---   clan_rank_order (integer): The order of the rank within the clan.
---   clan_rank_flags (integer): Flags associated with the player's rank in the clan.
--- }
---@return table The table of clan metadata.
function player_t:get_clan_meta() end

--- Retrieves the clan member ID of the player.
---@return integer The clan member ID of the player.
function player_t:get_clan_member_id() end

--- Retrieves the unique identifier of the player's clan.
---@return integer The clan ID.
function player_t:get_clan_id() end

--- Retrieves the color code of the player's clan.
---@return integer The color code of the clan.
function player_t:get_clan_color() end

--- Retrieves the total number of members in the player's clan.
---@return integer The total number of clan members.
function player_t:get_clan_member_count() end

--- Retrieves the creation time of the player's clan.
---@return integer The creation time of the clan.
function player_t:get_clan_created_time() end

--- Checks if the player's clan is a system-managed clan.
---@return boolean Returns true if it is a system clan.
function player_t:is_system_clan() end

--- Checks if the player's clan is open for new members.
---@return boolean Returns true if the clan is open.
function player_t:is_clan_open() end

--- Retrieves the name of the player's clan.
---@return string The name of the clan.
function player_t:get_clan_name() end

--- Retrieves the tag of the player's clan.
---@return string The clan tag.
function player_t:get_clan_tag() end

--- Retrieves the motto of the player's clan.
---@return string The clan motto.
function player_t:get_clan_motto() end

--- Retrieves the rank name of the player within the clan.
---@return string The clan rank name.
function player_t:get_clan_rank_name() end

--- Retrieves the order of the player's rank within the clan.
---@return integer The rank order.
function player_t:get_clan_rank_order() end

--- Retrieves the flags associated with the player's rank within the clan.
---@return integer The rank flags.
function player_t:get_clan_rank_flags() end

--- Retrieves the maximum armor capacity of the player.
---@return integer The maximum armor value.
function player_t:get_max_armor() end

--- Retrieves the relay IP address of the player as a table of bytes or nil if unavailable.
---@return table|nil A table containing 4 bytes of the IP address or nil if the IP could not be retrieved.
function player_t:get_relay_ip() end

--- Retrieves the relay port of the player or 0 if unavailable.
---@return integer The relay port number or 0 if the port could not be retrieved.
function player_t:get_relay_port() end

--- Retrieves the public IP address of the player as a table of bytes or nil if unavailable.
---@return table|nil A table containing 4 bytes of the IP address or nil if the IP could not be retrieved.
function player_t:get_public_ip() end

--- Retrieves the public port of the player or 0 if unavailable.
---@return integer The public port number or 0 if the port could not be retrieved.
function player_t:get_public_port() end

--- Retrieves the private IP address of the player as a table of bytes or nil if unavailable.
---@return table|nil A table containing 4 bytes of the IP address or nil if the IP could not be retrieved.
function player_t:get_private_ip() end

--- Retrieves the private port of the player or 0 if unavailable.
---@return integer The private port number or 0 if the port could not be retrieved.
function player_t:get_private_port() end

--- Retrieves the relay IP address and port of the player as a string.
--- This function can omit the port based on the optional boolean parameter.
---@overload fun(include_port:boolean?):string
---@param include_port boolean Optional, if false, the port is not included in the returned string.
---@return string The relay IP address and port in the format "IP:Port" or just "IP".
function player_t:get_relay_addr(include_port) end

--- Retrieves the public IP address and port of the player as a string.
--- This function can omit the port based on the optional boolean parameter.
---@overload fun(include_port:boolean?):string
---@param include_port boolean Optional, if false, the port is not included in the returned string.
---@return string The public IP address and port in the format "IP:Port" or just "IP".
function player_t:get_public_addr(include_port) end

--- Retrieves the private IP address and port of the player as a string.
--- This function can omit the port based on the optional boolean parameter.
---@overload fun(include_port:boolean?):string
---@param include_port boolean Optional, if false, the port is not included in the returned string.
---@return string The private IP address and port in the format "IP:Port" or just "IP".
function player_t:get_private_addr(include_port) end

--- Copies the outfit from this player (source) to another specified player (destination). 
--- The destination player must be the local player.
---@param dest player_t The destination player who will receive the outfit. Must be the local player.
---@return boolean Returns false if the destination player is not local or if the destination player is the same as the source.
function player_t:outfit_copy(dest) end

--- Saves the current player's outfit to a file on disk in the outfits folder as a JSON file.
---@param filename string The name of the file to save the outfit to.
---@return boolean Returns false if unable to gather the outfit information for saving.
function player_t:outfit_save(filename) end

--- Loads an outfit for the player from a JSON file on disk.
---@param filepath string The path to the JSON file containing the outfit information.
---@return boolean Returns false if the player is not local or the file does not exist.
function player_t:outfit_load(filepath) end

--- Retrieves the connection ID of the player's remote machine.
---@return integer The connection ID associated with the player.
function player_t:get_cxn_id() end

--- Retrieves the endpoint ID of the player's remote machine.
---@return integer The endpoint ID associated with the player.
function player_t:get_endpoint_id() end

--- Retrieves the index of this network player in the player manager's active list.
---@return integer The active index of the player.
function player_t:get_active_id() end

--- Retrieves the index of this player on the controlling machine.
---@return integer The index of the player on the remote machine.
function player_t:get_peer_player_index() end

--- Retrieves the time the player was added to the game, based on network synced time.
---@return integer The network synced time when the player was added.
function player_t:get_time_added() end

--- Retrieves the team ID associated with the player.
---@return integer The player's team ID.
function player_t:get_team() end

--- Retrieves the voice channel ID assigned to the player. Returns -1 if no channel is assigned.
---@return integer The voice channel ID or -1 if no channel is assigned.
function player_t:get_voice_channel() end

--- Retrieves the total size of all network array handler data managed by this player.
---@return integer The total size of network array data.
function player_t:get_sizeof_net_array() end

--- Checks if the player is leaving the session.
---@return boolean Returns true if the player is leaving the session, false otherwise.
function player_t:is_leaving() end

--- Checks if the player is currently Off The Radar (OTR).
---@return boolean Returns true if the player is OTR, otherwise returns false.
function player_t:is_player_otr() end

--- Checks if the player has a bounty mark.
---@return boolean Returns true if the player has a bounty mark, otherwise returns false.
function player_t:has_bounty_mark() end

--- Retrieves the bounty value on the player.
---@return integer Returns the bounty value on the player.
function player_t:get_bounty_value() end

--- Retrieves the respawn state of the player.
---@return integer Returns the current respawn state of the player.
function player_t:get_respawn_state() end

--- Checks if the player is currently connected to the session.
---@return boolean Returns true if the player is connected, otherwise returns false.
function player_t:is_player_connected() end

--- Checks if the player is in the same interior as the calling player.
---@return boolean Returns true if the player is in the same interior, otherwise returns false.
function player_t:is_player_in_my_interior() end

--- Checks if the player is currently typing a chat message.
---@return boolean Returns true if the player is typing a chat message, otherwise returns false.
function player_t:is_player_typing() end

--- Checks if the player is currently in a pause state.
---@return boolean Returns true if the player is in pause state, otherwise returns false.
function player_t:is_player_in_pause() end

--- Checks if the player is currently in a passive state.
---@return boolean Returns true if the player is in passive state, otherwise returns false.
function player_t:is_player_in_passive() end

--- Checks if the player is currently participating in a cutscene.
---@return boolean Returns true if the player is in a cutscene, otherwise returns false.
function player_t:is_player_in_cutscene() end

--- Checks if the player is currently transferring between interiors.
---@return boolean Returns true if the player is in the process of interior transferring, otherwise returns false.
function player_t:is_player_in_interior_transfering() end

--- Checks if the player is currently using a VPN.
---@return boolean Returns true if the player is using a VPN, otherwise returns false.
function player_t:has_vpn() end

---@module players
players = {}

--- Gets the player object that owns the specified entity object.
--- The owning object is understood as an entity that is tied to
--- the player in the player's world, specifically the CPed class.
---@param number|fwEntity Handle or entity object.
---@return player_t|nil Player menu object, or nil if no player could be found.
function players.get_from_entity(handle_or_ptr) end

---@param number|string Player index or name.
---@return player_t|nil Player menu object, or nil if no player could be found.
function players.get(index_or_name) end

--- Gets a random player in the session.
---@param ignore_me? boolean Ignore the local player.
---|> true
---@param ignore_friends? boolean Ignore friends.
---|> false
---@return player_t|nil Random player in the session meeting the criteria, or nil if no player could be found.
function players.get_random(ignore_me, ignore_friends) end

--- Retrieves player objects in a specified order.
--- This function returns a table containing all available player objects, sorted according to the provided parameters.
--- @param sort? PlayersSort - The sorting method for the players.
---|> PlayersSort.NO_SORT
--- @param reverse_order? boolean - If true, the sorting order will be reversed.
---|> false
--- @return table[player_t] - A table of player objects.
function players.get_all(sort, reverse_order) end

---@return player_t|nil Player menu object for local player or nil or failed to extract.
function players.me() end

---@return number Local player index.
function players.id() end

--- Retrieve the script host based on different criteria.
---
--- @overload fun(script_name: string): player_t | nil
---   Returns the player object that is the host for the specified script name. If there is no script with such a name or the script name is empty, returns 'nil'.
---   @param script_name string: The name of the script for which to find the host.
---   @return player_t | nil: The player object that is the host, or 'nil' if no host is found.
---
--- @overload fun(script_hash: number): player_t | nil
---   Returns the player object that is the host for the specified script hash. If there is no script with such a hash, returns 'nil'.
---   @param script_hash number: The hash of the script for which to find the host.
---   @return player_t | nil: The player object that is the host, or 'nil' if no host is found.
---
--- @overload fun(): player_t | nil
---   Returns the player object that is the host for the script 'freemode'. If no host is found, returns 'nil'.
---   @return player_t | nil: The player object that is the host for the script 'freemode', or 'nil' if no host is found.
function players.get_script_host(...) end

--- Retrieves the session host player object.
-- @return player_t | nil: The player object that is the session host, or 'nil' if no session host is found or an error occurs.
function players.get_host() end

--- Retrieves the next session host player object.
-- @return player_t | nil: The player object that is the next session host, or 'nil' if no session host is found or an error occurs.
function players.get_next_host() end

--- Returns a table of players queued to become the session host.
--- @return table[player_t] A table of player_t objects representing players in the hosting queue.
function players.get_hosts_queue() end

--- Retrieves a player menu object based on the player index or name.
--- This function serves the same purpose as `players.get()`, but offers a shorter and more convenient alternative.
--- @param number|string Player index or name.
--- @return player_t|nil Player menu object, or nil if no player could be found.
function player(index_or_name) end