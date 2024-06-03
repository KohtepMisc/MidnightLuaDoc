---@diagnostic disable

---@meta _

--- Global Note:
--- It is important to note that most of these filesystem functions are designed to operate within the confines of the product directory.
--- This restriction is implemented to ensure the security and integrity of the file operations, preventing access to the broader file system.
--- Users should ensure that all file and directory paths provided to these functions are relative to the product's base directory, unless otherwise noted.

---@module fs
fs = {}

--- Loads a binary file into memory.
--- @param name string The path to the binary file.
--- @return userdata|null A pointer to the binary data if successful, or nil if the file could not be loaded.
function fs.file_load_bin(name) end

--- Loads a text file as a string.
--- @param name string The path to the text file.
--- @return string The content of the file as a string, or an empty string if the file could not be loaded.
function fs.file_load_txt(name) end

--- Frees the memory allocated for a binary or text file.
---
--- Note: All data loaded using the file_load_bin and file_load_txt functions will be automatically
--- freed along with the script being released. However, if you still need to free the data, you can use
--- this function.
---
--- Note: Due to the specifics of the Lua backend, files loaded as strings (file_load_txt) cannot be freed
--- by this function, as 'string' type data may migrate between memory blocks during operation.
--- Most likely, this function will not be able to free such data and will return false.
---
--- @param data userdata|string The pointer to the binary data that needs to be freed.
--- @return boolean `True` if the data was successfully freed, `False` otherwise.
function fs.file_free(data) end

--- Writes text to a file, overwriting any existing content.
--- @param name string The path to the file.
--- @param text string The text to write to the file.
--- @return boolean True if the write operation was successful, false otherwise.
function fs.file_write(name, text) end

--- Appends text to the end of a file.
--- @param name string The path to the file.
--- @param text string The text to append to the file.
--- @return boolean True if the append operation was successful, false otherwise.
function fs.file_append(name, text) end

--- Checks if a file or directory exists.
--- @param name string The path to the file or directory.
--- @return boolean True if the file or directory exists, false otherwise.
function fs.exists(name) end

--- Checks specifically if a file exists.
--- @param name string The path to the file.
--- @return boolean True if the file exists, false otherwise.
function fs.file_exists(name) end

--- Checks specifically if a directory exists.
--- @param name string The path to the directory.
--- @return boolean True if the directory exists, false otherwise.
function fs.directory_exists(name) end

--- Creates a directory at the specified path.
--- @param name string The path where the directory should be created.
--- @return boolean True if the directory was successfully created, false otherwise.
function fs.create_dir(name) end

--- Checks if the specified path is a file.
--- @param name string The path to check.
--- @return boolean True if the path is a file, false otherwise.
function fs.is_file(name) end

--- Checks if the specified path is a directory.
--- @param name string The path to check.
--- @return boolean True if the path is a directory, false otherwise.
function fs.is_dir(name) end

--- Deletes a file or directory at the specified path.
--- @param name string The path to the file or directory to delete.
--- @return boolean True if the file or directory was successfully deleted, false otherwise.
function fs.delete(name) end

--- Gets the size of a file or directory.
--- @param name string The path to the file or directory.
--- @return number The size of the file or directory in bytes.
function fs.get_size(name) end

--- Returns the directory path for the application data.
--- @return string The path to the application data directory.
function fs.get_appdata_dir() end

--- Returns the directory path for the product-specific files.
--- @return string The path to the product directory.
function fs.get_product_dir() end

--- Returns the directory path for product logs.
--- @return string The path to the product log directory.
function fs.get_log_dir() end

--- Returns the directory path for scripts.
--- @return string The path to the scripts directory.
function fs.get_script_dir() end

--- Returns the directory path for the Windows directory.
--- @return string The path to the Windows directory.
function fs.get_windows_dir() end

--- Returns the directory path for the game files.
--- @return string The path to the game directory.
function fs.get_game_dir() end

--- Returns the directory path for outfit files.
--- @return string The path to the outfit directory.
function fs.get_outfit_dir() end

--- Retrieves a list of files in the specified directory.
--- @param folder string The directory path to list files from.
--- @param recursive boolean? Whether to include files from subdirectories recursively.
---|> false
--- @return table A list of file paths within the specified directory.
function fs.get_files(folder, recursive) end

--- Retrieves a list of directories in the specified directory.
--- @param folder string The directory path to list directories from.
--- @param recursive boolean? Whether to include subdirectories recursively.
---|> false
--- @return table A list of directory paths within the specified directory.
function fs.get_directories(folder, recursive) end

--- Retrieves a combined list of both files and directories in the specified directory.
--- @param folder string The directory path to list files and directories from.
--- @param recursive boolean? Whether to include subdirectories recursively.
---|> false
--- @return table A list of file and directory paths within the specified directory.
function fs.get_all(folder, recursive) end
