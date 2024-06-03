---@diagnostic disable

---@meta _

---@module memory
memory = {}

--- Attempts to find the global offset for a specific tuneable.
--- This function can search for a tuneable based on its hash value or its name.
--- Note: The `tuneables_processing` script must be loaded for this function to work. Ensure to fully connect to the game before using this function.
---@overload fun(hash:integer):number
---@overload fun(name:string):number
---@param hashOrName integer|string The hash value or the name of the tuneable to search for.
--- Example using a hash:
--- local t = memory.scan_tuneable(0x7bce19d6) -- @1.67: 12883
--- Example using a name:
--- local t = memory.scan_tuneable("XMAS2015_VEHICLE") -- @1.67: 12883
---@return number The global offset where the tuneable was found, or 0 if the tuneable was not found.
function memory.scan_tuneable(hashOrName) end

--- Scan for a function in the script using a signature or an offset.
--- This function provides two ways to find a function in a script:
--- 1. Using a string signature to locate the function.
--- 2. Using an integer offset within the script to find the function.
--- The returned `ScrFunction` object has an `is_found` method to check if the function was successfully located
--- and can be called directly with any required parameters.
---@overload fun(script:string, signature:string):userdata
---@overload fun(script:string, offset:number):userdata
---@param script string The name of the script in which to search for the function.
---@param signatureOrOffset string|number The signature of the function to find or the offset of the function in the script.
--- Example using a signature:
--- local func = memory.scan_function("freemode", "$ENTER 00 03 00 00 $PUSH_CONST_0 $LOCAL_U8_STORE 02 $LOCAL_U8_LOAD 02 $PUSH_CONST_U8 ? $ILT_JZ ? ? $LOCAL_U8_LOAD 02 $GLOBAL_U24 ? ? ? $IOFFSET_U8 ? $ARRAY_U8_LOAD ? $PUSH_CONST_1")
--- if func:is_found() then
---     local result = func(123, "example argument") -- Call the function with arguments
---     print("Function call result:", result)
--- end
--- Example using an offset:
--- local func = memory.scan_function("freemode", 1000)
--- if func:is_found() then
---     local result = func() -- Call the function without arguments
---     print("Function call result:", result)
--- end
---@return userdata The found function as a `ScrFunction` object. If no function is found, the returned object's `is_found` method will return `false`.
function memory.scan_function(script, signatureOrOffset) end

--- Allocates memory of specified size and initializes it to zero.
---@param size number? The size of the memory to allocate.
---|> 24
---@return userdata Pointer to the allocated memory.
function memory.alloc(size) end

--- Allocates 1 byte of memory (unsigned char) and initializes it to zero.
---@return userdata Pointer to the allocated memory.
function memory.alloc_u8() end

--- Allocates 2 bytes of memory (unsigned short) and initializes it to zero.
---@return userdata Pointer to the allocated memory.
function memory.alloc_u16() end

--- Allocates 3 bytes of memory and initializes it to zero.
---@return userdata Pointer to the allocated memory.
function memory.alloc_u24() end

--- Allocates 4 bytes of memory (unsigned integer) and initializes it to zero.
---@return userdata Pointer to the allocated memory.
function memory.alloc_u32() end

--- Allocates 8 bytes of memory (unsigned long long) and initializes it to zero.
---@return userdata Pointer to the allocated memory.
function memory.alloc_u64() end

--- Allocates memory for a vector, with optional 8-byte alignment.
--- The function allocates memory of size either 24 bytes (if 8-byte aligned) or 12 bytes (if not aligned) and initializes it to zero.
---@param is8Aligned boolean? A boolean value to determine if the allocated memory should be 8-byte aligned (default is true).
---@return userdata Pointer to the allocated memory.
function memory.alloc_vector(is8Aligned) end

--- Frees memory that was allocated by any of the alloc functions.
---@param ptr userdata Pointer to the memory to free.
function memory.free(ptr) end

---@class ScrFunction
ScrFunction = {}

--- Calls the script function with the provided arguments.
--- This function should be used within a script thread to avoid runtime issues.
--- @warning Calling this outside a script thread will terminate the function and return 0. Always ensure proper context.
--- @note If a return type of string is expected, use the global 'str' function to convert the result.
--- @param ... The arguments to pass to the script function.
--- @return The result of the script function call.
function ScrFunction:__call(...) end

--- Checks if the script function has been successfully located.
--- @return boolean True if the function is found, false otherwise.
function ScrFunction:is_found() end

