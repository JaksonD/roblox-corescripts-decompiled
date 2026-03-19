local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local l_useIsSpatial_0 = require(l_Parent_0.Responsive).useIsSpatial;
local l_FFlagProfileFixMenuNavigation_0 = require(l_Parent_0.SharedFlags).FFlagProfileFixMenuNavigation;
local l_PopoverSide_0 = v4.Enums.PopoverSide;
local l_PopoverAlign_0 = v4.Enums.PopoverAlign;
local l_InputSize_0 = v4.Enums.InputSize;
local l_Menu_0 = v4.Menu;
local l_OverlayProvider_0 = v4.OverlayProvider;
local function _() --[[ Line: 38 ]] --[[ Name: getVROverlaySurfaceGui ]]
    -- upvalues: l_FFlagProfileFixMenuNavigation_0 (copy), l_CoreGui_0 (copy)
    if l_FFlagProfileFixMenuNavigation_0 then
        local l_LuaAppScreenGui_0 = l_CoreGui_0:FindFirstChild("LuaAppScreenGui");
        if l_LuaAppScreenGui_0 then
            return (l_LuaAppScreenGui_0:FindFirstChild("MainAppScreen_SurfaceGui"));
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
return function(v14) --[[ Line: 50 ]] --[[ Name: ProfileContextualMenu ]]
    -- upvalues: l_FFlagProfileFixMenuNavigation_0 (copy), l_useIsSpatial_0 (copy), l_CoreGui_0 (copy), l_PopoverSide_0 (copy), v3 (copy), l_OverlayProvider_0 (copy), l_Menu_0 (copy), l_PopoverAlign_0 (copy), l_InputSize_0 (copy)
    local v15;
    if l_FFlagProfileFixMenuNavigation_0 and l_useIsSpatial_0() then
        if l_FFlagProfileFixMenuNavigation_0 then
            local l_LuaAppScreenGui_1 = l_CoreGui_0:FindFirstChild("LuaAppScreenGui");
            v15 = if l_LuaAppScreenGui_1 then l_LuaAppScreenGui_1:FindFirstChild("MainAppScreen_SurfaceGui") else nil;
        else
            v15 = nil;
        end;
    else
        v15 = nil;
    end;
    local v17 = if v14.screenSize.Y / 2 < v14.rootElementPosition.Y then l_PopoverSide_0.Top else l_PopoverSide_0.Bottom;
    local v18 = nil;
    if v17 == l_PopoverSide_0.Top then
        local v19 = v14.screenSize.X / v14.screenSize.Y;
        v18 = -(v14.screenSize.Y - v14.rootElementPosition.Y) + -20;
        local v20 = false;
        if v19 >= 1.3 then
            v20 = v19 < 1.7;
        end;
        if v14.screenSize.Y > 700 and not v20 then
            v18 = v18 + v14.screenSize.Y * 0.05;
        end;
    else
        v18 = v14.rootElementPosition.Y + 60;
    end;
    if l_FFlagProfileFixMenuNavigation_0 then
        return (v3.createElement(l_OverlayProvider_0, {
            gui = v15
        }, {
            Menu = v3.createElement(l_Menu_0, {
                align = l_PopoverAlign_0.End, 
                anchorRef = v14.rootElementRef, 
                isOpen = v14.isOpen == nil or v14.isOpen, 
                items = v14.buttonProps, 
                onPressedOutside = v14.onDismiss, 
                side = v17, 
                size = l_InputSize_0.Medium, 
                ref = if l_FFlagProfileFixMenuNavigation_0 then v14.menuRef else nil
            })
        }));
    else
        return (v3.createElement(l_Menu_0, {
            align = l_PopoverAlign_0.End, 
            anchorRef = v14.rootElementRef, 
            isOpen = v14.isOpen == nil or v14.isOpen, 
            items = v14.buttonProps, 
            onPressedOutside = v14.onDismiss, 
            side = v17, 
            size = l_InputSize_0.Medium, 
            ref = if l_FFlagProfileFixMenuNavigation_0 then v14.menuRef else nil
        }));
    end;
end;