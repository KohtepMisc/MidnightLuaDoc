---@diagnostic disable

---@meta _

---@enum ScriptEntityType
--- Enum for identifying the type of script entities.
ScriptEntityType = {
    --- Represents an invalid or undefined type.
    INVALID = 0,
    --- Represents a pedestrian or any non-player character.
    PED = 1,
    --- Represents a vehicle.
    VEHICLE = 2,
    --- Represents an object.
    OBJECT = 3
}

---@enum EntityType
--- Enum for identifying different types of entities within the game, with their inheritance hierarchy.
EntityType = {
    --- Represents nothing, used as a default or placeholder.
    NOTHING = 0,
	
    --- Represents a building entity (CBuilding : fwEntity).
    BUILDING = 1,
	
    --- Represents an animated building entity (CAnimatedBuilding : CDynamifwEntity : fwEntity).
    ANIMATED_BUILDING = 2,
	
    --- Represents a vehicle entity (CVehicle : CPhysical : CDynamifwEntity : fwEntity).
    VEHICLE = 3,
	
    --- Represents a pedestrian entity (CPed : CPhysical : CDynamifwEntity : fwEntity).
    PED = 4,
	
    --- Represents an object entity (CObject : CPhysical : CDynamifwEntity : fwEntity).
    OBJECT = 5,
	
    --- Represents a dummy object entity (CDummyObject : fwEntity).
    DUMMY_OBJECT = 6,
	
    --- Represents a portal entity (CPortalInst : CBuilding : fwEntity).
    PORTAL = 7,
	
    --- Represents an interior instance entity, MLO (CInteriorInst : CBuilding : fwEntity).
    MLO = 8,
	
    --- Used only to trigger audio, not a pool member.
    NOTINPOOLS = 9,
	
    --- Represents a particle system entity.
    PARTICLESYSTEM = 10,
	
    --- Represents a light entity (CLightEntity : fwEntity).
    LIGHT = 11,
	
    --- Represents a composite entity (CCompEntity : fwEntity).
    COMPOSITE = 12,
	
    --- Represents a list of instance entities (fwEntityBatch : fwEntityBatchBase : fwEntity).
    INSTANCE_LIST = 13,
	
    --- Represents a list of grass instance entities (CGrassBatch : fwEntityBatchBase : fwEntity).
    GRASS_INSTANCE_LIST = 14
}

