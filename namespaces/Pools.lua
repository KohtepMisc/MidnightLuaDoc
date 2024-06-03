---@diagnostic disable

---@meta _

---@module pools
pools = {}

--- These functions retrieve handles for various game entities such as vehicles, pedestrians, objects, pickups, and blips.
--- Note: These functions do not guarantee a comprehensive list of all handles.
--- The pools used by these functions only store entities that are actively used in game scripts or have been created via external mod menus.

--- Retrieves a list of handles for all vehicles currently recognized by the game.
--- @return table A table of vehicle handles.
function pools.get_all_vehicles() end

--- Retrieves a list of handles for all pedestrians currently recognized by the game.
--- @return table A table of pedestrian handles.
function pools.get_all_peds() end

--- Retrieves a list of handles for all objects currently recognized by the game.
--- @return table A table of object handles.
function pools.get_all_objects() end

--- Retrieves a list of handles for all entities (vehicles, pedestrians, objects, and pickups) currently recognized by the game.
--- @return table A table of all entity handles.
function pools.get_all_ents() end

--- Retrieves a list of handles for all pickups currently recognized by the game.
--- @return table A table of pickup handles.
function pools.get_all_pickups() end

--- Retrieves a list of handles for all blips currently displayed on the game map.
--- @return table A table of blip handles.
function pools.get_all_blips() end
