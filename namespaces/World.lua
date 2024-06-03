---@diagnostic disable

---@meta _

--- Enumeration for different vehicle upgrade methods.
VehicleUpgradeMethod = {
    --- STOCK: Resets the vehicle to factory default settings.
    -- All modifications are removed, and the vehicle is set to its original state
    -- without any enhancements.
    STOCK = 0,

    --- BASE: Applies basic performance upgrades to the vehicle.
    -- This includes maximal upgrades for exhaust, engine, brakes, transmission,
    -- suspension, and armor. Turbo and tire smoke modifications are enabled.
    -- The window tint is set to green.
    BASE = 1,

    --- POWER: Focuses on powertrain upgrades, enhancing the vehicle's engine,
    -- brakes, transmission, armor, and air filter for optimal performance.
    POWER = 2,

    --- MAX: Applies the highest level of upgrades available for nearly all vehicle modifications.
    -- This includes the best performance parts for all applicable categories, enhanced aesthetics
    -- like tyre smoke color and xenon headlights, and all available utility modifications
    -- like nitrous, hydraulics, and strong axles. The vehicle's window tint is set to black,
    -- and its durability is maximized against physical deformations.
    MAX = 3,

    --- RANDOM: Randomly applies modifications available for the vehicle,
    -- choosing randomly among all possible modifications and settings.
    -- This includes random wheel types, modification levels, and cosmetic features
    -- like tyre smoke color and window tint.
    RANDOM = 4,
}

--- Enumeration for vehicle boost directions.
VehicleBoostDir = {
    --- Boosts the vehicle forward.
    FORWARD = 0,

    --- Boosts the vehicle to the right.
    RIGHT = 1,

    --- Boosts the vehicle backward.
    BACK = 2,

    --- Boosts the vehicle to the left.
    LEFT = 3,

    --- Boosts the vehicle upwards.
    UP = 4,

    --- Boosts the vehicle downwards.
    DOWN = 5
}

---@module entity
entity = {}

--- Deletes any entity (object, pedestrian, transport) in the world.
-- This function takes an integer handle of the entity and two optional callback functions.
-- @param handle integer The integer handle of the entity to delete.
-- @param on_deleted? fun(handle: integer) Callback function that is called when the entity is successfully deleted. The 'handle' is the same as the one passed to function.
-- @param on_failed? fun(handle: integer) Callback function that is called when the deletion fails. The 'handle' is the same as the one passed to function.
function entity.delete(handle, on_deleted, on_failed) end

--- Checks if the user has control over the specified entity.
-- This function determines if the current session has control over the entity,
-- based on the network status and entity handle. If the player is in singleplayer mode,
-- the function will always return true.
-- @param handle integer The integer handle of the entity to check control.
-- @return boolean Returns true if the user has control over the entity, or if the game is in singleplayer mode; false otherwise.
function entity.has_control(handle) end

--- Requests control of the specified entity asynchronously.
-- This function must be called within a fiber; otherwise, it will terminate immediately.
-- The function attempts to obtain control over the entity, and if successful, calls the provided callback function.
-- @param handle integer The integer handle of the entity for which control is being requested.
-- @param on_obtain? fun(handle: integer, tag?: integer) Optional callback function called upon successful control acquisition. The 'handle' is the entity handle, and 'tag' is an optional additional parameter that can be used to assist in identifying the entity whose request was obtained.
-- @param tag? integer An optional integer tag that can be passed to the callback function to help identify the entity whose control was requested.
function entity.request_control(handle, on_obtain, tag) end

---@module pedestrian
pedestrian = {}

--- Spawns a pedestrian at specified coordinates or near the local player if no position is provided.
-- @overload fun(hash: integer, position: Vector3, on_spawned?: fun(ped: integer))
-- @param hash integer The hash of the pedestrian model to spawn.
-- @param position Vector3 The coordinates where the pedestrian will be spawned. If omitted, the pedestrian will be spawned near the local player.
-- @param on_spawned? fun(ped: integer) Optional callback function called after the pedestrian is successfully spawned. 'ped' is the handle of the spawned pedestrian.

--- @overload fun(hash: integer, on_spawned?: fun(ped: integer))
-- @param hash integer The hash of the pedestrian model to spawn.
-- @param on_spawned? fun(ped: integer) Optional callback function called after the pedestrian is successfully spawned. 'ped' is the handle of the spawned pedestrian.

