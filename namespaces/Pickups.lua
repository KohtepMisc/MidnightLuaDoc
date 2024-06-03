---@diagnostic disable

---@meta _

---@module pickups
pickups = {}

PickupGroup = {
	INVALID = 0,
	HEALTH = 1,
	MONEY = 2,
	WEAPONS = 3,
	AMMO = 4,
	VEHICLE = 5,
	PORTABLE = 6,
	MISC = 7,
	DLC_WEAPONS = 8,
	NG_ONLY_DLC_WEAPONS = 9,
	MAX = 10
}

PickupPlacementFlags = {
    -- The function returns void.
    PLACEMENT_CREATION_FLAG_NONE = 0,

    -- Map placements are treated as a special case due to their large number.
    PLACEMENT_CREATION_FLAG_MAP = 1,

    -- If set, the spawned pickup will not activate its physics.
    PLACEMENT_CREATION_FLAG_FIXED = 2,

    -- If set, the placement will regenerate the pickup after it has been collected.
    PLACEMENT_CREATION_FLAG_REGENERATES = 4,

    -- If set, the placement will snap to the ground (within a range of 2.0 meters up/down).
    PLACEMENT_CREATION_FLAG_SNAP_TO_GROUND = 8,

    -- If set, the placement will orient to the ground normal (if ground is found).
    PLACEMENT_CREATION_FLAG_ORIENT_TO_GROUND = 16,

    -- If set, the placement will not be cloned on other machines.
    PLACEMENT_CREATION_FLAG_LOCAL_ONLY = 32,

    -- If set, the placement has a simple blip.
    PLACEMENT_CREATION_FLAG_BLIPPED_SIMPLE = 64,

    -- If set, the placement has a complex blip.
    PLACEMENT_CREATION_FLAG_BLIPPED_COMPLEX = 128,

    -- If set, the spawned pickup stands upright.
    PLACEMENT_CREATION_FLAG_UPRIGHT = 256,

    -- If set, the spawned pickup will rotate.
    PLACEMENT_CREATION_FLAG_ROTATE = 512,

    -- If set, the spawned pickup will always face the player.
    PLACEMENT_CREATION_FLAG_FACEPLAYER = 1024,

    -- If set, the spawned pickup will not be rendered when the player is using the phone camera.
    PLACEMENT_CREATION_FLAG_HIDE_IN_PHOTOS = 2048,

    -- If set, the pickup is being dropped as a gift to another player.
    PLACEMENT_CREATION_FLAG_PLAYER_GIFT = 4096,

    -- If set, the pickup may be lying on an object - if so include objects in the probes when placing on ground.
    PLACEMENT_CREATION_FLAG_ON_OBJECT = 8192,

    -- If set, the pickup will glow when it is part of a team.
    PLACEMENT_CREATION_FLAG_GLOW_IN_TEAM = 16384,

    -- If set, the pickup automatically equips when picked up.
    PLACEMENT_CREATION_FLAG_AUTO_EQUIP = 32768,

    -- If set, the pickup can be collected by a ped in a vehicle.
    PLACEMENT_CREATION_FLAG_COLLECTABLE_IN_VEHICLE = 65536,

    -- If set, the weapon pickup will render SD model only (HD<->SD model switch will be disabled).
    PLACEMENT_CREATION_FLAG_DISABLE_WEAPON_HD_MODEL = 131072,

    -- If set, the pickup will render as deferred model (no transparency/alpha blending in this render mode).
    PLACEMENT_CREATION_FLAG_FORCE_DEFERRED_MODEL = 262144,
}

