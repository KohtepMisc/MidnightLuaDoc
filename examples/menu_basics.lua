--[[

]]

-- Creating the Karramba settings page
local settings_page = ui.new_page('Karramba', Icons.KARAMBIT)

-- Group for player blocking settings
local join_block_group = settings_page:new_group('Join Block', PageColumn.FIRST)

-- Checkbox to enable/disable filtering players by a substring in their name
local join_block_enable_filter_checkbox = join_block_group:new_checkbox('Enable player blocking by name substring')

-- Checkbox for case insensitive substring checking
local join_block_case_insensitive_checkbox = join_block_group:new_checkbox('Case insensitive')

-- Input field for the substring used for filtering names
local join_block_name_filter_input = join_block_group:new_input('Substring Filter', 'Enter substring here or "*" to block all')

-- Registering the callback to handle player joins
events.on_player_adding(function(name, rid)
    -- If the checkbox is not checked, skip filtering
    if not join_block_enable_filter_checkbox:get() then
        return true
    end

    -- Retrieving the substring from the input field
    local substring = join_block_name_filter_input:get()
    
    -- Check for case insensitive setting
    if join_block_case_insensitive_checkbox:get() then
        name = string.lower(name)
        substring = string.lower(substring)
    end

    -- If the substring is "*", block all players
    if substring == '*' then
        local body = "Player '" .. name .. "' blocked."
        ui.popup(join_block_group:get_label(), body, Icons.CANCEL2, PopupType.BOX)
        return false
    end

    -- If the substring is not specified, skip the check
    if substring == '' then
        return true
    end
    
    -- Splitting the substring into multiple substrings if "|" is present
    local substrings = string.split(substring, '|')
    
    -- Checking if the player's name contains any of the substrings
    for _, sub in ipairs(substrings) do
        if string.contains(name, sub) then
            -- Display a popup if the substring is found in the player's name
            local body = "Substring '" .. sub .. "' found for player '" .. name .. "', blocked."
            ui.popup(join_block_group:get_label(), body, Icons.CANCEL2, PopupType.BOX)
            
            -- Returning false to block the player
            return false
        end
    end
    
    -- Returning true to allow the player if no substring match is found
    return true
end)

-- Creating a group for Base64 operations on the settings page
local base64_group = settings_page:new_group('Base64 Operations', PageColumn.FIRST)

-- Creating an input field for the source string
local base64_source_input = base64_group:new_input('Source', 'Enter text to encode/decode')

-- Creating an input field for displaying the result
local base64_result_input = base64_group:new_input('Result', 'Result will appear here')

-- Creating a button for encoding the source string to Base64
base64_group:new_button('Encode to Base64', function()
    local source = base64_source_input:get()
    local encoded = string.base64_encode(source) 
    base64_result_input:set(encoded)
end)

-- Creating a button for decoding the source string from Base64
base64_group:new_button('Decode from Base64', function()
    local source = base64_source_input:get()
    local decoded = string.base64_decode(source)
    base64_result_input:set(decoded)
end)

local dynamic_list_group = settings_page:new_group('List via Callbacks', PageColumn.SECOND)

-- Table of strings for demonstrating the list operation
local items = {"Apple", "Banana", "Cherry", "Date", "Elderberry"}

-- Creating a dynamic list
local dynamic_list = dynamic_list_group:new_list('Fruit List')

-- Setting a function to display list items
dynamic_list:set_getter_callback(function(index)
    return items[index]
end)

-- Setting a function to count the number of items in the list
dynamic_list:set_counter_callback(function()
    return #items 
end)

-- Setting a function that defines the action taken when a list item is clicked
dynamic_list:set_click_callback(function(index)
    local item = items[index]
    if item then
        ui.popup('Item Selected', 'You selected: ' .. item, Icons.FILE, PopupType.BOX)
    end
end)

-- Enabling the use of a search bar within the list
dynamic_list:set_use_search_bar(true)

local static_list_group = settings_page:new_group('List via Table', PageColumn.SECOND)

-- Initial list of fruits for the static list
local fruits = {"Apple", "Banana", "Cherry", "Date", "Elderberry"}

-- Creating a static list with predefined elements
local static_list = static_list_group:new_table_list('Fruit List', fruits)

-- Creating an input field for adding new fruits
local fruit_input = static_list_group:new_input('Add new item', 'Enter string here to add. Click on an item in the list to delete.')

-- Creating a button to add new fruits to the list
static_list_group:new_button('Add Fruit', function()
    local new_fruit = fruit_input:get()  -- Retrieve the text from the input field
    if new_fruit ~= '' then
        table.insert(fruits, new_fruit)  -- Add the new fruit to the table
        fruit_input:set('')  -- Clear the input field after adding the fruit
    end
end)

-- Setting a click callback on the list to remove an item when clicked
static_list:set_click_callback(function(index)
    if fruits[index] then
        table.remove(fruits, index)  -- Remove the item from the list by its index
        static_list:set_elements(fruits)  -- Reset the elements of the list to reflect the removed item
    end
end)

-- Enabling the use of a search bar within the list
static_list:set_use_search_bar(true)

-- Create a debug texture
local debug_texture = draw.create_debug_texture(250, 250)

-- Use existing settings_page to place the button
local button_group = settings_page:new_group('Hover Button', PageColumn.FIRST)

-- Create a button with a concise label
local button = button_group:new_button('Hover Here to Test Hovered Functionality')

-- Set a callback that is triggered when the mouse cursor hovers over the button
button:set_hovered_callback(function(x, y)
    -- Draw the texture at the cursor's position
	
    local draw_list_backup = draw.set_draw_list(DrawList.FOREGROUND)
    draw.texture(debug_texture, x, y)
    draw.set_draw_list(draw_list_backup)
end)

-- Create a new group on the settings page
local player_list_group = settings_page:new_group('OTR Sender', PageColumn.SECOND)

-- Add the player list component
local player_list = player_list_group:new_player_list('Player List', PlayerListDM.COMBO, PlayerListSM.MULTIPLE)

-- Create a button in the player_list_group with an inline click callback function
local player_list_button = player_list_group:new_button('Apply OTR for Selected Players', function()
    -- Get the selected items from the player list
    local player_names = player_list:get_selected_items_lines()
    
    -- Iterate over each selected player
    for i, name in ipairs(player_names) do
        local ply = player.get(name)
		
		-- Check if the player object is valid
		if ply:is_valid() then
		    -- Prepare arguments for the script event
		    local args = {
		        NETWORK.GET_NETWORK_TIME(),
		        0, 
		        ply:get_index_bit(), 
		        script.get_script_magic(ply)
		    }
		    
		    -- Trigger a script event for the player
		    gta.trigger_script_event(ply, script.get_tse(ScriptEventId.OFF_THE_RADAR), args)
		    
		    -- Replace print with a popup message
		    ui.popup_message("Processing player: " .. ply.name, PopupType.BOX)  -- Assuming ui.popup_message is the method and PopupType.BOX is valid
		else
		    -- Popup message if the player object is not valid
		    ui.popup_message("Invalid player object for: " .. name, PopupType.LINE)  -- Line type for less critical message
		end
    end
end)