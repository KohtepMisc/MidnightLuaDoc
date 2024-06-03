---@diagnostic disable

---@meta _

---@module social
social = {}

--- Checks if a player is online using either the player's Rockstar ID or name.
--- This function is asynchronous and calls the provided callback with the response.
--- @overload fun(rockstar_id: integer, on_response: function(rid: integer, result: string)): Checks player status using Rockstar ID.
--- @overload fun(name: string, on_response: function(rid: integer, result: string)): Checks player status using player's name.
--- @param rockstar_id_or_name integer|string The Rockstar ID or name of the player.
--- @param on_response function(rid: integer, result: string) The callback function to handle the response.
---   - `rid`: The Rockstar ID of the player.
---   - `result`: The session token.
function social.is_player_online(rockstar_id_or_name, on_response) end

--- Determines if the social system is ready for interactions.
--- If this function returns true, the 'account' and 'geoloc' modules can be used.
--- @return boolean Returns true if the social system is ready, enabling further interaction with 'account' and 'geoloc' modules.
function social.is_ready() end

---@module geoloc
geoloc = {}

--- Retrieves the regional code of the user's location.
--- If geolocation information is unavailable, returns 0.
--- @return integer The region code if available, otherwise 0.
function geoloc.get_region_code() end

--- Retrieves the longitude of the user's location.
--- If geolocation information is unavailable, returns 0.0.
--- @return number The longitude if available, otherwise 0.0.
function geoloc.get_longitude() end

--- Retrieves the latitude of the user's location.
--- If geolocation information is unavailable, returns 0.0.
--- @return number The latitude if available, otherwise 0.0.
function geoloc.get_latitude() end

--- Determines if the user is using secure relays for connections.
--- If geolocation information is unavailable, returns false.
--- @return boolean Returns true if secure relays are being used, false otherwise.
function geoloc.get_is_secure() end

--- Retrieves the country code of the user's location.
--- If geolocation information is unavailable, returns an empty string.
--- @return string The country code if available, otherwise an empty string.
function geoloc.get_country_code() end

---@module account
account = {}

--- Retrieves the age associated with the user's account.
--- If account information is unavailable, returns 0.
--- @return integer The age if available, otherwise 0.
function account.get_age() end

--- Retrieves the URL to the avatar image associated with the user's account.
--- If account information is unavailable, returns an empty string.
--- @return string The URL to the avatar image if available, otherwise an empty string.
function account.get_avatar_url() end

--- Retrieves the country code associated with the user's account.
--- If account information is unavailable, returns an empty string.
--- @return string The country code if available, otherwise an empty string.
function account.get_country_code() end

--- Retrieves the date of birth (DOB) associated with the user's account, expressed as "MM/DD/YYYY".
--- If account information is unavailable, returns an empty string.
--- @return string The DOB if available, otherwise an empty string.
function account.get_dob() end

--- Determines if the DOB associated with the user's account is approximate.
--- "True" if the DOB is approximate (i.e., only the year YYYY is known).
--- If account information is unavailable, returns false.
--- @return boolean Returns true if the DOB is approximate, false otherwise.
function account.get_is_approx_dob() end

--- Retrieves the 2-letter language code associated with the user's account.
--- If account information is unavailable, returns an empty string.
--- @return string The language code if available, otherwise an empty string.
function account.get_language_code() end

--- Retrieves the phone number associated with the user's account.
--- If account information is unavailable, returns an empty string.
--- @return string The phone number if available, otherwise an empty string.
function account.get_phone() end

--- Retrieves the Rockstar ID associated with the user.
--- If account information is unavailable, returns 0.
--- @return integer The Rockstar ID if available, otherwise 0.
function account.get_rockstar_id() end

--- Retrieves the ZIP code associated with the user's account.
--- If account information is unavailable, returns an empty string.
--- @return string The ZIP code if available, otherwise an empty string.
function account.get_zip_code() end

--- Retrieves the nickname associated with the user's account.
--- If account information is unavailable, returns an empty string.
--- @return string The nickname if available, otherwise an empty string.
function account.get_nickname() end