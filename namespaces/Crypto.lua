---@diagnostic disable

---@meta _

---@module crypto
crypto = {}

--- Calculates CRC8 for the given data using a specified polynomial.
-- This function computes the CRC8 checksum for a provided array of bytes. It can be used with any polynomial provided by the user.
-- @param data The data as a byte array or string to compute the CRC.
-- @param size The number of bytes in the data.
-- @param polynomial? The polynomial used for CRC calculation.
--|> 0x07
-- @param init_value? Initial CRC value.
--|> 0
-- @return The CRC8 checksum.
function crypto.crc8(data, size, polynomial, init_value) end

--- Calculates CRC16 for the given data using a specified polynomial.
-- This function computes the CRC16 checksum for a provided array of bytes. It can be used with any polynomial provided by the user.
-- @param data The data as a byte array or string to compute the CRC.
-- @param size The number of bytes in the data.
-- @param polynomial? The polynomial used for CRC calculation.
--|> 0x8005
-- @param init_value? Initial CRC value.
--|> 0
-- @return The CRC16 checksum.
function crypto.crc16(data, size, polynomial, init_value) end

--- Calculates CRC24 for the given data using a specified polynomial.
-- This function computes the CRC24 checksum for a provided array of bytes. It can be used with any polynomial provided by the user.
-- @param data The data as a byte array or string to compute the CRC.
-- @param size The number of bytes in the data.
-- @param polynomial? The polynomial used for CRC calculation.
--|> 0x864CFB
-- @param init_value? Initial CRC value.
--|> 0
-- @return The CRC24 checksum.
function crypto.crc24(data, size, polynomial, init_value) end

--- Calculates CRC32 for the given data using a specified polynomial.
-- This function computes the CRC32 checksum for a provided array of bytes. It can be used with any polynomial provided by the user.
-- @param data The data as a byte array or string to compute the CRC.
-- @param size The number of bytes in the data.
-- @param polynomial? The polynomial used for CRC calculation.
--|> 0x04C11DB7
-- @param init_value? Initial CRC value.
--|> 0
-- @return The CRC32 checksum.
function crypto.crc32(data, size, polynomial) end

--- Calculates CRC64 for the given data using a specified polynomial.
-- This function computes the v checksum for a provided array of bytes. It can be used with any polynomial provided by the user.
-- @param data The data as a byte array or string to compute the CRC.
-- @param size The number of bytes in the data.
-- @param polynomial? The polynomial used for CRC calculation.
--|> 0x42F0E1EBA9EA3693
-- @param init_value? Initial CRC value.
--|> 0
-- @return The CRC64 checksum.
function crypto.crc64(data, size, polynomial, init_value) end