---@enum EntityFlagsBasic
--- Enum for identifying specific properties of entities within the game, with detailed descriptions.
EntityFlagsBasic = {
    --- If set, this entity will be ignored in visibility checks.
    IS_VISIBLE = 1,

    --- If set, this entity will be ignored in world searches.
    IS_SEARCHABLE = 2,

    --- Draw object in opaque pass.
    HAS_OPAQUE = 4,

    --- Draw object in alpha pass.
    HAS_ALPHA = 8,

    --- Draw object in decal phase.
    HAS_DECAL = 16,

    --- Draw object in cutout phase.
    HAS_CUTOUT = 32,

    --- Draw object in water phase.
    HAS_WATER = 64,

    --- Draw object in displacement alpha pass.
    HAS_DISPL_ALPHA = 128,

    --- Object has pre-render effects attached to it.
    HAS_PRERENDER = 256,

    --- This entity is a light.
    IS_LIGHT = 512,

    --- This includes MLO objects and small debris like leaves, cans, etc.
    USE_SCREENDOOR = 1024,

    --- Used for skipping any alpha rendering in the entity.
    SUPPRESS_ALPHA = 2048,

    --- Force Alpha rendering.
    FORCE_ALPHA = 4096,

    --- Don't cull shadow caster based on screen size.
    RENDER_SMALL_SHADOW = 8192,

    --- Indicates that it is acceptable to pre-render this entity.
    OK_TO_PRERENDER = 16384,

    --- Has a LOD child which renders in water reflection but is not a proxy.
    HAS_NON_WATER_REFLECTION_PROXY_CHILD = 32768,

    --- Has a solid part inside an alpha object.
    HAS_HYBRID_ALPHA = 65536,

    --- This entity is dynamic, meaning it can move in space.
    IS_DYNAMIC = 131072,

    --- Physics for this entity is fixed in position.
    IS_FIXED = 262144,

    --- Used during a network game to stop clones having their physics updated between sync updates.
    IS_FIXED_BY_NETWORK = 524288,

    --- Ensure that this object has activated physics when adding to the world.
    SPAWN_PHYS_ACTIVE = 1048576,

    --- Uses a model that's a timed entity.
    IS_TIMED_ENTITY = 2097152,

    --- Tells the streaming system not to stream this entity.
    DONT_STREAM = 4194304,

    --- Marks this object as unimportant if streaming is having issues.
    LOW_PRIORITY_STREAM = 8388608,

    --- Indicates the presence of a physics dictionary.
    HAS_PHYSICS_DICT = 16777216,

    --- Remove this entity next time it should be processed.
    REMOVE_FROM_WORLD = 33554432,

    --- This entity has forced alpha=0, e.g., by script.
    FORCED_ZERO_ALPHA = 67108864,

    --- Entity is always pushed back in the draw order as late as possible.
    DRAW_LAST = 134217728,

    --- Entity is drawn first in sorted drawlists, i.e., SORT_ASCENDING or SORT_DESCENDING.
    DRAW_FIRST_SORTED = 268435456,

    --- No instanced physics are applied.
    NO_INSTANCED_PHYS = 536870912,

    --- Entity has a texture dictionary that supports streaming in HD top mip.
    HAS_HD_TEX_DIST = 1073741824,

    --- This entity has protected its archetype with a ref & needs to be handled correctly on destruction.
    PROTECT_ARCHETYPE = 2147483648,

    --- Indicates the presence of an alpha shadow.
    HAS_ALPHA_SHADOW = 4294967296
}

---@enum ProtectedFlags
--- Enum for identifying specific protected flags of entities, providing details on their behavior and interactions.
ProtectedFlags = {
    --- Entities with this flag are static until a collision is loaded below them. Used by script created entities.
    IS_FIXED_UNTIL_COLLISION = 1,

    --- NOT FOR SETTING! For getter only.
    USES_COLLISION = 2,
    
    --- Indicates that the entity has a SLOD (Simplified Level of Detail) reference.
    HAS_SLOD_REF = 4,

    --- Indicates that the entity is a first person view object.
    HAS_FPV = 8
}

