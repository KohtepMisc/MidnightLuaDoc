---@diagnostic disable

---@meta _

---@module chat
chat = {}

--- Sends a message to the chat. If 'target' is specified (not -1), sends the message only to that player.
---@param text string The message text to send. If the string is empty, the function returns false.
---@param is_team boolean If true, the message is sent as a team message.
---@param target? integer The optional target player ID to send the message to. Default is -1, which means send to all.
---|> -1
---@return boolean Returns true if the message was successfully sent, false if the text was empty.
function chat.send(text, is_team, target) end

--- Checks if the chat is currently open.
---@return boolean Returns true if the chat is open, false otherwise.
function chat.is_open() end

--- Closes the chat if it is currently open.
function chat.close() end

--- Opens the chat interface. This function can open either the team chat or the global chat, based on the provided boolean parameter.
---@param is_team boolean? Specifies whether to open the team chat or the global chat. If not specified, defaults to opening the global chat (false).
---|> false
function chat.open(is_team) end