--- Checks if the script function is callable.
--- @return boolean True if the function can be called, false otherwise.
function ScrFunction:is_callable() end

---@class CMemHandle
CMemHandle = {}

--- Sets the pointer to be managed by the class.
--- This method assigns a new pointer to the memory handle.
---@param pointer userdata A pointer to be managed.
function CMemHandle:set(pointer) end

--- Gets the pointer managed by the class.
--- This method retrieves the current pointer being managed.
---@return userdata The pointer being managed.
function CMemHandle:get() end

--- Checks whether the class is managing a valid pointer.
--- This method verifies if the managed pointer is valid (not null).
---@return boolean A boolean indicating whether the class is managing a valid pointer.
function CMemHandle:is_valid() end

--- Adds an offset to the current memory address handled by the class.
--- This method creates a new instance of CMemHandle with an adjusted memory address by adding the specified offset.
---@param offset number The offset to be added to the current memory address.
---@return CMemHandle A new instance of the class with the adjusted memory address.
function CMemHandle:add(offset) end

--- Subtracts an offset from the current memory address handled by the class.
--- This method creates a new instance of CMemHandle with an adjusted memory address by subtracting the specified offset.
---@param offset number The offset to be subtracted from the current memory address.
---@return CMemHandle A new instance of the class with the adjusted memory address.
function CMemHandle:sub(offset) end

--- Performs a relative instruction pointer (RIP) adjustment on the memory address handled by the class.
--- This method creates a new instance of CMemHandle with an adjusted memory address. If the adjusted address is invalid, it is reset in the new instance.
---@return CMemHandle A new instance of the class with the adjusted memory address.
function CMemHandle:rip() end

--- Checks if the signed 8-bit integer at the managed pointer matches a given value.
---@overload fun(self:CMemHandle, value:number):boolean
---@overload fun(self:CMemHandle, value:number, offset:number):boolean
---@param value number A signed 8-bit integer to check against.
---@param offset number? An optional offset from the managed pointer.
---@return boolean A boolean indicating whether the value matches the given value.
function CMemHandle:check_s8(value, offset) end

--- Checks if the signed 16-bit integer at the managed pointer matches a given value.
---@overload fun(self:CMemHandle, value:number):boolean
---@overload fun(self:CMemHandle, value:number, offset:number):boolean
---@param value number A signed 16-bit integer to check against.
---@param offset number? An optional offset from the managed pointer.
---@return boolean A boolean indicating whether the value matches the given value.
function CMemHandle:check_s16(value, offset) end

--- Checks if the 24-bit signed integer at the managed pointer matches a given value.
---@overload fun(self:CMemHandle, value:number):boolean
---@overload fun(self:CMemHandle, value:number, offset:number):boolean
---@param value number A 24-bit signed integer to check against.
---@param offset number? An optional offset from the managed pointer.
---@return boolean A boolean indicating whether the value matches the given value.
function CMemHandle:check_s24(value, offset) end

--- Checks if the 32-bit signed integer at the managed pointer matches a given value.
---@overload fun(self:CMemHandle, value:number):boolean
---@overload fun(self:CMemHandle, value:number, offset:number):boolean
---@param value number A 32-bit signed integer to check against.
---@param offset number? An optional offset from the managed pointer.
---@return boolean A boolean indicating whether the value matches the given value.
function CMemHandle:check_s32(value, offset) end

--- Checks if the 64-bit signed integer at the managed pointer matches a given value.
---@overload fun(self:CMemHandle, value:number):boolean
---@overload fun(self:CMemHandle, value:number, offset:number):boolean
---@param value number A 64-bit signed integer to check against.
---@param offset number? An optional offset from the managed pointer.
---@return boolean A boolean indicating whether the value matches the given value.
function CMemHandle:check_s64(value, offset) end

--- Checks if the 8-bit unsigned integer at the managed pointer matches a given value.
---@overload fun(self:CMemHandle, value:number):boolean
---@overload fun(self:CMemHandle, value:number, offset:number):boolean
---@param value number An 8-bit unsigned integer to check against.
---@param offset number? An optional offset from the managed pointer.
---@return boolean A boolean indicating whether the value matches the given value.
function CMemHandle:check_u8(value, offset) end