--- @overload fun(hash: integer, position: Vector3)
-- @param hash integer The hash of the pedestrian model to spawn.
-- @param position Vector3 The coordinates where the pedestrian will be spawned.

--- @overload fun(hash: integer)
-- @param hash integer The hash of the pedestrian model to spawn.

--- Spawns a pedestrian with a model name.
-- @overload fun(name: string, position: Vector3, on_spawned?: fun(ped: integer))
-- @param name string The name of the pedestrian model to spawn.
-- @param position Vector3 The coordinates where the pedestrian will be spawned. If omitted, the pedestrian will be spawned near the local player.
-- @param on_spawned? fun(ped: integer) Optional callback function called after the pedestrian is successfully spawned. 'ped' is the handle of the spawned pedestrian.

--- @overload fun(name: string, on_spawned?: fun(ped: integer))
-- @param name string The name of the pedestrian model to spawn.
-- @param on_spawned? fun(ped: integer) Optional callback function called after the pedestrian is successfully spawned. 'ped' is the handle of the spawned pedestrian.

--- @overload fun(name: string, position: Vector3)
-- @param name string The name of the pedestrian model to spawn.
-- @param position Vector3 The coordinates where the pedestrian will be spawned.

--- @overload fun(name: string)
-- @param name string The name of the pedestrian model to spawn.
function pedestrian.spawn(...) end

--- Creates a random pedestrian in the game world in front of a specified player.
-- This function spawns a random pedestrian using a random model available in the game.
-- The pedestrian is spawned 5 meters in front of the specified player and can be made networkable
-- for visibility in multiplayer mode.
-- @param nInFrontOf? integer The identifier of the player in front of whom the pedestrian will be created.
--                            If not specified or -1, the function automatically uses the identifier of the local player.
--
-- @param bConsciousness? boolean A flag indicating whether the pedestrian should be conscious.
--                                If true, the pedestrian will start wandering with standard behavior.
--                                If false or not specified, the pedestrian is created without any assigned tasks.
--
-- @return integer Returns the identifier of the created pedestrian on success, or 0 if the creation fails.
function pedestrian.spawn_random(nInFrontOf, bConsciousness) end

--- Allows the player to possess and control the specified pedestrian.
-- This function makes the player take control of the pedestrian identified by the given handle.
-- @param handle integer The handle of the pedestrian to be possessed.
-- @return boolean Returns true if the player successfully possesses the pedestrian, false otherwise.
function pedestrian.possess(handle) end

--- Retrieves a random non-player pedestrian from the environment.
-- This function selects a random pedestrian, with an option to ignore those in or near vehicles.
-- @param ignore_vehicles? boolean Optionally specifies whether to ignore pedestrians in or near vehicles.
--                               If true, pedestrians in or near vehicles will not be considered.
--                               If false or not specified, all pedestrians are considered.
-- @return integer Returns the handle of the randomly selected pedestrian, or 0 if no suitable pedestrian is found.
function pedestrian.get_random(ignore_vehicles) end

--- Transforms the specified pedestrian into a marine bodyguard.
-- Enhances the pedestrian's abilities for improved combat performance.
-- @param handle integer The handle of the pedestrian to be transformed.
-- @return boolean Returns true if the transformation was successful, false otherwise.
function pedestrian.make_guard(handle) end

--- Sends an assassin after a specified pedestrian or player with parameters for improved combat performance.
-- The assassin will attempt to kill the target.
--
-- @overload fun(handle: integer, model?: integer, weapon?: integer, vehicle?: integer)
-- @overload fun(ply: player_t, model?: integer, weapon?: integer, vehicle?: integer)
--
-- @param handle number|player_t The target pedestrian or player identifier.
-- @param model? integer The hash of the assassin's model.
--|> string.joaat('s_m_y_swat_01')
-- @param weapon? integer The hash of the assassin's weapon.
--|> string.joaat('WEAPON_ASSAULTRIFLE')
-- @param vehicle? integer The hash of the vehicle for the assassin. If specified, determines the assassin's approach: driving if in the driver's seat, waiting if in the passenger's seat.
--|> 0
--
-- @return integer Returns the handle of the spawned assassin on success, or 0 if an error occurred.
-- Note: All parameters except the target are optional. Defaults apply where not specified.
function pedestrian.send_assassin(handle_or_ply, model, weapon, vehicle) end