PICKUP_TYPE = {
	-- health
	PICKUP_HEALTH_STANDARD = string.joaat("PICKUP_HEALTH_STANDARD"),
	PICKUP_ARMOUR_STANDARD = string.joaat("PICKUP_ARMOUR_STANDARD"),
	PICKUP_HEALTH_SNACK = string.joaat("PICKUP_HEALTH_SNACK"),

	-- money
	PICKUP_MONEY_VARIABLE = string.joaat("PICKUP_MONEY_VARIABLE"),
	PICKUP_MONEY_CASE = string.joaat("PICKUP_MONEY_CASE"),
	PICKUP_MONEY_WALLET = string.joaat("PICKUP_MONEY_WALLET"),
	PICKUP_MONEY_PURSE = string.joaat("PICKUP_MONEY_PURSE"),
	PICKUP_MONEY_DEP_BAG = string.joaat("PICKUP_MONEY_DEP_BAG"),
	PICKUP_MONEY_MED_BAG = string.joaat("PICKUP_MONEY_MED_BAG"),
	PICKUP_MONEY_PAPER_BAG = string.joaat("PICKUP_MONEY_PAPER_BAG"),
	PICKUP_MONEY_SECURITY_CASE = string.joaat("PICKUP_MONEY_SECURITY_CASE"),
	PICKUP_GANG_ATTACK_MONEY = string.joaat("PICKUP_GANG_ATTACK_MONEY"),

	-- weapons
	PICKUP_WEAPON_PISTOL = string.joaat("PICKUP_WEAPON_PISTOL"),
	PICKUP_WEAPON_COMBATPISTOL = string.joaat("PICKUP_WEAPON_COMBATPISTOL"),
	PICKUP_WEAPON_DLC_PISTOL50 = string.joaat("PICKUP_WEAPON_PISTOL50"),
	PICKUP_WEAPON_APPISTOL = string.joaat("PICKUP_WEAPON_APPISTOL"),
	PICKUP_WEAPON_MICROSMG = string.joaat("PICKUP_WEAPON_MICROSMG"),
	PICKUP_WEAPON_SMG = string.joaat("PICKUP_WEAPON_SMG"),
	PICKUP_WEAPON_DLC_ASSAULTSMG = string.joaat("PICKUP_WEAPON_ASSAULTSMG"),
	PICKUP_WEAPON_ASSAULTRIFLE = string.joaat("PICKUP_WEAPON_ASSAULTRIFLE"),
	PICKUP_WEAPON_CARBINERIFLE = string.joaat("PICKUP_WEAPON_CARBINERIFLE"),
	PICKUP_WEAPON_ADVANCEDRIFLE = string.joaat("PICKUP_WEAPON_ADVANCEDRIFLE"),
	PICKUP_WEAPON_MG = string.joaat("PICKUP_WEAPON_MG"),
	PICKUP_WEAPON_COMBATMG = string.joaat("PICKUP_WEAPON_COMBATMG"),
	PICKUP_WEAPON_DLC_ASSAULTMG = string.joaat("PICKUP_WEAPON_ASSAULTMG"),
	PICKUP_WEAPON_PUMPSHOTGUN = string.joaat("PICKUP_WEAPON_PUMPSHOTGUN"),
	PICKUP_WEAPON_SAWNOFFSHOTGUN = string.joaat("PICKUP_WEAPON_SAWNOFFSHOTGUN"),
	PICKUP_WEAPON_DLC_BULLPUPSHOTGUN = string.joaat("PICKUP_WEAPON_BULLPUPSHOTGUN"),
	PICKUP_WEAPON_ASSAULTSHOTGUN = string.joaat("PICKUP_WEAPON_ASSAULTSHOTGUN"),
	PICKUP_WEAPON_SNIPERRIFLE = string.joaat("PICKUP_WEAPON_SNIPERRIFLE"),
	PICKUP_WEAPON_DLC_ASSAULTSNIPER = string.joaat("PICKUP_WEAPON_ASSAULTSNIPER"),
	PICKUP_WEAPON_HEAVYSNIPER = string.joaat("PICKUP_WEAPON_HEAVYSNIPER"),
	PICKUP_WEAPON_GRENADELAUNCHER = string.joaat("PICKUP_WEAPON_GRENADELAUNCHER"),
	PICKUP_WEAPON_RPG = string.joaat("PICKUP_WEAPON_RPG"),
	PICKUP_WEAPON_MINIGUN = string.joaat("PICKUP_WEAPON_MINIGUN"),
	PICKUP_WEAPON_GRENADE = string.joaat("PICKUP_WEAPON_GRENADE"),
	PICKUP_WEAPON_SMOKEGRENADE = string.joaat("PICKUP_WEAPON_SMOKEGRENADE"),
	PICKUP_WEAPON_STICKYBOMB = string.joaat("PICKUP_WEAPON_STICKYBOMB"),
	PICKUP_WEAPON_MOLOTOV = string.joaat("PICKUP_WEAPON_MOLOTOV"),
	PICKUP_WEAPON_STUNGUN = string.joaat("PICKUP_WEAPON_STUNGUN"),
	PICKUP_WEAPON_RUBBERGUN = string.joaat("PICKUP_WEAPON_RUBBERGUN"),
	PICKUP_WEAPON_DLC_PROGRAMMABLEAR = string.joaat("PICKUP_WEAPON_PROGRAMMABLEAR"),
	PICKUP_WEAPON_FIREEXTINGUISHER = string.joaat("PICKUP_WEAPON_FIREEXTINGUISHER"),
	PICKUP_WEAPON_PETROLCAN = string.joaat("PICKUP_WEAPON_PETROLCAN"),
	PICKUP_WEAPON_LOUDHAILER = string.joaat("PICKUP_WEAPON_LOUDHAILER"),
	PICKUP_WEAPON_KNIFE = string.joaat("PICKUP_WEAPON_KNIFE"),
	PICKUP_WEAPON_NIGHTSTICK = string.joaat("PICKUP_WEAPON_NIGHTSTICK"),
	PICKUP_WEAPON_HAMMER = string.joaat("PICKUP_WEAPON_HAMMER"),
	PICKUP_WEAPON_BAT = string.joaat("PICKUP_WEAPON_BAT"),
	PICKUP_WEAPON_CROWBAR = string.joaat("PICKUP_WEAPON_CROWBAR"),
	PICKUP_WEAPON_GOLFCLUB = string.joaat("PICKUP_WEAPON_GOLFCLUB"),

	-- ammo
	PICKUP_AMMO_BULLET_MP = string.joaat("PICKUP_AMMO_BULLET_MP"),
	PICKUP_AMMO_MISSILE_MP = string.joaat("PICKUP_AMMO_MISSILE_MP"),
	PICKUP_AMMO_GRENADELAUNCHER_MP = string.joaat("PICKUP_AMMO_GRENADELAUNCHER_MP"),
	PICKUP_AMMO_PISTOL = string.joaat("PICKUP_AMMO_PISTOL"),
	PICKUP_AMMO_SMG = string.joaat("PICKUP_AMMO_SMG"),
	PICKUP_AMMO_RIFLE = string.joaat("PICKUP_AMMO_RIFLE"),
	PICKUP_AMMO_MG = string.joaat("PICKUP_AMMO_MG"),
	PICKUP_AMMO_SHOTGUN = string.joaat("PICKUP_AMMO_SHOTGUN"),
	PICKUP_AMMO_SNIPER = string.joaat("PICKUP_AMMO_SNIPER"),
	PICKUP_AMMO_GRENADELAUNCHER = string.joaat("PICKUP_AMMO_GRENADELAUNCHER"),
	PICKUP_AMMO_RPG = string.joaat("PICKUP_AMMO_RPG"),
	PICKUP_AMMO_MINIGUN = string.joaat("PICKUP_AMMO_MINIGUN"),
	PICKUP_AMMO_DLC_RUBBERGUN = string.joaat("PICKUP_AMMO_RUBBERGUN"),
	PICKUP_AMMO_DLC_HARPOON = string.joaat("PICKUP_AMMO_HARPOON"),
	PICKUP_AMMO_DLC_FLAREGUN = string.joaat("PICKUP_AMMO_FLAREGUN"),
	PICKUP_AMMO_DLC_FIREWORK = string.joaat("PICKUP_AMMO_FIREWORK"),
	PICKUP_AMMO_DLC_FIREWORK_MP = string.joaat("PICKUP_AMMO_FIREWORK_MP"),
	PICKUP_AMMO_DLC_AMRIFLE = string.joaat("PICKUP_AMMO_AMRIFLE"),
	PICKUP_AMMO_DLC_CROSSBOW = string.joaat("PICKUP_AMMO_CROSSBOW"),
	PICKUP_AMMO_DLC_HOMINGLAUNCHER = string.joaat("PICKUP_AMMO_HOMINGLAUNCHER"),
	PICKUP_AMMO_EMPLAUNCHER = string.joaat("PICKUP_AMMO_EMPLAUNCHER"),

	-- vehicle pickups
	PICKUP_VEHICLE_HEALTH_STANDARD = string.joaat("PICKUP_VEHICLE_HEALTH_STANDARD"),
	PICKUP_VEHICLE_HEALTH_STANDARD_LOW_GLOW = string.joaat("PICKUP_VEHICLE_HEALTH_STANDARD_LOW_GLOW"),
	PICKUP_VEHICLE_ARMOUR_STANDARD = string.joaat("PICKUP_VEHICLE_ARMOUR_STANDARD"),
	PICKUP_VEHICLE_WEAPON_PISTOL = string.joaat("PICKUP_VEHICLE_WEAPON_PISTOL"),
	PICKUP_VEHICLE_WEAPON_COMBATPISTOL = string.joaat("PICKUP_VEHICLE_WEAPON_COMBATPISTOL"),
	PICKUP_VEHICLE_WEAPON_DLC_PISTOL50 = string.joaat("PICKUP_VEHICLE_WEAPON_PISTOL50"),
	PICKUP_VEHICLE_WEAPON_APPISTOL = string.joaat("PICKUP_VEHICLE_WEAPON_APPISTOL"),
	PICKUP_VEHICLE_WEAPON_MICROSMG = string.joaat("PICKUP_VEHICLE_WEAPON_MICROSMG"),
	PICKUP_VEHICLE_WEAPON_SMG = string.joaat("PICKUP_VEHICLE_WEAPON_SMG"),
	PICKUP_VEHICLE_WEAPON_SAWNOFF = string.joaat("PICKUP_VEHICLE_WEAPON_SAWNOFF"),
	PICKUP_VEHICLE_WEAPON_DLC_ASSAULTSMG = string.joaat("PICKUP_VEHICLE_WEAPON_ASSAULTSMG"),
	PICKUP_VEHICLE_WEAPON_GRENADE = string.joaat("PICKUP_VEHICLE_WEAPON_GRENADE"),
	PICKUP_VEHICLE_WEAPON_SMOKEGRENADE = string.joaat("PICKUP_VEHICLE_WEAPON_SMOKEGRENADE"),
	PICKUP_VEHICLE_WEAPON_STICKYBOMB = string.joaat("PICKUP_VEHICLE_WEAPON_STICKYBOMB"),
	PICKUP_VEHICLE_WEAPON_MOLOTOV = string.joaat("PICKUP_VEHICLE_WEAPON_MOLOTOV"),
	PICKUP_VEHICLE_CUSTOM_SCRIPT = string.joaat("PICKUP_VEHICLE_CUSTOM_SCRIPT"),
	PICKUP_VEHICLE_CUSTOM_SCRIPT_NO_ROTATE = string.joaat("PICKUP_VEHICLE_CUSTOM_SCRIPT_NO_ROTATE"),
	PICKUP_VEHICLE_CUSTOM_SCRIPT_LOW_GLOW = string.joaat("PICKUP_VEHICLE_CUSTOM_SCRIPT_LOW_GLOW"),
	PICKUP_VEHICLE_MONEY_VARIABLE = string.joaat("PICKUP_VEHICLE_MONEY_VARIABLE"),

	-- portable pickups
	PICKUP_PORTABLE_CRATE_UNFIXED = string.joaat("PICKUP_PORTABLE_CRATE_UNFIXED"),
	PICKUP_PORTABLE_CRATE_UNFIXED_INCAR = string.joaat("PICKUP_PORTABLE_CRATE_UNFIXED_INCAR"),
	PICKUP_PORTABLE_CRATE_UNFIXED_INCAR_SMALL = string.joaat("PICKUP_PORTABLE_CRATE_UNFIXED_INCAR_SMALL"),
	PICKUP_PORTABLE_CRATE_UNFIXED_INCAR_WITH_PASSENGERS = string.joaat("PICKUP_PORTABLE_CRATE_UNFIXED_INCAR_WITH_PASSENGERS"),
	PICKUP_PORTABLE_CRATE_UNFIXED_INAIRVEHICLE_WITH_PASSENGERS = string.joaat("PICKUP_PORTABLE_CRATE_UNFIXED_INAIRVEHICLE_WITH_PASSENGERS"),
	PICKUP_PORTABLE_CRATE_UNFIXED_INAIRVEHICLE_WITH_PASSENGERS_UPRIGHT = string.joaat("PICKUP_PORTABLE_CRATE_UNFIXED_INAIRVEHICLE_WITH_PASSENGERS_UPRIGHT"),
	PICKUP_PORTABLE_CRATE_FIXED_INCAR_WITH_PASSENGERS = string.joaat("PICKUP_PORTABLE_CRATE_FIXED_INCAR_WITH_PASSENGERS"),
	PICKUP_PORTABLE_CRATE_UNFIXED_LOW_GLOW = string.joaat("PICKUP_PORTABLE_CRATE_UNFIXED_LOW_GLOW"),
	PICKUP_PORTABLE_CRATE_FIXED_INCAR = string.joaat("PICKUP_PORTABLE_CRATE_FIXED_INCAR"),
	PICKUP_PORTABLE_CRATE_FIXED_INCAR_SMALL = string.joaat("PICKUP_PORTABLE_CRATE_FIXED_INCAR_SMALL"),
	PICKUP_PORTABLE_PACKAGE = string.joaat("PICKUP_PORTABLE_PACKAGE"),
	PICKUP_PORTABLE_DLC_VEHICLE_PACKAGE = string.joaat("PICKUP_PORTABLE_DLC_VEHICLE_PACKAGE"),
	PICKUP_PORTABLE_PACKAGE_LARGE_RADIUS = string.joaat("PICKUP_PORTABLE_PACKAGE_LARGE_RADIUS"),
	PICKUP_PORTABLE_FM_CONTENT_MISSION_ENTITY_SMALL = string.joaat("PICKUP_PORTABLE_FM_CONTENT_MISSION_ENTITY_SMALL"),

	-- misc
	PICKUP_SUBMARINE = string.joaat("PICKUP_SUBMARINE"),
	PICKUP_PARACHUTE = string.joaat("PICKUP_PARACHUTE"),
	PICKUP_CUSTOM_SCRIPT = string.joaat("PICKUP_CUSTOM_SCRIPT"),
	PICKUP_HANDCUFF_KEY = string.joaat("PICKUP_HANDCUFF_KEY"),
	PICKUP_CAMERA = string.joaat("PICKUP_CAMERA"),

	-- dlc weapons
	PICKUP_WEAPON_DLC_BOTTLE = string.joaat("PICKUP_WEAPON_BOTTLE"),
	PICKUP_WEAPON_DLC_SPECIALCARBINE = string.joaat("PICKUP_WEAPON_SPECIALCARBINE"),
	PICKUP_WEAPON_DLC_SNSPISTOL = string.joaat("PICKUP_WEAPON_SNSPISTOL"),
	PICKUP_WEAPON_DLC_BULLPUPRIFLE = string.joaat("PICKUP_WEAPON_BULLPUPRIFLE"),
	PICKUP_WEAPON_DLC_HEAVYPISTOL = string.joaat("PICKUP_WEAPON_HEAVYPISTOL"),
	PICKUP_WEAPON_DLC_DAGGER = string.joaat("PICKUP_WEAPON_DAGGER"),
	PICKUP_WEAPON_DLC_VINTAGEPISTOL = string.joaat("PICKUP_WEAPON_VINTAGEPISTOL"),
	PICKUP_WEAPON_DLC_GUSENBERG = string.joaat("PICKUP_WEAPON_GUSENBERG"),
	PICKUP_WEAPON_DLC_HARPOON = string.joaat("PICKUP_WEAPON_HARPOON"),
	PICKUP_WEAPON_DLC_FLAREGUN = string.joaat("PICKUP_WEAPON_FLAREGUN"),
	PICKUP_WEAPON_DLC_FIREWORK = string.joaat("PICKUP_WEAPON_FIREWORK"),
	PICKUP_WEAPON_DLC_JETPACK = string.joaat("PICKUP_JETPACK"),
	PICKUP_WEAPON_DLC_MUSKET = string.joaat("PICKUP_WEAPON_MUSKET"),
	PICKUP_WEAPON_DLC_AMRIFLE = string.joaat("PICKUP_WEAPON_AMRIFLE"),
	PICKUP_WEAPON_DLC_CROSSBOW = string.joaat("PICKUP_WEAPON_CROSSBOW"),
	PICKUP_WEAPON_DLC_HEAVYSHOTGUN = string.joaat("PICKUP_WEAPON_HEAVYSHOTGUN"),
	PICKUP_WEAPON_DLC_MARKSMANRIFLE = string.joaat("PICKUP_WEAPON_MARKSMANRIFLE"),
	PICKUP_WEAPON_DLC_HOMINGLAUNCHER = string.joaat("PICKUP_WEAPON_HOMINGLAUNCHER"),
	PICKUP_WEAPON_DLC_PROXMINE = string.joaat("PICKUP_WEAPON_PROXMINE"),
	PICKUP_WEAPON_DLC_COMBATPDW = string.joaat("PICKUP_WEAPON_COMBATPDW"),
	PICKUP_WEAPON_DLC_KNUCKLE = string.joaat("PICKUP_WEAPON_KNUCKLE"),
	PICKUP_WEAPON_DLC_MARKSMANPISTOL = string.joaat("PICKUP_WEAPON_MARKSMANPISTOL"),

	-- ng-only dlc weapons
	PICKUP_WEAPON_DLC_HATCHET = string.joaat("PICKUP_WEAPON_HATCHET"),
	PICKUP_WEAPON_DLC_RAILGUN = string.joaat("PICKUP_WEAPON_RAILGUN"),
	PICKUP_WEAPON_DLC_COMPACTRIFLE = string.joaat("PICKUP_WEAPON_COMPACTRIFLE"),
	PICKUP_WEAPON_DLC_DBSHOTGUN = string.joaat("PICKUP_WEAPON_DBSHOTGUN"),
	PICKUP_WEAPON_DLC_MACHETE = string.joaat("PICKUP_WEAPON_MACHETE"),
	PICKUP_WEAPON_DLC_MACHINEPISTOL = string.joaat("PICKUP_WEAPON_MACHINEPISTOL"),
	PICKUP_WEAPON_DLC_FLASHLIGHT = string.joaat("PICKUP_WEAPON_FLASHLIGHT"),
	PICKUP_WEAPON_DLC_REVOLVER = string.joaat("PICKUP_WEAPON_REVOLVER"),
	PICKUP_WEAPON_DLC_SWITCHBLADE = string.joaat("PICKUP_WEAPON_SWITCHBLADE"),
	PICKUP_WEAPON_DLC_AUTOSHOTGUN = string.joaat("PICKUP_WEAPON_AUTOSHOTGUN"),
	PICKUP_WEAPON_DLC_BATTLEAXE = string.joaat("PICKUP_WEAPON_BATTLEAXE"),
	PICKUP_WEAPON_DLC_COMPACTLAUNCHER = string.joaat("PICKUP_WEAPON_COMPACTLAUNCHER"),
	PICKUP_WEAPON_DLC_MINISMG = string.joaat("PICKUP_WEAPON_MINISMG"),
	PICKUP_WEAPON_DLC_PIPEBOMB = string.joaat("PICKUP_WEAPON_PIPEBOMB"),
	PICKUP_WEAPON_DLC_POOLCUE = string.joaat("PICKUP_WEAPON_POOLCUE"),
	PICKUP_WEAPON_DLC_WRENCH = string.joaat("PICKUP_WEAPON_WRENCH"),
	PICKUP_WEAPON_DLC_ASSAULTRIFLE_MK2 = string.joaat("PICKUP_WEAPON_ASSAULTRIFLE_MK2"),
	PICKUP_WEAPON_DLC_CARBINERIFLE_MK2 = string.joaat("PICKUP_WEAPON_CARBINERIFLE_MK2"),
	PICKUP_WEAPON_DLC_COMBATMG_MK2 = string.joaat("PICKUP_WEAPON_COMBATMG_MK2"),
	PICKUP_WEAPON_DLC_HEAVYSNIPER_MK2 = string.joaat("PICKUP_WEAPON_HEAVYSNIPER_MK2"),
	PICKUP_WEAPON_DLC_PISTOL_MK2 = string.joaat("PICKUP_WEAPON_PISTOL_MK2"),
	PICKUP_WEAPON_DLC_SMG_MK2 = string.joaat("PICKUP_WEAPON_SMG_MK2"),
	PICKUP_WEAPON_DLC_BULLPUPRIFLE_MK2 = string.joaat("PICKUP_WEAPON_BULLPUPRIFLE_MK2"),
	PICKUP_WEAPON_DLC_MARKSMANRIFLE_MK2 = string.joaat("PICKUP_WEAPON_MARKSMANRIFLE_MK2"),
	PICKUP_WEAPON_DLC_PUMPSHOTGUN_MK2 = string.joaat("PICKUP_WEAPON_PUMPSHOTGUN_MK2"),
	PICKUP_WEAPON_DLC_REVOLVER_MK2 = string.joaat("PICKUP_WEAPON_REVOLVER_MK2"),
	PICKUP_WEAPON_DLC_SNSPISTOL_MK2 = string.joaat("PICKUP_WEAPON_SNSPISTOL_MK2"),
	PICKUP_WEAPON_DLC_SPECIALCARBINE_MK2 = string.joaat("PICKUP_WEAPON_SPECIALCARBINE_MK2"),
	PICKUP_WEAPON_DLC_DOUBLEACTION = string.joaat("PICKUP_WEAPON_DOUBLEACTION"),
	PICKUP_WEAPON_DLC_STONE_HATCHET = string.joaat("PICKUP_WEAPON_STONE_HATCHET"),
	PICKUP_WEAPON_DLC_RAYPISTOL = string.joaat("PICKUP_WEAPON_RAYPISTOL"),
	PICKUP_WEAPON_DLC_RAYCARBINE = string.joaat("PICKUP_WEAPON_RAYCARBINE"),
	PICKUP_WEAPON_DLC_RAYMINIGUN = string.joaat("PICKUP_WEAPON_RAYMINIGUN"),
	PICKUP_WEAPON_DLC_CERAMICPISTOL = string.joaat("PICKUP_WEAPON_CERAMICPISTOL"),
	PICKUP_WEAPON_DLC_HAZARDCAN = string.joaat("PICKUP_WEAPON_HAZARDCAN"),
	PICKUP_WEAPON_DLC_NAVYREVOLVER = string.joaat("PICKUP_WEAPON_NAVYREVOLVER"),
	PICKUP_WEAPON_DLC_GADGETPISTOL = string.joaat("PICKUP_WEAPON_GADGETPISTOL"),
	PICKUP_WEAPON_DLC_MILITARYRIFLE = string.joaat("PICKUP_WEAPON_MILITARYRIFLE"),
	PICKUP_WEAPON_DLC_COMBATSHOTGUN = string.joaat("PICKUP_WEAPON_COMBATSHOTGUN"),
	PICKUP_WEAPON_DLC_COMPACTSMG = string.joaat("PICKUP_WEAPON_COMPACTSMG"),
	PICKUP_WEAPON_DLC_RIOTSMG = string.joaat("PICKUP_WEAPON_RIOTSMG"),
	PICKUP_WEAPON_DLC_BATON = string.joaat("PICKUP_WEAPON_BATON"),
	PICKUP_WEAPON_DLC_BZGAS_MK2 = string.joaat("PICKUP_WEAPON_BZGAS_MK2"),
	PICKUP_WEAPON_DLC_RIOTSHOTGUN = string.joaat("PICKUP_WEAPON_RIOTSHOTGUN"),
	PICKUP_WEAPON_DLC_FLASHGRENADE = string.joaat("PICKUP_WEAPON_FLASHGRENADE"),
	PICKUP_WEAPON_DLC_STUNGUNCNC = string.joaat("PICKUP_WEAPON_STUNGUNCNC"),
	PICKUP_WEAPON_DLC_POLICERIFLE = string.joaat("PICKUP_WEAPON_POLICERIFLE"),
	PICKUP_WEAPON_DLC_STUNGRENADE = string.joaat("PICKUP_WEAPON_STUNGRENADE"),
	PICKUP_WEAPON_DLC_HEAVYRIFLE = string.joaat("PICKUP_WEAPON_HEAVYRIFLE"),
	PICKUP_WEAPON_DLC_EMPLAUNCHER = string.joaat("PICKUP_WEAPON_EMPLAUNCHER"),
	PICKUP_WEAPON_DLC_FERTILIZERCAN = string.joaat("PICKUP_WEAPON_FERTILIZERCAN"),
	PICKUP_WEAPON_DLC_STUNGUN_MP = string.joaat("PICKUP_WEAPON_STUNGUN_MP"),
	PICKUP_WEAPON_DLC_METALDETECTOR = string.joaat("PICKUP_WEAPON_METALDETECTOR"),
	PICKUP_WEAPON_DLC_TACTICALRIFLE = string.joaat("PICKUP_WEAPON_TACTICALRIFLE"),
	PICKUP_WEAPON_DLC_PRECISIONRIFLE = string.joaat("PICKUP_WEAPON_PRECISIONRIFLE"),
}