--- Checks if the 16-bit unsigned integer at the managed pointer matches a given value.
---@overload fun(self:CMemHandle, value:number):boolean
---@overload fun(self:CMemHandle, value:number, offset:number):boolean
---@param value number A 16-bit unsigned integer to check against.
---@param offset number? An optional offset from the managed pointer.
---@return boolean A boolean indicating whether the value matches the given value.
function CMemHandle:check_u16(value, offset) end

--- Checks if the 24-bit unsigned integer at the managed pointer matches a given value.
---@overload fun(self:CMemHandle, value:number):boolean
---@overload fun(self:CMemHandle, value:number, offset:number):boolean
---@param value number A 24-bit unsigned integer to check against.
---@param offset number? An optional offset from the managed pointer.
---@return boolean A boolean indicating whether the value matches the given value.
function CMemHandle:check_u24(value, offset) end

--- Checks if the 32-bit unsigned integer at the managed pointer matches a given value.
---@overload fun(self:CMemHandle, value:number):boolean
---@overload fun(self:CMemHandle, value:number, offset:number):boolean
---@param value number A 32-bit unsigned integer to check against.
---@param offset number? An optional offset from the managed pointer.
---@return boolean A boolean indicating whether the value matches the given value.
function CMemHandle:check_u32(value, offset) end

--- Checks if the unsigned 64-bit integer at the managed pointer matches a given value.
---@overload fun(self:CMemHandle, value:number):boolean
---@overload fun(self:CMemHandle, value:number, offset:number):boolean
---@param value number An unsigned 64-bit integer to check against.
---@param offset number? An optional offset from the managed pointer.
---@return boolean A boolean indicating whether the value matches the given value.
function CMemHandle:check_u64(value, offset) end

--- Checks if the null-terminated string at the managed pointer matches a given value.
---@overload fun(self:CMemHandle, value:string):boolean
---@overload fun(self:CMemHandle, value:string, length:number):boolean
---@overload fun(self:CMemHandle, value:string, length:number, caseSensitive:boolean):boolean
---@param value string A pointer to a null-terminated string to check against.
---@param length number? The length of the string to compare.
---@param caseSensitive boolean? Indicates whether the comparison should be case-sensitive or not.
---@return boolean A boolean indicating whether the string at the managed pointer matches the given value.
function CMemHandle:check_string(value, length, caseSensitive) end

--- Writes an 8-bit signed integer value to the managed pointer.
---@overload fun(self:CMemHandle, value:number):boolean
---@overload fun(self:CMemHandle, value:number, offset:number):boolean
---@param value number An 8-bit signed integer value to write.
---@param offset number? An offset from the managed pointer.
---@return boolean A boolean indicating the success of the write operation.
function CMemHandle:write_s8(value, offset) end

--- Writes a 16-bit signed integer value to the managed pointer.
---@overload fun(self:CMemHandle, value:number):boolean
---@overload fun(self:CMemHandle, value:number, offset:number):boolean
---@param value number A 16-bit signed integer value to write.
---@param offset number? An offset from the managed pointer.
---@return boolean A boolean indicating the success of the write operation.
function CMemHandle:write_s16(value, offset) end

--- Writes a 24-bit signed integer value to the managed pointer.
---@overload fun(self:CMemHandle, value:number):boolean
---@overload fun(self:CMemHandle, value:number, offset:number):boolean
---@param value number A 24-bit signed integer value to write.
---@param offset number? An offset from the managed pointer.
---@return boolean A boolean indicating the success of the write operation.
function CMemHandle:write_s24(value, offset) end

--- Writes a 32-bit signed integer value to the managed pointer.
---@overload fun(self:CMemHandle, value:number):boolean
---@overload fun(self:CMemHandle, value:number, offset:number):boolean
---@param value number A 32-bit signed integer value to write.
---@param offset number? An offset from the managed pointer.
---@return boolean A boolean indicating the success of the write operation.
function CMemHandle:write_s32(value, offset) end

--- Writes a 64-bit signed integer value to the managed pointer.
---@overload fun(self:CMemHandle, value:number):boolean
---@overload fun(self:CMemHandle, value:number, offset:number):boolean
---@param value number A 64-bit signed integer value to write.
---@param offset number? An offset from the managed pointer.
---@return boolean A boolean indicating the success of the write operation.
function CMemHandle:write_s64(value, offset) end

--- Writes an 8-bit unsigned integer value to the managed pointer.
---@overload fun(self:CMemHandle, value:number):boolean
---@overload fun(self:CMemHandle, value:number, offset:number):boolean
---@param value number An 8-bit unsigned integer value to write.
---@param offset number? An offset from the managed pointer.
---@return boolean A boolean indicating the success of the write operation.
function CMemHandle:write_u8(value, offset) end

