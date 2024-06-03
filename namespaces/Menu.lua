---@diagnostic disable

---@meta _

---@module ui
ui = {}

-- Enumeration for different styles of popup notifications
PopupType = {
	-- Represents a prominent notification. It appears as a rectangle on the right side 
	-- of the screen and is used for important alerts that are less frequent but need 
	-- significant attention.
    BOX = 0,
	
	-- Represents a less obtrusive, single-lined popup notification. It is used for 
	-- frequent but less critical information, appearing as a simple text with a 
	-- background fill.
    LINE = 1
}

--- Enumeration for column indices where groupboxes can be positioned.
PageColumn = {
    --- The first column index.
    FIRST = 1,
    --- The second column index.
    SECOND = 2,
    --- The third column index.
    THIRD = 3,
}

--- Enumeration for the regions of a groupbox.
GroupRect = {
    --- Represents the whole block including title and body.
    FULL = 0,
    --- Represents only the title area up to the separator.
    TITLE = 1,
    --- Represents only the content area below the separator.
    BODY = 2,
}

Icons = {
	INVALID = 0,
	
	FIRST_ICON = 59648,
	LAST_ICON = 59710,
	
	ARROW_DOWN = 59648,
	ARROW_UP = 59649,
	CAR = 59650,
	COLOR_PALETTE = 59651,
	CONTRAST = 59652,
	EXTENSION_PUZZLE = 59653,
	EYE = 59654,
	FISH = 59655,
	FLASH = 59656,
	GRID = 59657,
	HARDWARE_CHIP = 59658,
	LOGO_BUFFER = 59659,
	PEOPLE = 59660,
	PERSON = 59661,
	PLANET = 59662,
	SAVE = 59663,
	SETTINGS = 59664,
	SHIELD = 59665,
	SKULL = 59666,
	SPEEDOMETER = 59667,
	TRASH = 59668,
	WALLET = 59670,
	SEARCH = 59671,
	CANCEL = 59672,
	CLOUD_DOWNLOAD = 59673,
	CLOUD_UPLOAD = 59674,
	CLOUD_DISCONNECTED = 59675,
	CLOUD_SUCCESS = 59676,
	EXCLAMATION_TRIANGLE = 59677,
	SHIELD_SUCCESS = 59678,
	SQUARE_CHECKMARK_SUCCESS = 59679,
	CIRCLE_CANCEL = 59680,
	GAMEPAD = 59681,
	CROSSHAIR = 59682,
	MIDNIGHT_HEADER_LOGO = 59683,
	CHECKMARK_SUCCESS = 59684,
	CANCEL2 = 59685,
	PEN = 59686,
	SHARE = 59687,
	DOWNLOAD = 59688,
	CLOUD = 59689,
	GUN = 59690,
	MOVEMENT = 59691,
	WHEELCHAIR_MOVE = 59692,
	EXCLAMATION_CIRCLE = 59693,
	KEYBOARD = 59694,
	MIDNIGHT_LOGO = 59695,
	THREE_DOTS = 59696,
	REFRESH = 59697,
	PLUS = 59698,
	COPY = 59699,
	FILE = 59700,
	CAR2 = 59701,
	CARD = 59702,
	EARTH = 59703,
	BACKSPACE = 59704,
	KARAMBIT = 59705,
	GRIPDOTS = 59706,
	PORTAL = 59707,
	SPOOFING = 59708,
	UI = 59709,
	ETHERNET = 59710
}


--- Checks if the UI menu is currently opened.
-- @return bool Returns true if the UI menu is currently open, false otherwise.
function ui.is_opened() end

--- Creates a popup window inside the game.
---@param title string The title of the popup.
---@param body string The content of the popup.
---@param icon Icons The icon of the popup.
---@param type PopupType The type of the popup.
---@return boolean Returns true if the popup was successfully created.
function ui.popup(title, body, icon, type) end

--- Retrieves the current alpha transparency of the UI.
---@return number The alpha transparency value.
function ui.get_alpha() end

--- Retrieves the size of the UI layout.
---@return number, number The width and height of the UI layout.
function ui.get_size() end

--- Retrieves the position of the UI layout.
---@return number, number The x (left) and y (top) position of the UI layout.
function ui.get_position() end

--- Retrieves the current mouse position within the UI.
---@return number, number The x and y coordinates of the mouse.
function ui.get_mouse_position() end