---@enum EntityFlags
--- Enum for identifying specific flags for entities within the game, detailing their behavior and properties.
EntityFlags = {
    --- Use damaged LOD models for objects with applicable damage.
    RENDER_DAMAGED = 0,

    --- This object uses the alternative drawable distance fade on the last LOD.
    USE_ALT_FADE_DISTANCE = 1,

    --- Object is a procedural object.
    IS_PROC_OBJECT = 2,

    --- Object is a procedural object created by a composite entity.
    IS_COMP_ENTITY_PROC_OBJECT = 3,

    --- Object is a floating procedural object.
    IS_FLOATING_PROC_OBJECT = 4,

    --- Object with lights attached.
    LIGHT_OBJECT = 5,

    --- This entity is a fragment model.
    IS_FRAG = 6,

    --- Object is part of an MLO (Map Location Object) interior.
    IN_MLO_ROOM = 7,

    --- If this entity has active procedural objects.
    CREATED_PROC_OBJECTS = 8,

    --- This entity is possibly affected by water rendering code and may be rendered as if wet.
    POSSIBLY_TOUCHES_WATER = 9,

    --- Allows the object to spawn scenario peds if it has 2D effects.
    WILL_SPAWN_PEDS = 10,

    --- Already in the audio list, entities have this cleared when the list is reset.
    ALREADY_IN_AUDIO_LIST_1 = 11,
    ALREADY_IN_AUDIO_LIST_2 = 12,

    --- Lights attached to this object ignore day/night settings.
    LIGHTS_IGNORE_DAY_NIGHT_SETTING = 13,

    --- Lights attached to this object can cast static shadows.
    LIGHTS_CAN_CAST_STATIC_SHADOWS = 14,

    --- Lights attached to this object can cast dynamic shadows.
    LIGHTS_CAN_CAST_DYNAMIC_SHADOWS = 15,

    --- Entity will only change to its delayed state based on a timer.
    TIMED_ENTITY_DELAYED_STATE = 16,

    --- Indicates that the entity is currently on fire.
    IS_ON_FIRE = 17,

    --- Indicates that the entity has exploded before.
    HAS_EXPLODED = 18,

    --- Entity has spawn points associated with it.
    HAS_SPAWN_POINTS = 19,

    --- Entity is included in the motion blur mask.
    ADD_TO_MOTION_BLUR_MASK = 20,

    --- Indicates that this procedural object was created from another entity.
    IS_ENTITY_PROC_OBJECT = 21,

    --- Entity should always be pre-rendered.
    ALWAYS_PRE_RENDER = 22,

    --- Overrides the traffic light to display red.
    TRAFFIC_LIGHT_OVERRIDE_RED = 23,

    --- Overrides the traffic light to display amber.
    TRAFFIC_LIGHT_OVERRIDE_AMBER = 24,

    --- Overrides the traffic light to display green.
    TRAFFIC_LIGHT_OVERRIDE_GREEN = 25,

    --- Entity should never be treated as a dummy object.
    NEVER_DUMMY = 26,

    --- Entity has been found in the potential visibility set (PVS).
    FOUND_IN_PVS = 27,

    --- Entity has been pre-rendered this frame.
    PRE_RENDERED_THIS_FRAME = 28,

    --- Entity is being updated through the animation queue.
    UPDATING_THROUGH_ANIM_QUEUE = 29,

    --- Use occlusion querying for this entity to optimize rendering.
    USE_OCCLUSION_QUERY = 30,

    --- Use maximum distance settings for water reflections.
    USE_MAX_DISTANCE_FOR_WATER_REFLECTION = 31,

    --- Entity is very close to the camera, affecting its rendering properties.
    CLOSE_TO_CAMERA = 32
}