--- Writes a 16-bit unsigned integer value to the managed pointer.
---@overload fun(self:CMemHandle, value:number):boolean
---@overload fun(self:CMemHandle, value:number, offset:number):boolean
---@param value number A 16-bit unsigned integer value to write.
---@param offset number? An offset from the managed pointer.
---@return boolean A boolean indicating the success of the write operation.
function CMemHandle:write_u16(value, offset) end

--- Writes a 24-bit unsigned integer value to the managed pointer.
---@overload fun(self:CMemHandle, value:number):boolean
---@overload fun(self:CMemHandle, value:number, offset:number):boolean
---@param value number A 24-bit unsigned integer value to write.
---@param offset number? An offset from the managed pointer.
---@return boolean A boolean indicating the success of the write operation.
function CMemHandle:write_u24(value, offset) end

--- Writes a 32-bit unsigned integer value to the managed pointer.
---@overload fun(self:CMemHandle, value:number):boolean
---@overload fun(self:CMemHandle, value:number, offset:number):boolean
---@param value number A 32-bit unsigned integer value to write.
---@param offset number? An offset from the managed pointer.
---@return boolean A boolean indicating the success of the write operation.
function CMemHandle:write_u32(value, offset) end

--- Writes a 64-bit unsigned integer value to the managed pointer.
---@overload fun(self:CMemHandle, value:number):boolean
---@overload fun(self:CMemHandle, value:number, offset:number):boolean
---@param value number A 64-bit unsigned integer value to write.
---@param offset number? An offset from the managed pointer.
---@return boolean A boolean indicating the success of the write operation.
function CMemHandle:write_u64(value, offset) end

--- Writes a null-terminated string to the managed pointer.
---@overload fun(self:CMemHandle, value:string):boolean
---@overload fun(self:CMemHandle, value:string, offset:number):boolean
---@param value string A null-terminated string to write.
---@param offset number? An offset from the managed pointer.
---@return boolean A boolean indicating the success of the write operation.
function CMemHandle:write_string(value, offset) end

--- Writes a Vector3 object to the managed pointer.
---@overload fun(self:CMemHandle, vector:userdata):boolean
---@overload fun(self:CMemHandle, vector:userdata, is8Aligned:boolean):boolean
---@overload fun(self:CMemHandle, vector:userdata, is8Aligned:boolean, offset:number):boolean
---@param vector userdata A Vector3 object to write.
---@param is8Aligned boolean Indicates whether the write operation should be 8-byte aligned.
---@param offset number? An offset from the managed pointer.
---@return boolean A boolean indicating the success of the write operation.
function CMemHandle:write_vector(vector, is8Aligned, offset) end

--- Reads an 8-bit signed integer value from the managed pointer.
---@overload fun(self:CMemHandle):number
---@overload fun(self:CMemHandle, offset:number):number
---@param offset number? An offset from the managed pointer.
---@return number An 8-bit signed integer value read.
function CMemHandle:read_s8(offset) end

--- Reads a 16-bit signed integer value from the managed pointer.
---@overload fun(self:CMemHandle):number
---@overload fun(self:CMemHandle, offset:number):number
---@param offset number? An offset from the managed pointer.
---@return number A 16-bit signed integer value read.
function CMemHandle:read_s16(offset) end

--- Reads a 24-bit signed integer value from the managed pointer.
---@overload fun(self:CMemHandle):number
---@overload fun(self:CMemHandle, offset:number):number
---@param offset number? An offset from the managed pointer.
---@return number A 24-bit signed integer value read.
function CMemHandle:read_s24(offset) end

--- Reads a 32-bit signed integer value from the managed pointer.
---@overload fun(self:CMemHandle):number
---@overload fun(self:CMemHandle, offset:number):number
---@param offset number? An offset from the managed pointer.
---@return number A 32-bit signed integer value read.
function CMemHandle:read_s32(offset) end

--- Reads a 64-bit signed integer value from the managed pointer.
---@overload fun(self:CMemHandle):number
---@overload fun(self:CMemHandle, offset:number):number
---@param offset number? An offset from the managed pointer.
---@return number A 64-bit signed integer value read.
function CMemHandle:read_s64(offset) end

