local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("AppShortcutBar").Parent;
local v3 = require(l_Parent_0.Responsive);
local l_useProperty_0 = require(l_Parent_0.GuiObjectUtils).useProperty;
return function(v5, v6) --[[ Line: 11 ]] --[[ Name: useIsStickyShortcutBarEnabled ]]
    -- upvalues: l_GuiService_0 (copy), l_UserInputService_0 (copy), v3 (copy), l_useProperty_0 (copy)
    local v7 = v5 or l_GuiService_0;
    local v8 = v6 or l_UserInputService_0;
    local v9 = v3.usePreferredInput();
    local v10 = v3.useOrientation();
    local v11 = l_useProperty_0(v8, "TouchEnabled");
    local v12 = l_useProperty_0(v8, "KeyboardEnabled");
    local v13 = l_useProperty_0(v7, "ViewportDisplaySize");
    if (v9 == v3.Input.Directional or v12) and v10 == v3.Keys.Landscape and (v11 or v13 ~= Enum.DisplaySize.Large) then
        return true;
    else
        return false;
    end;
end;