---@enum PhysicalFlags
--- Enum for identifying specific physical properties and states of entities within the game, with detailed descriptions.
PhysicalFlags = {
    --- Entity is currently floating in water.
    IS_IN_WATER = 0,

    --- Entity was floating in water in the previous frame.
    WAS_IN_WATER = 1,

    --- Collision is not loaded for this physical entity.
    DONT_LOAD_COLLISION = 2,

    --- Allows the entity to freeze in the physics simulation if no collision is around.
    ALLOW_FREEZE_IF_NO_COLLISION = 3,

    --- Entity is immune to damage from bullets.
    NOT_DAMAGED_BY_BULLETS = 4,

    --- Entity is immune to damage from flames.
    NOT_DAMAGED_BY_FLAMES = 5,

    --- Entity is immune to damage from collisions.
    NOT_DAMAGED_BY_COLLISIONS = 6,

    --- Entity is immune to damage from melee attacks.
    NOT_DAMAGED_BY_MELEE = 7,

    --- Entity cannot be damaged by any means.
    NOT_DAMAGED_BY_ANYTHING = 8,

    --- Entity does not take damage but reacts to impacts and explosions.
    NOT_DAMAGED_BY_ANYTHING_BUT_HAS_REACTIONS = 9,

    --- Entity can only be damaged by the player.
    ONLY_DAMAGED_BY_PLAYER = 10,

    --- Entity ignores effects from explosions.
    IGNORES_EXPLOSIONS = 11,

    --- Entity can only be damaged by members of a specific relationship group.
    ONLY_DAMAGED_BY_REL_GROUP = 12,

    --- Entity cannot be damaged by members of a specific relationship group.
    NOT_DAMAGED_BY_REL_GROUP = 13,

    --- Entity can only be damaged while its script is running.
    ONLY_DAMAGED_WHEN_RUNNING_SCRIPT = 14,

    --- Entity is immune to damage from steam.
    NOT_DAMAGED_BY_STEAM = 15,

    --- Entity is immune to damage from smoke.
    NOT_DAMAGED_BY_SMOKE = 16,

    --- Entity will explode instantly when a specific check is performed.
    EXPLODE_INSTANTLY_WHEN_CHECKED = 17,

    --- Entity is capable of flight.
    FLYER = 18,

    --- Entity should be rendered with scorch marks.
    RENDER_SCORCHED = 19,

    --- Entity is currently carried by a rope or crane.
    CARRIED_BY_ROPE = 20,

    --- Entity has been moved for the first time after a collision.
    MOVED = 21,

    --- State regarding whether the entity is affected by water is up to date.
    POSSIBLY_TOUCHES_WATER_IS_UP_TO_DATE = 22,

    --- Collision bounds of the entity have been modified.
    MODIFIED_BOUNDS = 23,

    --- Entity is not buoyant, does not float in water.
    IS_NOT_BUOYANT = 24,

    --- Entity should not be networked in multiplayer games.
    NOT_TO_BE_NETWORKED = 25,

    --- Entity uses kinematic physics, not influenced by other objects.
    USE_KINEMATIC_PHYSICS = 26,

    --- Entity preserves its velocity when switching from kinematic physics.
    PRESERVE_VELOCITY_FROM_KINEMATIC_PHYSICS = 27,

    --- Entity is the root of an attachment tree.
    IS_ROOT_OF_OTHER_ATTACHMENT_TREE = 28,

    --- Auto-vaulting over this entity is disabled.
    AUTO_VAULT_DISABLED = 29,

    --- Climbing this entity is disabled.
    CLIMBING_DISABLED = 30,

    --- Being picked up by a Cargobob helicopter is disabled for this entity.
    PICK_UP_BY_CARGOBOB_DISABLED = 31,

    --- Entity is currently using kinematic physics.
    IS_USING_KINEMATIC_PHYSICS = 32,

    --- A blip has been created for this entity.
    CREATED_BLIP = 33,

    --- Cover collision bounds have been removed from this entity.
    COVER_BOUNDS_REMOVED = 34
}

---@enum EntityStatus
EntityStatus = {
    --- Indicates the entity is being controlled by the player.
    STATUS_PLAYER = 0,

    STATUS_PHYSICS = 1,

    STATUS_ABANDONED = 2,

    STATUS_WRECKED = 3,

    STATUS_PLAYER_DISABLED = 4,

    STATUS_OUT_OF_CONTROL = 5
}

---@enum PopType
--- Enum for defining population types in the game, related to how entities are generated and managed.
PopType = {
    --- Unknown population type, default or uninitialized.
    POPTYPE_UNKNOWN = 0,

    --- Entities like trains and helicopters that are singularly placed and remain throughout gameplay.
    POPTYPE_RANDOM_PERMANENT = 1,

    --- Vehicles parked semi-randomly around the map, generated on car generators.
    POPTYPE_RANDOM_PARKED = 2,

    --- Entities generated on patrol paths, such as peds and vehicles around banks and castles.
    POPTYPE_RANDOM_PATROL = 3,

    --- Random scenarios like pairs of peds talking on the street, placed at scenario points.
    POPTYPE_RANDOM_SCENARIO = 4,

    --- Random wandering pedestrians and vehicles, generated on road paths or the navmesh.
    POPTYPE_RANDOM_AMBIENT = 5,

    --- Permanent entities like the player and player groups.
    POPTYPE_PERMANENT = 6,

    --- Entities specifically generated for missions, including scripted characters and vehicles.
    POPTYPE_MISSION = 7,

    --- Entities generated for game replays.
    POPTYPE_REPLAY = 8,

    --- Vehicles that are part of the vehicle cache.
    POPTYPE_CACHE = 9,

    --- Entities generated for debugging tools.
    POPTYPE_TOOL = 10,
}