--- Retrieves the scale factor of the UI based on the DPI setting.
---@return number The scale factor of the UI.
function ui.get_scale() end

--- Creates a new page in the UI with a specified icon.
---@param name string The name of the new page.
---@param icon Icons The icon to use for the new page.
---|> 0
---@return MenuPage The new page object or nil if the creation fails.
function ui.new_page(name, icon) end

--- Creates a new page in the UI without specifying an icon.
---@param name string The name of the new page.
---@return MenuPage The new page object or nil if the creation fails.
function ui.new_page(name) end

--- Retrieves a table of all MenuWidgets currently available in the UI.
--- @return table[MenuWidget] A table containing all MenuWidgets.
function ui.get_all_widgets() end

--- Retrieves a specific MenuWidget by its unique identifier.
--- @param uuid number The unique identifier of the widget.
--- @return MenuWidget|nil The widget handle if found, or nil if no widget matches the given UUID.
function ui.get_widget(uuid) end

---@class MenuPage
MenuPage = {}

--- Creates a new subpage for a given page.
---@param name string The name of the new subpage.
---@return MenuSubPage The new subpage object or nil if the creation fails.
function MenuPage:new_subpage(name) end

--- Creates a new group within this page.
--- This method facilitates grouping without needing to explicitly create a subpage when it is not necessary.
--- It creates a more streamlined way to manage groups by allowing direct creation on the main page.
--- If no tabs are present on the page, a new main tab named "MAIN" will be implicitly created to host the new group.
--- If there are already existing tabs, the new group will be added to the first created tab.
---@param name string The name of the new group.
---@param pos PageColumn? The position of the group within the page.
---|> MenuGroup.FIRST
---@return MenuGroup Returns a MenuGroup object if the group is successfully created. Returns nil if the creation fails.
function MenuPage:new_group(name, pos) end

--- Creates a new group within this submenu page.
---@param name string The name of the new group.
---@param pos PageColumn The position of the group within the submenu page.
---|> MenuGroup.FIRST
---@return MenuGroup Returns a MenuGroup object if creation was successful, nil otherwise.
function MenuSubPage:new_group(name, pos) end

---@class MenuGroup
MenuGroup = {}

--- Returns whether the group is collapsed.
---@return boolean Returns true if the group is collapsed.
function MenuGroup:is_collapsed() end

--- Returns whether the group is collapsible.
---@return boolean Returns true if the group can be collapsed.
function MenuGroup:is_collapsible() end

--- Returns whether the group is visible (being rendered).
---@return boolean Returns true if the group is visible.
function MenuGroup:is_visible() end

--- Sets the group's collapsed state.
---@param state boolean The state to set, true to collapse the group, false to expand it.
function MenuGroup:set_collapsed(state) end

--- Sets whether the group can be collapsed.
---@param state boolean The state to set, true if the group can be collapsed, false otherwise.
function MenuGroup:set_collapsible(state) end

--- Sets the visibility of the group.
---@param state boolean The visibility state to set, true to show the group, false to hide it.
function MenuGroup:set_visible(state) end

--- Creates a new checkbox within this group.
---@param name string The name of the checkbox.
---@param init boolean The initial state of the checkbox. Defaults to false if not specified.
---|> false
---@return MenuWidget Returns a checkbox widget if creation was successful.
function MenuGroup:new_checkbox(name, init) end

--- Creates a new slider within this group.
---@param name string The name of the slider.
---@param min integer The minimum value of the slider.
---@param max integer The maximum value of the slider.
---@param init integer The initial value of the slider. Defaults to the minimum value if not specified.
---|> 1
---@param scale integer The step size of the slider. Defaults to 1 if not specified.
---|> 1
---@return MenuWidget Returns a slider widget if creation was successful.
function MenuGroup:new_slider(name, min, max, init, scale) end

--- Creates a new combo box within this group.
--- This combo box allows for selection from a list of strings provided.
---@param name string The name of the combo box.
---@param ... string The list of options available in the combo box.
---@return MenuWidget Returns a combo box widget if creation was successful.
function MenuGroup:new_combo(name, ...) end

--- Creates a static text widget within this group.
--- The text content is fixed and defined upon creation.
---@param text string The static text content to display in the widget.
---@return MenuWidget Returns a text widget if creation was successful.
function MenuGroup:new_text(text) end

