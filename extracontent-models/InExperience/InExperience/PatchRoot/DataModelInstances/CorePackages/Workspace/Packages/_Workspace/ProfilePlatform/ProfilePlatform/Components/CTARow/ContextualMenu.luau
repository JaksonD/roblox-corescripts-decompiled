local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Components.CTARow.Types);
local l_CoreGui_0 = game:GetService("CoreGui");
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Dash);
local v6 = require(l_Parent_0.Foundation);
local l_useIsSpatial_0 = require(l_Parent_0.Responsive).useIsSpatial;
local l_Menu_0 = v6.Menu;
local l_OverlayProvider_0 = v6.OverlayProvider;
local l_PopoverAlign_0 = v6.Enums.PopoverAlign;
local l_InputSize_0 = v6.Enums.InputSize;
local function _() --[[ Line: 30 ]] --[[ Name: getVROverlaySurfaceGui ]]
    -- upvalues: l_CoreGui_0 (copy)
    local l_LuaAppScreenGui_0 = l_CoreGui_0:FindFirstChild("LuaAppScreenGui");
    if l_LuaAppScreenGui_0 then
        return (l_LuaAppScreenGui_0:FindFirstChild("MainAppScreen_SurfaceGui"));
    else
        return nil;
    end;
end;
local function v18(v14) --[[ Line: 38 ]] --[[ Name: convertToMenuItems ]]
    -- upvalues: v5 (copy)
    return v5.map(v14, function(v15) --[[ Line: 41 ]]
        -- upvalues: v5 (ref)
        return {
            items = v5.map(v15.items, function(v16) --[[ Line: 43 ]]
                local l_displayValue_0 = v16.displayValue;
                return {
                    id = v16.id, 
                    onActivated = v16.onActivated, 
                    isDisabled = v16.isDisabled, 
                    text = l_displayValue_0.text or "", 
                    icon = l_displayValue_0.icon
                };
            end)
        };
    end);
end;
return function(v19) --[[ Line: 58 ]] --[[ Name: ContextualMenu ]]
    -- upvalues: l_useIsSpatial_0 (copy), v4 (copy), l_CoreGui_0 (copy), v18 (copy), l_OverlayProvider_0 (copy), l_Menu_0 (copy), l_PopoverAlign_0 (copy), l_InputSize_0 (copy)
    local v20 = l_useIsSpatial_0();
    local v22 = v4.useMemo(function() --[[ Line: 60 ]]
        -- upvalues: v20 (copy), l_CoreGui_0 (ref)
        if v20 then
            local l_LuaAppScreenGui_1 = l_CoreGui_0:FindFirstChild("LuaAppScreenGui");
            if l_LuaAppScreenGui_1 then
                return (l_LuaAppScreenGui_1:FindFirstChild("MainAppScreen_SurfaceGui"));
            else
                return nil;
            end;
        else
            return nil;
        end;
    end, {
        v20
    });
    local v23 = v4.useMemo(function() --[[ Line: 64 ]]
        -- upvalues: v18 (ref), v19 (copy)
        return v18(v19.menuItems);
    end, {
        v19.menuItems
    });
    return (v4.createElement(l_OverlayProvider_0, {
        gui = v22
    }, {
        Menu = v4.createElement(l_Menu_0, {
            isOpen = v19.isOpen, 
            align = v19.align or l_PopoverAlign_0.End, 
            anchorRef = v19.anchorRef, 
            items = v23, 
            onPressedOutside = v19.onPressedOutside, 
            ref = v19.menuRef, 
            size = l_InputSize_0.Medium
        })
    }));
end;