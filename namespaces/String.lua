---@diagnostic disable

---@meta _

---@module string
string = {}

--- It's important to note that all standard functions of the string namespace remain untouched.
--- The product extends this namespace, not overwrites it with its own. Functions,
--- that are related to Lua, for example, string.gsub or string.find,
--- remain accessible.

--- Calculates an unsigned Jenkins one-at-a-time hash from a given string.
--- @param str The string to hash.
--- @return Returns the Joaat hash as an unsigned integer. Returns 0 if the input string is null or empty.
function string.joaat(str) end

--- Calculates a signed Jenkins one-at-a-time hash from a given string.
--- This function behaves exactly like `joaat`, but it guarantees that the hash is signed.
--- @param str The string to hash.
--- @return Returns the signed Joaat hash as an integer. Returns 0 if the input string is null or empty.
function string.sjoaat(str) end

--- Computes a hash using a smarter version of Joaat that handles hexadecimal and numeric strings.
--- This function extends the basic Joaat to handle edge cases such as strings starting with whitespace,
--- hexadecimal notations, and numeric representations. If the string is a valid hexadecimal (starting with '0x'),
--- it converts it directly to a number. If it is numeric, it converts it to a number. Otherwise, it computes
--- the unsigned Joaat hash of the string.
--- @param str The string to hash.
--- @return Returns the computed hash as an unsigned integer. Returns 0 if the string is empty or if it cannot be
---         processed (e.g., only whitespace).
--- @example local smart_hash = string.smart_joaat("   0x1a3f")
--- print("Smart Joaat Hash:", smart_hash)  -- Output will be the number 6703 (hex 0x1A3F converted to decimal)
function string.smart_joaat(str) end

--- Computes a hash using a smarter version of Joaat that handles hexadecimal and numeric strings, returning a signed hash.
--- This function behaves exactly like `smart_joaat`, but it guarantees that the hash is signed.
--- @param str The string to hash.
--- @return Returns the signed computed hash as an integer. Returns 0 if the string is empty or if it cannot be
---         processed (e.g., only whitespace).
function string.smart_sjoaat(str) end

--- Trims leading and trailing spaces from the string.
--- This function removes all whitespace characters at the beginning and the end of the provided string.
--- Whitespace characters include standard space characters such as space, tab, newline, etc.
--- @param str The string from which the spaces will be trimmed.
--- @return Returns a new string with leading and trailing spaces removed.
--- @example local trimmed = string.trim("   Hello world!   ")
--- print(trimmed)  -- Output: "Hello world!"
function string.trim(str) end

--- Splits a string into a vector of substrings based on the specified delimiter.
--- This function divides the input string into multiple substrings by locating the delimiter.
--- Each part between delimiters is added to a vector as a new element. This is especially useful
--- for parsing CSV files or processing command-line input where arguments are separated by spaces
--- or other delimiters.
--- @param str The string to be split.
--- @param delim The delimiter string used to split the input string.
--- @return Returns a vector of strings, where each string is a substring of the original string
---         split by the given delimiter.
--- @example local str = "one,two,three,four"
--- local parts = string.split(str, ",")
--- for index, value in ipairs(parts) do
---     print("Part " .. index .. ": " .. value)
--- end
--- -- Output:
--- -- Part 1: one
--- -- Part 2: two
--- -- Part 3: three
--- -- Part 4: four
function string.split(str, delim) end

--- Capitalizes the first letter of each word in the provided string.
--- This function processes a string and capitalizes the first character of each word while converting
--- all other characters to lowercase. A word is defined as any sequence of characters separated by
--- whitespace. This is particularly useful for formatting text to conform to conventional capitalization
--- in titles, user names, or other proper nouns.
--- @param str The string to be capitalized.
--- @return Returns the capitalized version of the original string where the first letter of each
---         word is uppercase and all other letters are lowercase.
--- @example local title = "hello world, welcome to LUA scripting!"
--- local capitalized = string.capitalize(title)
--- print(capitalized)  -- Output: "Hello World, Welcome To Lua Scripting!"
function string.capitalize(str) end