--- Reads an 8-bit unsigned integer value from the managed pointer.
---@overload fun(self:CMemHandle):number
---@overload fun(self:CMemHandle, offset:number):number
---@param offset number? An offset from the managed pointer.
---@return number An 8-bit unsigned integer value read.
function CMemHandle:read_u8(offset) end

--- Reads a 16-bit unsigned integer value from the managed pointer.
---@overload fun(self:CMemHandle):number
---@overload fun(self:CMemHandle, offset:number):number
---@param offset number? An offset from the managed pointer.
---@return number A 16-bit unsigned integer value read.
function CMemHandle:read_u16(offset) end

--- Reads a 24-bit unsigned integer value from the managed pointer.
---@overload fun(self:CMemHandle):number
---@overload fun(self:CMemHandle, offset:number):number
---@param offset number? An offset from the managed pointer.
---@return number A 24-bit unsigned integer value read.
function CMemHandle:read_u24(offset) end

--- Reads a 32-bit unsigned integer value from the managed pointer.
---@overload fun(self:CMemHandle):number
---@overload fun(self:CMemHandle, offset:number):number
---@param offset number? An offset from the managed pointer.
---@return number A 32-bit unsigned integer value read.
function CMemHandle:read_u32(offset) end

--- Reads a 64-bit unsigned integer value from the managed pointer.
---@overload fun(self:CMemHandle):number
---@overload fun(self:CMemHandle, offset:number):number
---@param offset number? An offset from the managed pointer.
---@return number A 64-bit unsigned integer value read.
function CMemHandle:read_u64(offset) end

--- Writes a floating-point value to the managed pointer.
---@overload fun(self:CMemHandle, value:number):boolean
---@overload fun(self:CMemHandle, value:number, offset:number):boolean
---@param value number A floating-point value to write.
---@param offset number? An offset from the managed pointer.
---@return boolean A boolean indicating the success of the write operation.
function CMemHandle:write_float(value, offset) end

--- Reads a floating-point value from the managed pointer.
---@overload fun(self:CMemHandle):number
---@overload fun(self:CMemHandle, offset:number):number
---@param offset number? An offset from the managed pointer.
---@return number A floating-point value read.
function CMemHandle:read_float(offset) end

--- Checks if the floating-point value at the managed pointer matches a given value.
---@overload fun(self:CMemHandle, value:number):boolean
---@overload fun(self:CMemHandle, value:number, offset:number):boolean
---@param value number A floating-point value to check against.
---@param offset number? An offset from the managed pointer.
---@return boolean A boolean indicating whether the value matches the given value.
function CMemHandle:check_float(value, offset) end

--- Reads a null-terminated string from the managed pointer.
---@overload fun(self:CMemHandle):string
---@overload fun(self:CMemHandle, offset:number):string
---@param offset number? An offset from the managed pointer.
---@return string A string read from the managed pointer or the offset.
function CMemHandle:read_string(offset) end

--- Reads a Vector3 object from the managed pointer.
---@overload fun(self:CMemHandle):userdata
---@overload fun(self:CMemHandle, is8Aligned:boolean):userdata
---@overload fun(self:CMemHandle, is8Aligned:boolean, offset:number):userdata
---@param is8Aligned boolean Indicates whether the read operation should be 8-byte aligned.
---@param offset number? An offset from the managed pointer.
---@return userdata A Vector3 object read from the managed pointer or the offset.
function CMemHandle:read_vector(is8Aligned, offset) end

--- Reads a boolean value from the managed pointer.
---@overload fun(self:CMemHandle):boolean
---@overload fun(self:CMemHandle, offset:number):boolean
---@param offset number? An optional offset from the managed pointer.
---@return boolean A boolean value read from the pointer.
function CMemHandle:read_bool(offset) end

--- Writes a boolean value to the managed pointer.
---@overload fun(self:CMemHandle, value:boolean):boolean
---@overload fun(self:CMemHandle, value:boolean, offset:number):boolean
---@param value boolean The boolean value to write.
---@param offset number? An optional offset from the managed pointer.
---@return boolean A boolean indicating the success of the write operation.
function CMemHandle:write_bool(value, offset) end

--- Checks if the boolean value at the managed pointer matches a given value.
---@overload fun(self:CMemHandle, value:boolean):boolean
---@overload fun(self:CMemHandle, value:boolean, offset:number):boolean
---@param value boolean A boolean value to check against.
---@param offset number? An optional offset from the managed pointer.
---@return boolean A boolean indicating whether the value matches the given boolean.
function CMemHandle:check_bool(value, offset) end