---@enum ObjectFlags
--- Enum for defining various object flags within the game, related to object entities.
ObjectFlags = {
    --- Indicates the object can be picked up.
    IS_PICK_UP = 0,

    --- Indicates the object is a door.
    IS_DOOR = 1,

    --- Indicates the object has been uprooted.
    HAS_BEEN_UPROOTED = 2,

    --- Indicates the object can be targeted by the player.
    CAN_BE_TARGETTED_BY_PLAYER = 3,

    --- Indicates the object is a high priority target.
    IS_A_TARGET_PRIORITY = 4,

    --- Indicates the object can be targeted without line of sight.
    TARGETTABLE_WITH_NO_LOS = 5,

    --- Indicates the object is stealable.
    IS_STEALABLE = 6,

    --- Indicates the object is a part of a vehicle.
    VEHICLE_PART = 7,

    --- Indicates the object is a prop attached to a pedestrian.
    PED_PROP = 8,

    --- Indicates the object should fade out.
    FADE_OUT = 9,

    --- Indicates the object should be removed from the world when not visible.
    REMOVE_FROM_WORLD_WHEN_NOT_VISIBLE = 10,

    --- Indicates the object has moved in a network game.
    MOVED_IN_NETWORK_GAME = 11,

    --- Indicates the object's navigation bounds need recalculating for proper pathfinding.
    BOUNDS_NEED_RECALCULATING_FOR_NAVIGATION = 12,

    --- Indicates the object is a floater, always active near water.
    FLOATER = 13,

    --- Indicates the weapon will fire upon impact.
    WEAPON_WILL_FIRE_ON_IMPACT = 14,

    --- Indicates the object is an ambient prop.
    AMBIENT_PROP = 15,

    --- Indicates the prop was detached from a pedestrian.
    DETACHED_PED_PROP = 16,

    --- Indicates the object is fixed until it collides with large masses or vehicles.
    FIXED_FOR_SMALL_COLLISIONS = 17,

    --- Indicates temporary object removal checks are skipped for this object.
    SKIP_TEMP_OBJECT_REMOVAL_CHECKS = 18,

    --- Indicates the network desires ownership of the object.
    WE_WANT_OWNERSHIP = 20,

    --- Indicates physics should be activated as soon as the object is unfrozen.
    ACTIVATE_PHYSICS_AS_SOON_AS_UNFROZEN = 21,

    --- Indicates the object is a car wheel.
    CAR_WHEEL = 22,

    --- Indicates the object can be picked up.
    CAN_BE_PICKED_UP = 23,

    --- Indicates the object is a helmet.
    IS_HELMET = 24,

    --- Indicates the object is a RAGE environment cloth attached to a moving entity.
    IS_RAGE_ENV_CLOTH = 25,

    --- Indicates the object should only be cleaned up when out of range.
    ONLY_CLEAN_UP_WHEN_OUT_OF_RANGE = 26,

    --- Indicates the object causes tires to pop upon collision.
    POP_TIRES = 27,

    --- Indicates the object has initialized physics.
    HAS_INIT_PHYSICS = 28,

    --- Indicates the object has added physics.
    HAS_ADDED_PHYSICS = 29,

    --- Indicates the object is a part of a vehicle gadget.
    IS_VEHICLE_GADGET_PART = 30,

    --- Indicates the object is a networked fragment.
    IS_NETWORKED_FRAGMENT = 31
}

---@class fwEntity
fwEntity = {}