--- Creates a dynamic text widget within this group.
--- The text content can change dynamically based on a Lua function.
---@param callback function A Lua function that returns the string to display.
---@return MenuWidget Returns a text widget if creation was successful.
function MenuGroup:new_text(callback) end

--- Creates a button within this group.
--- The button can optionally perform an action defined by a Lua callback function when clicked.
---@param name string The name of the button.
---@param callback function? An optional Lua function that executes when the button is clicked.
--- If no callback is provided, the button performs no action on click.
---@return MenuWidget Returns a button widget if creation was successful, nil if failed.
function MenuGroup:new_button(name, callback) end

--- Creates a list widget within the group that reflects the state of the provided reference table.
--- This function initializes a list that dynamically updates its content to mirror any changes made to the reference table.
--- This allows for real-time updates and interactions based on the table's data.
---@param name string The name of the new list widget.
---@param ref_table table The reference table containing elements that populate the list initially. Any changes to this table will dynamically update the list's content.
---@return MenuList Returns the new list as a MenuList object, which can be further configured.
function MenuGroup:new_table_list(name, ref_table) end

--- Creates a dynamic list widget within the group.
--- This function initializes a list where items can be dynamically added or removed after its creation.
---@param name string The name of the new dynamic list widget.
---@return MenuList Returns the new dynamic list as a MenuList object, which can be further configured.
function MenuGroup:new_list(name) end

--- Creates an input field within this group.
--- The input field can include an initial value and a hint that appears when the field is empty.
---@param name string The name of the input field.
---@param hint string? Optional hint text that appears in the input field when it is empty.
---@param init string? Initial text to populate the input field with.
---@return MenuWidget Returns an input field widget if creation was successful.
function MenuGroup:new_input(name, hint, init) end

--- Creates a visual separator within this group.
--- This function adds a simple line to visually distinguish between sections of the UI.
---@return MenuWidget Returns a separator widget if creation was successful.
function MenuGroup:new_separator() end

--- Creates a hotkey widget within this group.
---@param name string The name of the hotkey widget.
---@param default_key integer? The default key code to be set in the hotkey widget.
---@return MenuWidget Returns a hotkey widget if creation was successful.
function MenuGroup:new_hotkey(name, default_key) end

--- Creates a hasher widget within this group.
--- This widget allows users to input text and automatically generates a hash of the input.
---@param name string The name of the hasher widget.
---@param hint string? An optional hint text that appears in the hasher input field when it is empty.
---@return MenuWidget Returns a hasher widget if creation was successful.
function MenuGroup:new_hasher(name, hint) end

--- Sets a visibility callback for this group.
--- The callback must return a boolean or a number (non-zero for true, zero for false).
--- If an invalid value or type is returned by the callback, or if an error occurs in the callback, visibility defaults to false.
---@param callback function A Lua function that determines the visibility of the group.
---@return MenuGroup Returns the group object itself.
function MenuGroup:set_visibility_callback(callback) end

--- Retrieves the minimum drawing position of the specified groupbox region.
-- This function returns the coordinate based on the specified region of the groupbox.
-- Note: This method should only be used when the menu is active and the groupbox is currently being rendered
-- (i.e., the page is open, the groupbox is not invisible or hidden, etc.). Otherwise, 0.0, 0.0 will be returned.
-- @param rect GroupRect The region of the groupbox to get the min coordinate.
-- @return number, number The x and y coordinates of the minimum drawing position.
function MenuGroup:get_min(rect) end

--- Retrieves the maximum drawing position of the specified groupbox region.
-- This function returns the coordinate based on the specified region of the groupbox.
-- Note: This method should only be used when the menu is active and the groupbox is currently being rendered
-- (i.e., the page is open, the groupbox is not invisible or hidden, etc.). Otherwise, 0.0, 0.0 will be returned.
-- @param rect GroupRect The region of the groupbox to get the max coordinate.
-- @return number, number The x and y coordinates of the maximum drawing position.
function MenuGroup:get_max(rect) end

--- Retrieves the position of the arrow in the groupbox.
-- This function returns the coordinates (x, y) of the arrow used to toggle visibility of the groupbox contents.
-- The arrow is drawn as part of the groupbox and is used to hide or reveal the contents of the groupbox.
-- Note: This method should only be used when the menu is active and the groupbox is currently being rendered
-- (i.e., the page is open, the groupbox is not invisible or hidden, etc.). Otherwise, 0.0, 0.0 will be returned.
-- @return number, number The x and y coordinates of the arrow.
function MenuGroup:get_arrow_pos() end