--- Checks if the main string contains the specified substring.
--- This function searches for the occurrence of a substring within a main string and returns true
--- if the substring is found, otherwise it returns false. It is useful for validating text, searching
--- within strings, or implementing conditional logic based on text content.
--- @param str The main string in which to search for the substring.
--- @param substr The substring to search for within the main string.
--- @return Returns true if the substring is found in the main string, otherwise returns false.
--- @example local sentence = "Hello world, welcome to LUA scripting!"
--- local contains_world = string.contains(sentence, "world")
--- print(contains_world)  -- Output: true
--- local contains_lua = string.contains(sentence, "lua")
--- print(contains_lua)  -- Output: false (case-sensitive)
function string.contains(str, substr) end

--- Determines if the string starts with the specified prefix.
--- This function checks if the main string begins with a certain prefix by comparing the starting
--- characters of the main string to the prefix. It is particularly useful for verifying file extensions,
--- protocol types, or any other standardized string formats in user inputs or data fields.
--- @param str The main string to be checked.
--- @param prefix The prefix to be looked for at the beginning of the main string.
--- @return Returns true if the main string starts with the prefix, otherwise returns false.
--- @example local filename = "example.txt"
--- local is_txt = string.startswith(filename, "example")
--- print(is_txt)  -- Output: true
--- local is_log = string.startswith(filename, "log")
--- print(is_log)  -- Output: false
function string.startswith(str, prefix) end

--- Determines if the string ends with the specified suffix.
--- This function checks if the main string concludes with a certain suffix by comparing the ending
--- characters of the main string to the suffix. It is extremely useful for identifying file types
--- by their extensions, validating web URLs, or any applications where suffix matching is required.
--- @param str The main string to be checked.
--- @param suffix The suffix to be looked for at the end of the main string.
--- @return Returns true if the main string ends with the suffix, otherwise returns false.
--- @example local filename = "report.pdf"
--- local is_pdf = string.endswith(filename, ".pdf")
--- print(is_pdf)  -- Output: true
--- local is_docx = string.endswith(filename, ".docx")
--- print(is_docx)  -- Output: false
function string.endswith(str, suffix) end

--- Replaces all occurrences of a specified substring with another substring in the main string.
--- This function scans the main string for occurrences of the 'from' substring and replaces each with
--- the 'to' substring. It is particularly useful for data cleaning, text formatting, or generating
--- user-friendly outputs where specific terms or characters need to be substituted.
--- @param str The main string in which replacements will be made.
--- @param from The substring to be replaced.
--- @param to The substring that will replace each occurrence of 'from'.
--- @return Returns the modified string with all replacements made.
--- @example local text = "Hello world, hello Lua"
--- local updated_text = string.replace(text, "hello", "Hi")
--- print(updated_text)  -- Output: "Hello world, Hi Lua"
function string.replace(str, from, to) end

--- Calculates the Levenshtein distance between two strings.
--- The Levenshtein distance is a string metric for measuring the difference between two sequences.
--- It represents the minimum number of single-character edits (insertions, deletions, or substitutions)
--- required to change one string into the other. This function is useful in applications where text
--- similarity is important, such as spell checking, text recovery, and in the field of computational biology.
--- @param s1 The first string to compare.
--- @param s2 The second string to compare.
--- @return Returns the Levenshtein distance as an integer, indicating the number of edits needed.
--- @example local str1 = "kitten"
--- local str2 = "sitting"
--- local distance = string.levenshtein_distance(str1, str2)
--- print("Levenshtein Distance: ", distance)  -- Output: "Levenshtein Distance: 3"
function string.levenshtein_distance(s1, s2) end

--- Generates a random string of a specified length using alphanumeric characters.
--- This function creates a string consisting of random characters drawn from the set of uppercase letters,
--- lowercase letters, and digits. It is particularly useful for generating unique identifiers, temporary passwords,
--- or any other instances where random, hard-to-guess strings are beneficial.
--- @param length The desired length of the random string.
--- @return Returns a randomly generated string of the specified length.
--- @example local random_id = string.generate_random_string(10)
--- print("Generated ID: ", random_id)  -- Output: "Generated ID: 3Df9jn2Rk1"
function string.generate_random_string(length) end

--- Encodes a binary string into a Base64 formatted string.
--- This function converts binary data into a textual representation using the Base64 encoding scheme,
--- which represents binary data in an ASCII string format using a set of 64 characters. It's widely used
--- in data encoding including embedding images in HTML, sending email via SMTP, and storing complex data
--- in XML or JSON.
--- @param in The binary string to be encoded.
--- @return Returns a Base64 encoded string.
--- @example local encoded = string.base64_encode("Hello World!")
--- print("Base64 Encoded: ", encoded)  -- Output: "Base64 Encoded: SGVsbG8gV29ybGQh"
function string.base64_encode(in) end