--- @class pickup_type_t
--- @field public hash number
--- @field public name string
--- @field public model_hash number
pickup_type_t = {}

--- @class pickup_group_t
--- @field public group number
--- @field public group_name string
--- @field public types table<number, pickup_type_t>
pickup_group_t = {}

--- Checks if the given pickup type is likely to trigger a pickup spawn block and possibly activate anti-cheat systems.
---@param pickupType number The type of the pickup to check (PICKUP_TYPE values can be used here).
---@return boolean True if the pickup type may cause a spawn block and trigger anti-cheat systems, false otherwise.
function pickups.is_money_detected_hash(pickupType) end

--- Finds a pickup group by its hash.
---@param hashHash PICKUP_TYPE The hash of the pickup group.
---@return pickup_group_t|nil The pickup group if found; nil otherwise.
function pickups.find_group_by_hash(hashHash) end

--- Finds a pickup group by its model hash.
---@param modelHash Hash The model hash of the pickup group.
---@return pickup_group_t|nil The pickup group if found; nil otherwise.
function pickups.find_group_by_model(modelHash) end

--- Finds a pickup type by its hash.
---@param pickupHash PICKUP_TYPE The hash of the pickup type.
---@return pickup_type_t|nil The pickup type if found; nil otherwise.
function pickups.find_pickup_by_hash(pickupHash) end