---@class MenuWidget
MenuWidget = {}

--- Retrieves the current value of a widget.
---@return any Returns the current value of the widget.
function MenuWidget:get() end

--- Sets a new value to a widget.
---@param value any The value to set to the widget.
---@return MenuWidget Returns the widget itself for method chaining.
function MenuWidget:set(value) end

--- Returns the parent of the widget.
---@return MenuGroup Returns the parent group of the widget.
function MenuWidget:get_parent() end

--- Retrieves the type name of the widget.
---@return string Returns the type name of the widget.
function MenuWidget:get_type() end

--- Checks if the widget is enabled.
---@return boolean Returns true if the widget is enabled, false otherwise.
function MenuWidget:is_enabled() end

--- Sets the enabled state of the widget.
---@param value boolean The enabled state to set.
---@return MenuWidget Returns the widget itself for method chaining.
function MenuWidget:set_enabled(value) end

--- Checks if the widget is visible.
---@return boolean Returns true if the widget is visible, false otherwise.
function MenuWidget:is_visible() end

--- Sets the visibility of the widget.
---@param value boolean The visibility state to set.
---@return MenuWidget Returns the widget itself for method chaining.
function MenuWidget:set_visible(value) end

--- Attaches a color picker to the widget that modifies the referenced color.
---@param color Color The color object whose values will be modified by the color picker.
---@return MenuWidget Returns the widget itself for method chaining.
function MenuWidget:set_color_picker(color) end

--- Attaches a hint text to the widget.
---@param text string The hint text to display.
---@return MenuWidget Returns the widget itself for method chaining.
function MenuWidget:set_hint(text) end

--- Sets a callback to control the visibility of the widget based on custom logic.
--- If nil is passed, the callback is reset.
---@param callback function? The function to determine visibility. Returns bool (true to draw the widget, false to not draw it).
---@return MenuWidget Returns the widget itself for method chaining.
--- Usage example:
--- widget:set_visibility_callback(function()
---     return true -- Always draw the widget
--- end)
function MenuWidget:set_visibility_callback(callback) end

--- Sets a callback to control the enabled state of the widget based on custom logic.
--- If nil is passed, the callback is reset.
---@param callback function? The function to determine if the widget is enabled. Returns bool (true if enabled, false if not).
---@return MenuWidget Returns the widget itself for method chaining.
--- Usage example:
--- widget:set_enabled_callback(function()
---     return false -- Widget is always disabled
--- end)
function MenuWidget:set_enabled_callback(callback) end

--- Sets a callback for dynamic label management of the widget.
--- If nil is passed, the callback is reset.
---@param callback function? The function to generate the label text. Returns string.
---@return MenuWidget Returns the widget itself for method chaining.
--- Usage example:
--- widget:set_label_callback(function()
---     return "Dynamic Label" -- Set a dynamic label
--- end)
function MenuWidget:set_label_callback(callback) end

--- Sets a callback that is called when the mouse cursor hovers over the widget.
--- If nil is passed, the callback is reset.
---@param callback function? The callback to be invoked. Takes coordinates x and y as parameters (number x, number y).
---@return MenuWidget Returns the widget itself for method chaining.
--- Usage example:
--- widget:set_hovered_callback(function(x, y)
---     print("Mouse hovered at: ", x, y) -- Log mouse coordinates
--- end)
function MenuWidget:set_hovered_callback(callback) end

--- Sets a data handling callback for the widget that allows replacing the internal data pointer.
--- This function allows custom data management by returning a pointer to the data used by the widget.
--- If nil is passed, the callback is reset.
---@param callback function? The function to manage widget data. It should return a pointer to the data (returns void*).
---@return MenuWidget Returns the widget itself for method chaining.
--- Usage example:
--- widget:set_data_callback(function()
---     local userdata = {} -- Create a new data structure
---     return userdata -- Replace widget's internal data pointer
--- end)
function MenuWidget:set_data_callback(callback) end

--- Sets a callback that triggers when the widget's data changes.
--- If nil is passed, the callback is reset.
---@param callback function? The function to execute upon data change. Sends the new data value as the first argument.
---@return MenuWidget Returns the widget itself for method chaining.
--- Usage example:
--- widget:set_on_changed_callback(function(data)
---     print("Data changed to: ", data) -- Log the change of data
--- end)
function MenuWidget:set_on_changed_callback(callback) end

