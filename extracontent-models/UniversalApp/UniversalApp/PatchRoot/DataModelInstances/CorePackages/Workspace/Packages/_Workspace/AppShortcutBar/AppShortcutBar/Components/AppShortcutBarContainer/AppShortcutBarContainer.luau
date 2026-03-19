local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppShortcutBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.AppShortcutBar);
local v4 = require(l_script_FirstAncestor_0.Components.AppStickyShortcutBar);
local v5 = require(script.Parent.useAppShortcutBarProps);
local l_useIsStickyShortcutBarEnabled_0 = require(l_script_FirstAncestor_0.Hooks).useIsStickyShortcutBarEnabled;
local l_FFlagLuaAppEnableStickyShortcutBar_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableStickyShortcutBar;
AppShortcutBarContainer = function() --[[ Line: 13 ]] --[[ Name: AppShortcutBarContainer ]]
    -- upvalues: v5 (copy), l_FFlagLuaAppEnableStickyShortcutBar_0 (copy), l_useIsStickyShortcutBarEnabled_0 (copy), v2 (copy), v4 (copy), v3 (copy)
    local v8 = v5();
    local v9 = if l_FFlagLuaAppEnableStickyShortcutBar_0 then l_useIsStickyShortcutBarEnabled_0() else nil;
    if l_FFlagLuaAppEnableStickyShortcutBar_0 and v9 then
        return v2.createElement(v4, v8);
    else
        return v2.createElement(v3, v8);
    end;
end;
return AppShortcutBarContainer;