--- Finds a pickup type by its model hash.
---@param modelHash Hash The model hash of the pickup type.
---@return pickup_type_t|nil The pickup type if found; nil otherwise.
function pickups.find_pickup_by_model(modelHash) end

--- Spawns a pickup at the specified position.
--- @param pickup PICKUP_TYPE|pickup_type_t The type of the pickup as a PICKUP_TYPE hash or a pickup_type_t object.
--- @param pos? Vector3 The position to spawn the pickup at, defined as {x, y, z}. If not provided, a position near the local player will be used.
--- @param amount? integer The amount of the pickup to spawn, if applicable. Default is 1000.
--- @return number The handle of the spawned pickup.
function pickups.spawn(pickup, pos, amount) end

--- Spawns a pickup for a specified player, allowing for optional parameters such as model hash and amount.
--- @param pickup PICKUP_TYPE|pickup_type_t The type of the pickup as a PICKUP_TYPE hash or a pickup_type_t object.
--- @param modelHash Hash The model hash of the pickup.
--- @param player player_t The player for whom the pickup is being spawned.
--- @param amount? integer The amount of the pickup to spawn. Default is 1000.
--- @return number The handle of the spawned pickup.
--- @overload fun(pickup: PICKUP_TYPE|pickup_type_t, player: number|player_t, amount: integer): number
--- @overload fun(pickup: PICKUP_TYPE, modelHash: Hash, player: number|player_t, amount: integer): number
function pickups.spawn_for_player(pickup, modelHash, player, amount) end