--- Retrieves the unique identifier of a MenuWidget.
--- @return number The unique identifier of the widget, or 0/4294967295 if the widget is not valid.
--- Example result: 609258681
function MenuWidget:get_uuid() end

--- Retrieves the label of a MenuWidget.
--- @return string|nil The label of the widget if it has one, or nil if the widget does not have a label or is not valid.
--- Example result: 'Godmode'
function MenuWidget:get_label() end

--- Retrieves the full hierarchical label of a MenuWidget.
--- This includes the full path from the root to the widget based on its menu hierarchy.
--- @return string|nil The full hierarchical label of the widget if it has one, or nil if the widget does not have a label or is not valid.
--- Example result: 'Self > MAIN > Modifiers > Godmode'
function MenuWidget:get_deep_label() end

--- Retrieves the minimum drawing position of the widget.
-- This function returns the top-left corner (the starting position) of the widget.
-- Note: This method should only be used when the menu is active and the widget is currently being rendered
-- (i.e., the page is open, the widget is not invisible or hidden, etc.). Otherwise, 0.0, 0.0 will be returned.
-- @return number, number The x and y coordinates of the minimum drawing position.
function MenuWidget:get_min() end

--- Retrieves the maximum drawing position of the widget.
-- This function returns the bottom-right corner (the ending position) of the widget.
-- Note: This method should only be used when the menu is active and the widget is currently being rendered
-- (i.e., the page is open, the widget is not invisible or hidden, etc.). Otherwise, 0.0, 0.0 will be returned.
-- @return number, number The x and y coordinates of the maximum drawing position.
function MenuWidget:get_max() end

---@class MenuList
MenuList = {}

--- Sets a getter callback for the list, which defines how each list item is represented as a text label.
---@param callback fun(item: number):string The function to generate the label text for each item.
---@return MenuList Returns the list itself for method chaining.
function MenuList:set_getter_callback(callback) end

--- Sets a counter callback for the list, which defines the number of items in the list.
---@param callback fun():number The function to count the total number of items in the list.
---@return MenuList Returns the list itself for method chaining.
function MenuList:set_counter_callback(callback) end

--- Sets a click callback for the list, which defines the action taken when an item is clicked.
---@param callback fun(item: number) The function to execute when an item is clicked.
---@return MenuList Returns the list itself for method chaining.
function MenuList:set_click_callback(callback) end

--- Sets a selected callback for the list, which checks if the specified item is selected.
---@param callback fun(item: number):bool The function to determine if an item is selected.
---@return MenuList Returns the list itself for method chaining.
function MenuList:set_selected_callback(callback) end

--- Sets a hovered callback for the list, which defines the action taken when an item is hovered over.
---@param callback fun(item: number, caption: string, x: number, y: number) The function to execute when an item is hovered over.
---@return MenuList Returns the list itself for method chaining.
function MenuList:set_hovered_callback(callback) end

--- Sets the dimensions of the list.
---@param width number The width of the list.
---@param height number The height of the list.
function MenuList:set_sizes(width, height) end

--- Enables or disables the use of a search bar within the list.
---@param use bool Whether to use a search bar.
---@return MenuList Returns the list itself for method chaining.
function MenuList:set_use_search_bar(use) end

--- Sets the placeholder text for the search bar in the list, if one is used.
---@param text string The placeholder text for the search bar.
---@return MenuList Returns the list itself for method chaining.
function MenuList:set_search_bar_text(text) end

--- Checks if a specific item is selected in the list.
---@param item number The index of the item to check.
---@return boolean Returns true if the item is selected, false otherwise.
function MenuList:is_item_selected(item) end

--- Retrieves the indices of all selected items in the list.
---@return table Returns a table containing the indices of all selected items.
function MenuList:get_selected_items() end

--- Retrieves the text lines of all selected items in the list.
--- This function constructs a table containing the text for each selected item in the list. If no items are selected or an error occurs, it returns an empty table.
---@return table Returns a table with the texts of the selected items. Each entry in the table corresponds to the text of one selected item.
function MenuList:get_selected_items_lines() end

--- Retrieves the text associated with a specific item in the list.
--- This function gets the text of the item at the specified index. If the item does not exist or an error occurs, it returns an empty string.
---@param item number The index of the item from which to retrieve the text.
---@return string Returns the text of the specified item. If the item is not found, returns an empty string.
function MenuList:get_item_text(item) end