--- Returns the handle of the entity.
---@return number The handle of the entity.
function fwEntity:get_id() end

--- Validates the entity object.
---@return boolean Returns true if the entity is considered valid, false otherwise.
function fwEntity:is_valid() end

--- Returns the network handle of the entity.
---@return number The network handle (ObjectId) of the entity.
function fwEntity:get_netid() end

--- Returns a pointer to the underlying rage::fwEntity object.
---@return userdata A pointer to the rage::fwEntity object.
function fwEntity:get_entity_ptr() end

--- Returns a pointer to the underlying rage::netObject.
---@return userdata A pointer to the rage::netObject.
function fwEntity:get_netobj_ptr() end

--- Returns the handle of the entity's interior.
---@return integer The handle of the interior in which the entity is located.
function fwEntity:get_interior() end

--- Checks if the entity is currently rendered on the screen.
---@return boolean Returns true if the entity is on the screen, false otherwise.
function fwEntity:is_on_screen() end

--- Retrieves the world coordinates of the entity.
---@return number, number, number The x, y, and z coordinates of the entity in the game world.
function fwEntity:get_coords() end

--- Retrieves the screen coordinates of the entity.
---@return number, number The x and y coordinates of the entity on the screen.
function fwEntity:get_screen() end

--- Retrieves the angles of the entity in Euler angles (pitch, yaw, roll).
---@return number, number, number The pitch, yaw, and roll angles of the entity.
function fwEntity:get_angles() end

--- Retrieves the minimum bounding coordinates of the entity.
---@return number, number, number The minimum x, y, and z coordinates of the entity's bounding box.
function fwEntity:get_mins() end

--- Retrieves the maximum bounding coordinates of the entity.
---@return number, number, number The maximum x, y, and z coordinates of the entity's bounding box.
function fwEntity:get_maxs() end

--- Retrieves the forward vector of the entity.
---@return number, number, number The x, y, and z components of the forward vector.
function fwEntity:get_forward() end

--- Retrieves the right vector of the entity.
---@return number, number, number The x, y, and z components of the right vector.
function fwEntity:get_right() end

--- Retrieves the up vector of the entity.
---@return number, number, number The x, y, and z components of the up vector.
function fwEntity:get_up() end

--- Gets the heading of the entity in degrees.
---@return number The heading of the entity, representing the direction it is facing.
function fwEntity:get_heading() end

--- Calculates the distance from the local player to the entity.
---@return number The distance from the local player to the entity.
function fwEntity:get_distance() end

--- Retrieves the current health of the entity.
---@return integer The current health of the entity.
function fwEntity:get_health() end

--- Retrieves the maximum health of the entity.
---@return integer The maximum health of the entity.
function fwEntity:get_health_max() end

--- Checks if the entity is alive.
---@return boolean Returns true if the entity is alive, false if dead or the health is zero or below.
function fwEntity:is_alive() end

--- Checks if the entity is dead.
---@return boolean Returns true if the entity's health is zero or below, false otherwise.
function fwEntity:is_dead() end

--- Checks if the entity is broken.
--- An object is considered broken if it is damaged and not visible due to its damaged state.
---@return boolean Returns true if the entity is broken, false otherwise.
function fwEntity:is_broken() end

--- Checks if the entity is a player.
---@return boolean Returns true if the entity is a player, false otherwise.
function fwEntity:is_player() end

--- Checks if the entity is a type of object.
---@return boolean Returns true if the entity is an object, false otherwise.
function fwEntity:is_object() end

--- Checks if the entity is a type of pedestrian.
---@return boolean Returns true if the entity is a pedestrian, false otherwise.
function fwEntity:is_pedestrian() end

--- Checks if the entity is a type of vehicle.
---@return boolean Returns true if the entity is a vehicle, false otherwise.
function fwEntity:is_vehicle() end

--- Checks if the entity is a type of building.
---@return boolean Returns true if the entity is a building, false otherwise.
function fwEntity:is_building() end