--- Spawns a pickup group at the specified position with optional parameters for amount and despawn time.
--- @param group PickupGroup The group of pickups to spawn.
--- @param pos? Vector3 The position to spawn the pickup group at, defined as {x, y, z}. Defaults to a position in front of the player.
--- @param amount? integer The number of pickups in the group to spawn. Defaults to 1000.
--- @param despawnTime? integer The time in milliseconds after which the spawned pickup will be destroyed if not picked up. Defaults to 0, which means it will not despawn automatically.
--- @return table A Lua table containing the spawned pickups.
function pickups.spawn_group(group, pos, amount, despawnTime) end

--- Spawns a health pickup for a specified player or the local player with an optional despawn time.
--- @param player? number|player_t The player identifier for whom the health pickup is spawned. If not provided, spawns for the local player.
--- @param despawnTime? integer The time in milliseconds after which the spawned health pickup will be destroyed if not picked up. Defaults to 0, which means it will not despawn automatically.
--- @return boolean true if the health pickup was successfully spawned, false otherwise.
--- @return number The handle of the spawned pickup.
function pickups.spawn_health(player, despawnTime) end

--- Spawns an armor pickup for a specified player or the local player with an optional despawn time.
--- @param player? number|player_t The player identifier or object for whom the armor pickup is spawned. If not provided, spawns for the local player.
--- @param despawnTime? integer The time in milliseconds after which the spawned armor pickup will be destroyed if not picked up. Defaults to 0, which means it will not despawn automatically.
--- @return boolean true if the armor pickup was successfully spawned, false otherwise.
--- @return number The handle of the spawned pickup.
function pickups.spawn_armor(player, despawnTime) end

