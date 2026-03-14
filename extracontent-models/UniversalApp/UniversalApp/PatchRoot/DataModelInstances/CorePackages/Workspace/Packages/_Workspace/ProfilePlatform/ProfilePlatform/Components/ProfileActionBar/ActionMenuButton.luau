local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Button_0 = v2.Button;
local l_Menu_0 = v2.Menu;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_FillBehavior_0 = v2.Enums.FillBehavior;
local l_InputSize_0 = v2.Enums.InputSize;
local l_PopoverAlign_0 = v2.Enums.PopoverAlign;
local l_PopoverSide_0 = v2.Enums.PopoverSide;
return function(v10) --[[ Line: 23 ]] --[[ Name: ActionMenuButton ]]
    -- upvalues: v1 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy), l_InputSize_0 (copy), l_Menu_0 (copy), l_PopoverAlign_0 (copy), l_PopoverSide_0 (copy)
    local v11, v12 = v1.useState(false);
    local v13 = v1.useRef(nil);
    local v14 = v10.buttonRef or v13;
    local v16 = v1.useCallback(function() --[[ Line: 28 ]]
        -- upvalues: v12 (copy), v11 (copy), v10 (copy)
        v12(function(v15) --[[ Line: 29 ]]
            return not v15;
        end);
        if not v11 and v10.onMenuOpened then
            v10.onMenuOpened();
        end;
    end, {
        v11, 
        v10.onMenuOpened
    });
    local v17 = v1.useCallback(function() --[[ Line: 37 ]]
        -- upvalues: v12 (copy)
        v12(false);
    end, {});
    local v18 = v1.useCallback(function() --[[ Line: 41 ]]
        -- upvalues: v12 (copy)
        v12(false);
    end, {});
    return v1.createElement(v1.Fragment, nil, {
        TriggerButton = v1.createElement(l_Button_0, {
            onActivated = v16, 
            text = v10.text, 
            variant = v10.variant or l_ButtonVariant_0.Emphasis, 
            width = UDim.new(1, 0), 
            fillBehavior = l_FillBehavior_0.Fill, 
            size = l_InputSize_0.Medium, 
            ref = v14, 
            LayoutOrder = v10.LayoutOrder
        }), 
        ActionMenu = if v11 then v1.createElement(l_Menu_0, {
            align = l_PopoverAlign_0.Start, 
            anchorRef = v14, 
            items = v10.menuItems, 
            isOpen = true, 
            onActivated = v18, 
            onPressedOutside = v17, 
            side = l_PopoverSide_0.Top, 
            size = l_InputSize_0.Medium
        }) else nil
    });
end;