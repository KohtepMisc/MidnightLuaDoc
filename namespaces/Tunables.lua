---@diagnostic disable

---@meta _

---@module tunables
tunables = {}

--- Checks if any tunables are currently loaded and available.
--- Returns true if there are tunables available, false otherwise.
---@return boolean Returns true if tunables are available; otherwise, returns false.
function tunables.ready() end

--- Retrieves a tunable integer value.
--- Allows specifying a request key, which can be either a tunable name or a tunable hash, and an optional default value.
---@param request string|number The request key, which can be either a tunable name or a tunable hash.
---@param default integer? Optional default value to return if the tunable is not found.
---@return integer Returns the integer value of the tunable if found; otherwise, returns the default value or 0 if no default is provided.
function tunables.get_int(request, default) end

--- Retrieves a tunable float value.
--- Allows specifying a request key, which can be either a tunable name or a tunable hash, and an optional default value.
---@param request string|number The request key, which can be either a tunable name or a tunable hash.
---@param default number? Optional default value to return if the tunable is not found.
---@return number Returns the float value of the tunable if found; otherwise, returns the default value or 0.0 if no default is provided.
function tunables.get_float(request, default) end

--- Retrieves a tunable boolean value.
--- Allows specifying a request key, which can be either a tunable name or a tunable hash, and an optional default value.
---@param request string|number The request key, which can be either a tunable name or a tunable hash.
---@param default boolean? Optional default value to return if the tunable is not found.
---@return boolean Returns the boolean value of the tunable if found (true if non-zero); otherwise, returns the default value or false if no default is provided.
function tunables.get_bool(request, default) end

--- Sets a tunable integer value.
--- Allows specifying a request key, which can be either a tunable name or a tunable hash, and the value to set.
---@param request string|number The request key, which can be either a tunable name or a tunable hash.
---@param value integer The integer value to set for the tunable.
---@return boolean Returns true if the value was successfully set; otherwise, returns false.
function tunables.set_int(request, value) end

--- Sets a tunable float value.
--- Allows specifying a request key, which can be either a tunable name or a tunable hash, and the value to set.
---@param request string|number The request key, which can be either a tunable name or a tunable hash.
---@param value number The float value to set for the tunable.
---@return boolean Returns true if the value was successfully set; otherwise, returns false.
function tunables.set_float(request, value) end

--- Sets a tunable boolean value.
--- Allows specifying a request key, which can be either a tunable name or a tunable hash, and the value to set.
---@param request string|number The request key, which can be either a tunable name or a tunable hash.
---@param value boolean The boolean value to set for the tunable.
---@return boolean Returns true if the value was successfully set; otherwise, returns false.
function tunables.set_bool(request, value) end

--- Retrieves all tunable values as a table.
--- Each entry in the table maps a hash key to its corresponding offset.
---@return table Returns a table where each key is a hash and the value is the corresponding offset.
function tunables.get_all() end

--- Retrieves a tunable value as a ScrVar object.
--- Allows specifying a request key, which can be either a tunable name or a tunable hash. 
--- If the specified key does not match any tunable, returns nil.
---@param request string|number The request key, which can be either a tunable name or a tunable hash.
---@return ScrVar|nil Returns a ScrVar object representing the tunable if found; otherwise, returns nil.
function tunable(request) end