--- Checks if the entity is part of an interior (MLO).
---@return boolean Returns true if the entity is an interior, false otherwise.
function fwEntity:is_interior() end

--- Checks if the entity is a physical object, which includes objects, pedestrians, or vehicles.
---@return boolean Returns true if the entity is physical, false otherwise.
function fwEntity:is_physical() end

--- Checks if the entity is a pickup.
---@return boolean Returns true if the entity is pickup, false otherwise.
function fwEntity:is_pickup() end

--- Checks if the entity is a door.
---@return boolean Returns true if the entity is door, false otherwise.
function fwEntity:is_door() end

--- Checks if the entity is a weapon.
---@return boolean Returns true if the entity is weapon, false otherwise.
function fwEntity:is_weapon() end

--- Gets the model hash of the entity.
---@return integer The model hash of the entity.
function fwEntity:get_model() end

--- Retrieves the script type of the entity as defined in the ScriptEntityType enum.
---@return ScriptEntityType The script type of the entity.
function fwEntity:get_entity_script_type() end

--- Retrieves a basic entity flag.
---@param flag EntityFlagsBasic The flag to check.
---@return boolean Returns true if the flag is set, false otherwise.
function fwEntity:get_basic_flag(flag) end

--- Sets a basic entity flag.
---@param flag EntityFlagsBasic The flag to set.
function fwEntity:set_basic_flag(flag) end

--- Retrieves a specific entity flag.
---@param flag EntityFlags The flag to check.
---@return boolean Returns true if the flag is set, false otherwise.
function fwEntity:get_flag(flag) end

--- Sets or clears a specific entity flag.
---@param flag EntityFlags The flag to set or clear.
---@param value boolean The value to set (true to set the flag, false to clear it).
function fwEntity:set_flag(flag, value) end

--- Retrieves a physical flag for the entity.
---@param flag PhysicalFlags The flag to check.
---@return boolean Returns true if the flag is set, false otherwise.
function fwEntity:get_physical_flag(flag) end

--- Sets or clears a physical flag for the entity.
---@param flag PhysicalFlags The flag to set or clear.
---@param value boolean The value to set (true to set the flag, false to clear it).
function fwEntity:set_physical_flag(flag, value) end

--- Retrieves an object flag for the entity. Only applicable to object entities (i.e. pickups).
---@param flag ObjectFlags The flag to check.
---@return ObjectFlags Returns true if the flag is set, false otherwise.
function fwEntity:get_object_flag(flag) end

--- Sets or clears an object flag for the entity. Only applicable to object entities (i.e. pickups).
---@param flag ObjectFlags The flag to set or clear.
---@param value boolean The value to set (true to set the flag, false to clear it).
function fwEntity:set_object_flag(flag, value) end

--- Retrieves the current status of the entity.
---@return EntityStatus The current status of the entity.
function fwEntity:get_status() end

--- Checks if the entity has been frozen by an interior.
---@return boolean Returns true if the entity is frozen by an interior, false otherwise.
function fwEntity:get_frozen_by_interior() end

--- Checks if the entity's updates are currently frozen.
---@return boolean Returns true if the entity is frozen, false otherwise.
function fwEntity:get_frozen() end

--- Checks if the entity's dead/alive state has been checked this frame.
---@return boolean Returns true if checked, false otherwise.
function fwEntity:get_checked_for_dead() end

--- Checks if the entity is marked as a golf ball.
---@return boolean Returns true if the entity is a golf ball, false otherwise.
function fwEntity:get_is_golf_ball() end

--- Checks if the entity should always update its animation pre physics regardless of visibility.
---@return boolean Returns true if the entity requires forced pre-physics animation update, false otherwise.
function fwEntity:get_force_pre_physics_anim_update() end

--- Checks if the entity is breakable glass.
---@return boolean Returns true if the entity is breakable glass, false otherwise.
function fwEntity:get_is_breakable_glass() end