--- Repairs the specified pedestrian.
-- This function must be called within a fiber context; otherwise, it will cease operation and return false.
-- The function restores the pedestrian to a healthy state, resurrecting them if dead and healing injuries.
-- @param handle integer The handle of the pedestrian to be repaired.
-- @return boolean Returns true if the pedestrian was successfully repaired, false if called outside of a script thread or if the operation failed.
function pedestrian.repair(handle) end

---@module vehicle
vehicle = {}

--- Spawns a vehicle at specified coordinates or near the local player if no position is provided.
-- @overload fun(hash: integer, position: Vector3, on_spawned?: fun(veh: integer))
-- @param hash integer The hash of the vehicle model to spawn.
-- @param position Vector3 The coordinates where the vehicle will be spawned. If omitted, the vehicle will be spawned near the local player.
-- @param on_spawned? fun(veh: integer) Optional callback function called after the vehicle is successfully spawned. 'veh' is the handle of the spawned vehicle.

--- @overload fun(hash: integer, on_spawned?: fun(veh: integer))
-- @param hash integer The hash of the vehicle model to spawn.
-- @param on_spawned? fun(veh: integer) Optional callback function called after the vehicle is successfully spawned. 'veh' is the handle of the spawned vehicle.

--- @overload fun(hash: integer, position: Vector3)
-- @param hash integer The hash of the vehicle model to spawn.
-- @param position Vector3 The coordinates where the vehicle will be spawned.

--- @overload fun(hash: integer)
-- @param hash integer The hash of the vehicle model to spawn.

--- Spawns a vehicle with a model name.
-- @overload fun(name: string, position: Vector3, on_spawned?: fun(veh: integer))
-- @param name string The name of the vehicle model to spawn.
-- @param position Vector3 The coordinates where the vehicle will be spawned. If omitted, the vehicle will be spawned near the local player.
-- @param on_spawned? fun(veh: integer) Optional callback function called after the vehicle is successfully spawned. 'veh' is the handle of the spawned vehicle.

--- @overload fun(name: string, on_spawned?: fun(veh: integer))
-- @param name string The name of the vehicle model to spawn.
-- @param on_spawned? fun(veh: integer) Optional callback function called after the vehicle is successfully spawned. 'veh' is the handle of the spawned vehicle.

--- @overload fun(name: string, position: Vector3)
-- @param name string The name of the vehicle model to spawn.
-- @param position Vector3 The coordinates where the vehicle will be spawned.

--- @overload fun(name: string)
-- @param name string The name of the vehicle model to spawn.
function vehicle.spawn(...) end

--- Spawns a vehicle from a cloud-synced preset list at specified coordinates or near the local player if no position is provided.
-- @overload fun(name: string, position: Vector3, on_spawned?: fun(veh: integer))
-- @param name string The name of the vehicle in the cloud preset list.
-- @param position Vector3 The coordinates where the vehicle will be spawned. If omitted, the vehicle will be spawned near the local player.
-- @param on_spawned? fun(veh: integer) Optional callback function called after the vehicle is successfully spawned. 'veh' is the handle of the spawned vehicle.
-- Note: The list of available vehicles can be obtained using the function vehicle.get_presets.

--- @overload fun(name: string, on_spawned?: fun(veh: integer))
-- @param name string The name of the vehicle in the cloud preset list.
-- @param on_spawned? fun(veh: integer) Optional callback function called after the vehicle is successfully spawned. 'veh' is the handle of the spawned vehicle.

--- @overload fun(name: string, position: Vector3)
-- @param name string The name of the vehicle in the cloud preset list.
-- @param position Vector3 The coordinates where the vehicle will be spawned.

--- @overload fun(name: string)
-- @param name string The name of the vehicle in the cloud preset list.
function vehicle.spawn_preset(...) end

--- Retrieves a list of names for cloud-synced vehicle presets.
-- This function returns a table containing the names of all available vehicles synchronized with the cloud.
-- The names provided by this table can be used to spawn vehicles using the `spawn_preset` function.
-- @return table[string] A table of strings, each representing the name of a cloud-synced vehicle that can be spawned.
function vehicle.get_presets() end

--- Repairs and cleans the specified vehicle.
-- This function restores the vehicle to its optimal condition and removes any dirt or decals.
-- @param handle integer The handle of the vehicle to repair and clean.
function vehicle.repair(handle) end