--- Decodes a Base64 encoded string back into its original binary form.
--- This function reverses the Base64 encoding process by converting a Base64 encoded string back
--- into its original binary string format. It's essential for retrieving binary data stored or
--- transmitted in the form of Base64 text.
--- @param in The Base64 encoded string to be decoded.
--- @return Returns the original binary string.
--- @example local decoded = string.base64_decode("SGVsbG8gV29ybGQh")
--- print("Decoded String: ", decoded)  -- Output: "Decoded String: Hello World!"
function string.base64_decode(in) end

--- Validates if the provided string is correctly formatted as a Base64 encoded string.
--- This function checks whether a string conforms to the Base64 encoding standards, which is crucial
--- for ensuring the integrity of data before attempting decoding operations. It is used to avoid errors
--- or exceptions during the decoding process by verifying that the string only contains characters that
--- are valid in the Base64 alphabet and is correctly padded if necessary.
--- @param data The string to be validated.
--- @return Returns true if the string is a valid Base64 encoded string, false otherwise.
function string.base64_validate(data) end

--- Computes the Soundex code for a given string.
--- Soundex is a phonetic algorithm for indexing names by sound, as pronounced in English.
--- The goal is for homophones to be encoded to the same representation so that they can
--- be matched despite minor differences in spelling. It is mainly used in databases to
--- help with searching and is very useful in genealogical research and other applications
--- where similar sounding names may have various spellings.
--- @param s The input string for which the Soundex code is to be generated.
--- @return Returns a string representing the Soundex code, which is a letter followed
---         by three numerical digits.
--- @example local soundex_code = string.soundex("Robert")
--- print(soundex_code)  -- Output: "R163"
function string.soundex(s) end

--- Randomizes the order of characters in a string.
--- This function shuffles the characters of the given string into a random order.
--- It is useful for creating randomized outputs from fixed strings, for example,
--- generating random passwords or game elements from predetermined character sets.
--- @param str The string whose characters are to be randomized.
--- @return Returns the randomized string.
--- @example local shuffled = string.randomize_string("abcdef")
--- print(shuffled)  -- Output might be "bcdaef"
function string.randomize_string(str) end

--- Normalizes text by removing all non-alphanumeric characters and converting to lowercase.
--- This function strips a string of all characters except alphanumeric characters and converts
--- all letters to lowercase. This is useful for text preprocessing, especially when standardizing
--- text data for search and comparison purposes.
--- @param text The text to be normalized.
--- @return Returns the normalized text.
--- @example local normalized_text = string.normalize_text("Hello, World! 123")
--- print(normalized_text)  -- Output: "helloworld123"
function string.normalize_text(text) end

--- Extracts a command and its arguments from a single input string.
--- This function parses a string containing a command followed by its arguments, separating
--- the command from its arguments. It's useful for command-line parsing, scripting languages,
--- or chat bots where commands are followed by parameters.
--- @param input The input string containing the command followed by its arguments.
--- @return Returns a pair consisting of the command (as a string) and a vector of its arguments.
--- @example local input = "command arg1 arg2 arg3"
--- local result = string.extract_command_and_arguments(input)
--- print("Command:", result.first)  -- Output: "Command: command"
--- for i, arg in ipairs(result.second) do
---     print("Arg" .. i .. ":", arg)  -- Outputs: "Arg1: arg1", "Arg2: arg2", "Arg3: arg3"
function string.extract_command_and_arguments(input) end

--- Censors specific words in a text by replacing them with asterisks.
--- This function searches through a given text and replaces each occurrence of any specified
--- "banned" word with asterisks, obscuring them. It's useful for content moderation in forums,
--- chat apps, or any user-generated content platforms.
--- @param text The original text to censor.
--- @param bannedWords A table of words that should be censored.
--- @return Returns the text with the banned words replaced by asterisks.
--- @example local text = "hello world, this is an example sentence"
--- local banned = {"world", "example"}
--- local censored = string.censor_words(text, banned)
--- print(censored)  -- Output: "hello ****, this is an ******* sentence"
function string.censor_words(text, bannedWords) end