--- Spawns weapon pickups for a specified player or the local player with an optional despawn time.
--- @param player? number|player_t The player identifier or object for whom the weapons are spawned. If not provided, spawns for the local player.
--- @param despawnTime? integer The time in milliseconds after which the spawned weapons will be destroyed if not picked up. Defaults to 0, which means they will not despawn automatically.
--- @return table A Lua table containing the spawned pickups.
function pickups.spawn_weapons(player, despawnTime) end

--- Spawns ammo pickups for a specified player or the local player with an optional despawn time.
--- @param player? number|player_t The player identifier or object for whom the ammo is spawned. If not provided, spawns for the local player.
--- @param despawnTime? integer The time in milliseconds after which the spawned ammo will be destroyed if not picked up. Defaults to 0, which means it will not despawn automatically.
--- @return table A Lua table containing the spawned pickups.
function pickups.spawn_ammo(player, despawnTime) end

--- Spawns a pickup with detailed parameters such as model hash, position, amount, placement flags, despawn time, and model forcing.
--- @param hPickup PICKUP_TYPE The type of the pickup.
--- @param hModel Hash? The model hash of the pickup. Optional, defaults to a model associated with the pickup type or a default weapon model if force_model is true and model is absent.
--- @param pos Vector3? The position to spawn the pickup at, defined as {x, y, z}. Optional, defaults to a position in front of the player.
--- @param amount integer? The amount of the pickup to spawn. Optional, defaults to 1000.
--- @param flags PickupPlacementFlags? Placement flags for the pickup. Optional, defaults to PLACEMENT_CREATION_FLAG_MAP | PLACEMENT_CREATION_FLAG_REGENERATES.
--- @param despawnTime number? The time in milliseconds after which the spawned pickup will be destroyed if not picked up. Optional, defaults to no despawn.
--- @param forceModel boolean? Whether to force the hModel to be used even if it's not normally associated with the hPickup type. Optional, defaults to false.
--- @return number The handle of the spawned pickup.
function pickups.spawn_ex(hPickup, hModel, pos, amount, flags, despawnTime, forceModel) end