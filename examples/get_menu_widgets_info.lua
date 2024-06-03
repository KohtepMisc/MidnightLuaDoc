--[[
	This Lua script demonstrates how to print details of all menu widgets including their UUID, deep label, type, and value.
]]

function print_all_menu_widgets()
    local allWidgets = ui.get_all_widgets()

    for i, widget in ipairs(allWidgets) do
        -- 'Self > MAIN > Modifiers > Godmode'
        local deepLabel = widget:get_deep_label() or "<not found>"

        print("Widget " .. i .. ": UUID = " .. widget:get_uuid() .. 
              ", Deep Label = " .. deepLabel .. 
              ", Type = " .. widget:get_type() .. 
              ", Value = ", widget:get())
    end
end

local called = false

-- It's important to obtain any widget only when the UI is ready and being drawn by the product,
-- when all the menu items are ready for use. For this, you can use the 'on_draw_ui' event.
events.on_draw_ui(function()
    if not called then
        print_all_menu_widgets()
        called = true
    end
end)