--- Provides autocomplete suggestions for a partial command from a list of possible commands.
--- This function looks for commands that start with a given partial string, returning all matches.
--- It is ideal for user interfaces where command or path auto-completion enhances user experience.
--- @param partial The beginning part of the command to be completed.
--- @param commands A table of possible full commands.
--- @return Returns a table of commands that match the partial input.
--- @example local commands = {"start", "stop", "status", "restart"}
--- local partial = "sta"
--- local suggestions = string.auto_complete_command(partial, commands)
--- for i, cmd in ipairs(suggestions) do
---     print("Suggestion" .. i .. ":", cmd)  -- Outputs: "Suggestion1: start", "Suggestion2: status"
function string.auto_complete_command(partial, commands) end

--- Converts a UTF-8 string to a UTF-16 string.
--- This function converts a string encoded in UTF-8 format to UTF-16 format.
--- Useful for interfacing with APIs or libraries that require UTF-16 strings,
--- or for handling international text in environments that primarily use UTF-16.
--- @param utf8 The UTF-8 encoded string to be converted.
--- @return Returns the converted UTF-16 string.
--- @example local utf8_string = "Привет мир" -- "Hello world" in Russian
--- local utf16_string = string.utf8_to_utf16(utf8_string)
--- print(utf16_string) -- Display the UTF-16 encoded string
function string.utf8_to_utf16(utf8) end

--- Converts a UTF-16 string to a UTF-8 string.
--- This function converts a string encoded in UTF-16 format to UTF-8 format.
--- It's particularly useful for saving text in a more compact format, or for
--- sending text over network protocols that prefer UTF-8 encoding.
--- @param utf16 The UTF-16 encoded string to be converted.
--- @return Returns the converted UTF-8 string.
--- @example local utf16_string = "Привет мир" -- "Hello world" in Russian, in UTF-16
--- local utf8_string = string.utf16_to_utf8(utf16_string)
--- print(utf8_string) -- Display the UTF-8 encoded string
function string.utf16_to_utf8(utf16) end

--- Converts a UTF-8 encoded string to UTF-32 format.
--- This function is used to convert a string from UTF-8 encoding, which is widely used for web and
--- storage, to UTF-32 encoding that provides easier access to individual Unicode characters.
--- Useful for applications that need to process characters based on their Unicode code points.
--- @param utf8 The UTF-8 encoded string to convert.
--- @return Returns the UTF-32 encoded string.
--- @example local utf8_string = "Привет мир"  -- "Hello world" in Russian
--- local utf32_string = string.utf8_to_utf32(utf8_string)
--- print(utf32_string)  -- Display the UTF-32 encoded string
function string.utf8_to_utf32(utf8) end

--- Converts a UTF-32 encoded string to UTF-8 format.
--- This function is used to convert a string from UTF-32 encoding back to UTF-8. UTF-32 provides uniform
--- character handling but uses more space, while UTF-8 is more storage efficient. Especially useful for
--- applications that interact with web services or systems that predominantly use UTF-8.
--- @param utf32 The UTF-32 encoded string to convert.
--- @return Returns the UTF-8 encoded string.
--- @example local utf32_string = "Привет мир"  -- "Hello world" in Russian, in UTF-32
--- local utf8_string = string.utf32_to_utf8(utf32_string)
--- print(utf8_string)  -- Display the UTF-8 encoded string
function string.utf32_to_utf8(utf32) end

--- Converts a string from the system's local encoding to UTF-8.
--- Useful for applications that need to process local data in a format that is compatible with web or
--- other international standards that predominantly use UTF-8. It bridges local data handling with
--- global data interaction.
--- @param local_string The locally encoded string.
--- @return Returns the string in UTF-8 encoding.
--- @example local local_string = "Привет мир"  -- Assume it's in system's locale
--- local utf8_string = string.locale_to_utf8(local_string)
--- print(utf8_string)  -- Output in UTF-8 format
function string.locale_to_utf8(local_string) end

--- Converts a UTF-8 string to the system's local encoding.
--- This function is used for converting data from UTF-8, which is an international standard,
--- to the local encoding used by the system. This is useful when data needs to be presented
--- or processed in the local context.
--- @param utf8 The UTF-8 encoded string.
--- @return Returns the string in the system's local encoding.
--- @example local utf8_string = "Hello world"  -- In UTF-8
--- local local_string = string.utf8_to_locale(utf8_string)
--- print(local_string)  -- Output in system's local encoding
function string.utf8_to_locale(utf8) end