--- Checks if the entity is out of the game map bounds.
---@return boolean Returns true if the entity is out of map, false otherwise.
function fwEntity:get_is_out_of_map() end

--- Checks if the entity has overridden physics bounds.
---@return boolean Returns true if the physics bounds are overridden, false otherwise.
function fwEntity:get_override_physics_bounds() end

--- Checks if the entity has moved since the last pre-render update.
---@return boolean Returns true if the entity has moved since the last pre-render, false otherwise.
function fwEntity:get_has_moved_since_last_pre_render() end

--- Checks if the entity uses an extended bounding box.
---@return boolean Returns true if the entity uses an extended bounding box, false otherwise.
function fwEntity:get_use_extended_bounding_box() end

--- Checks if the entity is straddling a portal.
---@return boolean Returns true if the entity is straddling a portal, false otherwise.
function fwEntity:get_is_straddling_portal() end

--- Retrieves the current population type of the entity.
---@return PopType The current population type of the entity.
function fwEntity:get_pop_type() end

--- Retrieves the previous population type of the entity.
---@return PopType The previous population type of the entity.
function fwEntity:get_pop_type_prev() end

--- Sets the current status of the entity.
---@param status eEntityStatus The status to set for the entity.
function fwEntity:set_status(status) end

--- Sets whether the entity is frozen by an interior.
---@param frozen boolean True to freeze the entity by an interior, false to unfreeze.
function fwEntity:set_frozen_by_interior(frozen) end

--- Sets whether the entity's updates are currently frozen.
---@param frozen boolean True to freeze the entity, false to unfreeze.
function fwEntity:set_frozen(frozen) end

--- Sets whether the entity's dead/alive state has been checked this frame.
---@param checked boolean True to mark as checked, false otherwise.
function fwEntity:set_checked_for_dead(checked) end

--- Sets whether the entity is marked as a golf ball.
---@param isGolfBall boolean True to mark the entity as a golf ball, false otherwise.
function fwEntity:set_is_golf_ball(isGolfBall) end

--- Sets whether the entity should always update its animation pre physics regardless of visibility.
---@param force boolean True to force pre-physics animation updates, false to allow normal behavior.
function fwEntity:set_force_pre_physics_anim_update(force) end

--- Sets whether the entity is breakable glass.
---@param isBreakable boolean True if the entity is breakable glass, false otherwise.
function fwEntity:set_is_breakable_glass(isBreakable) end

--- Sets whether the entity is considered to be out of the game map bounds.
---@param isOutOfMap boolean True to mark the entity as out of map, false otherwise.
function fwEntity:set_is_out_of_map(isOutOfMap) end

--- Sets whether the entity has overridden physics bounds.
---@param override boolean True to override physics bounds, false to use default bounds.
function fwEntity:set_override_physics_bounds(override) end

--- Sets whether the entity has moved since the last pre-render update.
---@param hasMoved boolean True if the entity has moved since the last pre-render, false otherwise.
function fwEntity:set_has_moved_since_last_pre_render(hasMoved) end

--- Sets whether the entity uses an extended bounding box.
---@param useExtended boolean True to use an extended bounding box, false to use the standard box.
function fwEntity:set_use_extended_bounding_box(useExtended) end

--- Sets whether the entity is straddling a portal.
---@param isStraddling boolean True if the entity is straddling a portal, false otherwise.
function fwEntity:set_is_straddling_portal(isStraddling) end

--- Sets the current population type of the entity.
---@param popType PopType The population type to set for the entity.
function fwEntity:set_pop_type(popType) end

--- Sets the previous population type of the entity.
---@param popTypePrev PopType The previous population type to set for the entity.
function fwEntity:set_pop_type_prev(popTypePrev) end

---@param number Entity handle.
---@return fwEntity Engine entiny object.
function ent(handle) end