--- Cleans the specified vehicle.
-- This function removes dirt and decals from the vehicle.
-- @param handle integer The handle of the vehicle to clean.
function vehicle.clean(handle) end

--- Ignites the specified vehicle.
-- This function sets the vehicle on fire.
-- @param handle integer The handle of the vehicle to ignite.
function vehicle.ignite(handle) end

--- Extinguishes fire on the specified vehicle.
-- This function stops the vehicle from burning if it is on fire.
-- @param handle integer The handle of the vehicle to extinguish.
function vehicle.extinguish(handle) end

--- Starts the engine of the specified vehicle.
-- This function starts the engine on the specified vehicle.
-- @param handle integer The handle of the vehicle whose engine is to be started.
function vehicle.start_engine(handle) end

--- Stops the engine of the specified vehicle.
-- This function stops the engine on the specified vehicle.
-- @param handle integer The handle of the vehicle whose engine is to be stopped.
function vehicle.stop_engine(handle) end

--- Upgrades a vehicle to a specified upgrade type.
-- This function upgrades a vehicle based on the specified upgrade type. If no type is specified,
-- it defaults to the maximum upgrade level.
-- @param handle integer The handle of the vehicle to upgrade.
-- @param type? VehicleUpgradeMethod The type of upgrade to apply.
--|> VehicleUpgradeMethod.MAX
function vehicle.upgrade(handle, type) end

--- Teleports a vehicle to a specified location.
-- This function attempts to teleport a vehicle to the given coordinates. If multiple attempts are specified,
-- the function should be called within a fiber context to handle retries properly.
-- @param handle integer The handle of the vehicle to teleport.
-- @param pos table A table with 'x', 'y', and 'z' fields representing the destination coordinates.
-- @param tries? integer (default: 1) The number of attempts to teleport the vehicle. If more than one attempt is needed,
--              the function must be run within a fiber to manage multiple attempts.
function vehicle.teleport(handle, pos, tries) end

--- Boosts a vehicle in a specified direction with a specified power.
-- This function applies a force to the vehicle to accelerate it in a chosen direction.
-- If no direction is specified, the boost is applied forward by default.
-- @param handle integer The handle of the vehicle to boost.
-- @param power? number The magnitude of the boost force to apply.
--|> 1000.0
-- @param dir? VehBoostDir The direction in which to apply the boost.
--|> VehBoostDir.FORWARD
function vehicle.boost(handle, power, dir) end

---@module object
object = {}

--- Spawns an object at specified coordinates or at the default location near the local player if no position is provided.
-- @overload fun(hash: integer, position: Vector3, on_spawned?: fun(obj: integer))
-- @param hash integer The hash of the object model to spawn.
-- @param position Vector3 The coordinates where the object will be spawned. If omitted, the object will be spawned near the local player.
-- @param on_spawned? fun(obj: integer) Optional callback function called after the object is successfully spawned. 'obj' is the handle of the spawned object.

--- @overload fun(hash: integer, on_spawned?: fun(obj: integer))
-- @param hash integer The hash of the object model to spawn.
-- @param on_spawned? fun(obj: integer) Optional callback function called after the object is successfully spawned.

--- @overload fun(hash: integer, position: Vector3)
-- @param hash integer The hash of the object model to spawn.
-- @param position Vector3 The coordinates where the object will be spawned.

--- @overload fun(hash: integer)
-- @param hash integer The hash of the object model to spawn.

--- Spawns an object using a model name.
-- @overload fun(name: string, position: Vector3, on_spawned?: fun(obj: integer))
-- @param name string The name of the object model to spawn.
-- @param position Vector3 The coordinates where the object will be spawned. If omitted, the object will be spawned near the local player.
-- @param on_spawned? fun(obj: integer) Optional callback function called after the object is successfully spawned.

--- @overload fun(name: string, on_spawned?: fun(obj: integer))
-- @param name string The name of the object model to spawn.
-- @param on_spawned? fun(obj: integer) Optional callback function called after the object is successfully spawned.

--- @overload fun(name: string, position: Vector3)
-- @param name string The name of the object model to spawn.
-- @param position Vector3 The coordinates where the object will be spawned.

--- @overload fun(name: string)
-- @param name string The name of the object model to spawn.
function object.spawn(...) end