--- Formats a number according to the current locale settings.
--- This function formats a given number using locale-specific rules, which include the correct
--- placement of decimal points and thousand separators. It's useful for displaying numeric
--- data to users in a way that conforms to their regional settings.
--- @param number The number to be formatted.
--- @return Returns a string with the number formatted according to the current locale.
--- @example local formatted_number = string.format_number_locale(1234567.89)
--- print("Formatted Number:", formatted_number)  -- Output will depend on the system's locale
function string.format_number_locale(number) end

--- Formats the current date and time based on the system's locale.
--- This function converts a time_t value into a human-readable string formatted according
--- to the locale-specific rules for date and time. This is particularly useful for applications
--- that need to display date and time in a format familiar to the user.
--- @param time The time value to format.
--- @return Returns a string representing the formatted date and time.
--- @example local now = os.time()
--- local formatted_datetime = string.format_datetime_locale(now)
--- print("Formatted Date and Time:", formatted_datetime)  -- Output will depend on the system's locale
function string.format_datetime_locale(time) end

--- Converts a string to uppercase according to the current locale.
--- This function converts all alphabetic characters in a string to their uppercase
--- equivalents based on the rules of the current locale. This can be different from
--- simply converting each character to uppercase in a locale-agnostic way, especially
--- for languages with complex character sets.
--- @param input The string to convert to uppercase.
--- @return Returns the uppercase version of the input string.
--- @example local input = "Hello World!"
--- local uppercased = string.to_upper_locale(input)
--- print("Uppercased String:", uppercased)  -- Output: "HELLO WORLD!" or other locale-specific form
function string.to_upper_locale(input) end

--- Converts a string to lowercase according to the current locale.
--- Similar to ToUpperLocale, this function converts all alphabetic characters in a string
--- to their lowercase equivalents based on the current locale. This is essential for
--- correct text processing and display in languages with specific lowercase rules.
--- @param input The string to convert to lowercase.
--- @return Returns the lowercase version of the input string.
--- @example local input = "HELLO WORLD!"
--- local lowercased = string.to_lower_locale(input)
--- print("Lowercased String:", lowercased)  -- Output: "hello world!" or other locale-specific form
function string.to_lower_locale(input) end

--- Converts a Unicode codepoint to its UTF-8 string representation.
--- This function takes a Unicode codepoint (an integer) and converts it into a UTF-8 encoded string.
--- It handles Unicode codepoints in all valid ranges, from U+0000 to U+10FFFF, making it suitable
--- for encoding any Unicode character into UTF-8. This is especially useful for working with
--- a wide range of international characters beyond the basic ASCII set.
--- @param codepoint The Unicode codepoint to convert. Must be a valid Unicode value (0 to 0x10FFFF).
--- @return Returns a string containing the UTF-8 representation of the input Unicode codepoint.
--- @example local utf8_string = string.uchar(0x1F601)  -- Converts the Unicode codepoint for 😁 (grinning face)
--- print(utf8_string)  -- Output: 😁
--- @example Handling multiple codepoints:
--- -- Combining multiple Unicode codepoints into a single UTF-8 string
--- local smiley_face = string.uchar(0x1F603)
--- local heart = string.uchar(0x2764)
--- local combined = smiley_face .. heart
--- print(combined)  -- Output: 😃❤
function string.uchar(codepoint) end

--- Encrypts a string using the Caesar cipher.
--- This function shifts each letter in the input string by a specified number of places down the alphabet.
--- Non-letter characters are not altered. This function assumes an English alphabet (A-Z, a-z).
--- @param str The string to encrypt.
--- @param shift The number of positions to shift each letter.
--- @return Returns the encrypted string.
--- @example local plaintext = "Hello, World!"
--- local shift = 3
--- local encrypted = string.caesar_encrypt(plaintext, shift)
--- print(encrypted)  -- Output: "Khoor, Zruog!"
function string.caesar_encrypt(str, shift) end

--- Decrypts a string encrypted with the Caesar cipher.
--- This function reverses the Caesar cipher for a string by shifting each letter in the input string
--- by a specified number of places up the alphabet.
--- Non-letter characters are not altered. This function assumes an English alphabet (A-Z, a-z).
--- @param str The string to decrypt.
--- @param shift The number of positions by which each letter was shifted in the encryption process.
--- @return Returns the decrypted string.
--- @example local encrypted = "Khoor, Zruog!"
--- local shift = 3
--- local decrypted = string.caesar_decrypt(encrypted, shift)
--- print(decrypted)  -- Output: "Hello, World!"
function string.caesar_decrypt(str, shift) end